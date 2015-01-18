#include "ScriptPCH.h"
#include "bastion_of_twilight.h"

/* Automatic rescheduling if creature is already casting */
#define RESCHEDULE_IF_CASTING if (me->HasUnitState(UNIT_STATE_CASTING)) { events.ScheduleEvent(eventId, 1); break; }

enum actionId
{
    ACTION_CHECK_CHANNELERS     = 1
};

class npc_bot_twilight_phase_twister : public CreatureScript
{
public:
    npc_bot_twilight_phase_twister() : CreatureScript("npc_bot_twilight_phase_twister")
    {
    }

    struct npc_bot_twilight_phase_twisterAI : public ScriptedAI
    {
        npc_bot_twilight_phase_twisterAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        EventMap events;

        enum eventId
        {
            EVENT_CHANNEL_ORB   = 1,
            EVENT_SHADOW_BOLT
        };

        enum spellId
        {
            SPELL_SHADOW_BOLT   = 95440,
            SPELL_TWISTED_PHASE = 84737
        };

        enum npcId
        {
            NPC_TWILIGHT_ORB    = 42098
        };

        enum pointId
        {
            POINT_EVADE     = 1
        };

        void EnterEvadeMode()
        {
            _EnterEvadeMode();
            me->GetMotionMaster()->MovePoint(POINT_EVADE, x, y, z, true);
            events.CancelEvent(EVENT_SHADOW_BOLT);
        }

        void EnterCombat(Unit* /*who*/)
        {
            events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(2000, 4000));
        }

        void JustReachedHome()
        {
            me->SetFacingTo(o);
        }

        void InitializeAI()
        {
            x = me->GetPositionX();
            y = me->GetPositionY();
            z = me->GetPositionZ();
            o = me->GetOrientation();

            events.ScheduleEvent(EVENT_CHANNEL_ORB, 1000);
        }

        void JustDied(Unit* /*killer*/)
        {
            std::list<Creature*> targets;
            GetCreatureListWithEntryInGrid(targets, me, NPC_TWILIGHT_ORB, 200.0f);
            for (std::list<Creature*>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
            {
                if ((*itr) && me->GetOwner() && me->GetOwner() == (*itr))
                    (*itr)->AI()->DoAction(ACTION_CHECK_CHANNELERS);
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim() && me->isInCombat())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_CHANNEL_ORB:
                    {
                        RESCHEDULE_IF_CASTING;
                        if (me->isInCombat() || me->HasUnitState(UNIT_STATE_CASTING) || me->IsInEvadeMode())
                        {
                            events.RescheduleEvent(EVENT_CHANNEL_ORB, 2000);
                            break;
                        }

                        DoCast(SPELL_TWISTED_PHASE);

                        if (Creature* twilightOrb = me->FindNearestCreature(NPC_TWILIGHT_ORB, 10.0f, true))
                            me->SetOwnerGUID(twilightOrb->GetGUID());

                        events.RescheduleEvent(EVENT_CHANNEL_ORB, 5000);
                        break;
                    }
                    case EVENT_SHADOW_BOLT:
                    {
                        RESCHEDULE_IF_CASTING;
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 80.0f, true))
                            DoCast(target, SPELL_SHADOW_BOLT);
                        events.RescheduleEvent(EVENT_SHADOW_BOLT, urand(4000, 6500));
                        break;
                    }
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }

        protected:
            float x, y, z, o;
    };
    
    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_bot_twilight_phase_twisterAI(creature);
    }
};

class npc_bot_twilight_orb : public CreatureScript
{
public:
    npc_bot_twilight_orb() : CreatureScript("npc_bot_twilight_orb")
    {
    }

    struct npc_bot_twilight_orbAI : public ScriptedAI
    {
        npc_bot_twilight_orbAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        EventMap events;

        enum eventId
        {
            EVENT_PHASED_BURN       = 1,
            EVENT_CHECK_CHANNELERS
        };

        enum spellId
        {
            SPELL_PHASED_BURN   = 85799
        };

        enum orbsGUID
        {
            FIRST_ORB_GUID      = 779410,
            SECOND_ORB_GUID     = 779386,
            THIRD_ORB_GUID      = 779385,
            FOURTH_ORB_GUID     = 779409
        };

        enum npcId
        {
            NPC_TWILIGHT_CHANNELER  = 45267
        };

        void Reset()
        {
            // Bind it only in Bastion of Twilight
            if (me->GetMapId() != 671)
                return;

            noChannelersFound = true;
            me->SetReactState(REACT_PASSIVE);
            events.ScheduleEvent(EVENT_PHASED_BURN, 2000);
            events.ScheduleEvent(EVENT_CHECK_CHANNELERS, 6000);
        }

        void DamageTaken(Unit* attacker, uint32& damage)
        {
            damage = 0;
        }

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_CHECK_CHANNELERS:
                {
                    events.ScheduleEvent(EVENT_CHECK_CHANNELERS, 1);
                    break;
                }
                default:
                    break;
            }
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_PHASED_BURN:
                    {
                        RESCHEDULE_IF_CASTING;
                        DoCast(SPELL_PHASED_BURN);
                        events.RescheduleEvent(EVENT_PHASED_BURN, 10000);
                        break;
                    }
                    case EVENT_CHECK_CHANNELERS:
                    {
                        std::list<Creature*> targets;
                        GetCreatureListWithEntryInGrid(targets, me, NPC_TWILIGHT_CHANNELER, 200.0f);
                        for (std::list<Creature*>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
                        {
                            if ((*itr) && (*itr)->GetOwner() && (*itr)->GetOwner() == me && (*itr)->isAlive())
                            {
                                noChannelersFound = false;
                                break;
                            }
                            else
                                noChannelersFound = true;
                        }

                        if (noChannelersFound == true)
                        {
                            me->CombatStop();
                            me->CastStop();
                            me->AttackStop();
                            me->DespawnOrUnsummon(1000);
                            events.CancelEvent(EVENT_CHECK_CHANNELERS);
                        }
                        else
                            events.RescheduleEvent(EVENT_CHECK_CHANNELERS, 5000);
                        break;
                    }
                    default:
                        break;
                }
            }
        }

        protected:
            bool noChannelersFound;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_bot_twilight_orbAI(creature);
    }
};

void AddSC_bastion_of_twilight()
{
    new npc_bot_twilight_phase_twister();
    new npc_bot_twilight_orb();
}
