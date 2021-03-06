#include "vortex_pinnacle.h"
#include "ScriptPCH.h"

enum Spells
{
    // Altairus
    SPELL_CHILLING_BREATH           = 88308,
    SPELL_CHILLING_BREATH_SCRIPT    = 88322,
    SPELL_CALL_THE_WIND_ALTAIRUS    = 88276,
    SPELL_LIGHTNING_BLAST           = 88357,

    // Air Current
    SPELL_CALL_THE_WIND_AURA        = 88244,
    SPELL_UPWIND_OF_ALTAIRUS        = 88282,
    SPELL_DOWNWIND_OF_ALTAIRUS      = 88286,

    // Wind Stalker
    SPELL_CALL_THE_WIND             = 88772,

    // Cataclysm Stalker
    SPELL_SAFE_ZONE                 = 88350,

    // Twister
    SPELL_TWISTER_AURA              = 88313,
};

enum Events
{
    EVENT_CHILLING_BREATH = 1,
    EVENT_CALL_THE_WIND,
    EVENT_LIGHTNING_BLAST,
};

enum Texts
{
    SAY_ANNOUNCE_WIND_DIRECTION = 0,
    SAY_ANNOUNCE_OUT_OF_RANGE   = 1,
};

class SafeZoneCheck
{
public:
    SafeZoneCheck() { }

    bool operator()(WorldObject* object)
    {
        return (object->ToUnit()->HasAura(SPELL_SAFE_ZONE));
    }
};

class boss_altairus : public CreatureScript
{
public:
    boss_altairus() : CreatureScript("boss_altairus") { }

    struct boss_altairusAI : public BossAI
    {
        boss_altairusAI(Creature* creature) : BossAI(creature, DATA_ALTAIRUS)
        {
        }

        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            if (IsHeroic())
                ActivateTwisters(true);
            instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
            events.ScheduleEvent(EVENT_CHILLING_BREATH, 12000);
            events.ScheduleEvent(EVENT_CALL_THE_WIND, 6000);
            events.ScheduleEvent(EVENT_LIGHTNING_BLAST, 1000);
            if (Creature* stalker = me->FindNearestCreature(NPC_INVISIBLE_STALKER, 150.0f, true))
                stalker->CastSpell(stalker, SPELL_SAFE_ZONE, true);
        }

        void JustDied(Unit* /*Killer*/)
        {
            _JustDied();
            ActivateTwisters(false);
            instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
            me->DespawnCreaturesInArea(NPC_INVISIBLE_STALKER, 100.0f);
        }

        void EnterEvadeMode()
        {
            _EnterEvadeMode();
            events.Reset();
            ActivateTwisters(false);
            instance->SetBossState(DATA_ALTAIRUS, FAIL);
            instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
            me->GetMotionMaster()->MoveTargetedHome();
        }

        void ActivateTwisters(bool activate)
        {
            std::list<Creature*> units;
            GetCreatureListWithEntryInGrid(units, me, NPC_TWISTER, 100.0f);
            GetCreatureListWithEntryInGrid(units, me, NPC_AIR_CURRENT, 100.0f);
            if (activate)
            {
                for (std::list<Creature*>::iterator itr = units.begin(); itr != units.end(); ++itr)
                    if ((*itr)->GetEntry() == NPC_TWISTER)
                        (*itr)->AddAura(SPELL_TWISTER_AURA, (*itr));
            }
            else
            {
                for (std::list<Creature*>::iterator itr = units.begin(); itr != units.end(); ++itr)
                    if ((*itr)->GetEntry() == NPC_TWISTER)
                        (*itr)->RemoveAurasDueToSpell(SPELL_TWISTER_AURA);
                    else
                        (*itr)->RemoveAllAuras();

            }
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while(uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_CHILLING_BREATH:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true, 0))
                            DoCast(target, SPELL_CHILLING_BREATH);
                        events.ScheduleEvent(EVENT_CHILLING_BREATH, 13000);
                        break;
                    case EVENT_CALL_THE_WIND:
                        Talk(SAY_ANNOUNCE_WIND_DIRECTION);
                        DoCast(SPELL_CALL_THE_WIND_ALTAIRUS);
                        events.ScheduleEvent(EVENT_CALL_THE_WIND, 24000);
                        break;
                    case EVENT_LIGHTNING_BLAST:
                    {
                        std::list<Player*> targets = me->GetNearestPlayersList(400.0f, true);
                        if (targets.empty())
                        {
                            events.ScheduleEvent(EVENT_LIGHTNING_BLAST, 1200);
                            return;
                        }

                        targets.remove_if(SafeZoneCheck());
                        if (!targets.empty())
                            if (Unit* target = Trinity::Containers::SelectRandomContainerElement(targets))
                            {
                                me->CastStop();
                                Talk(SAY_ANNOUNCE_OUT_OF_RANGE, target->GetGUID());
                                DoCast(target, SPELL_LIGHTNING_BLAST);
                            }

                        events.ScheduleEvent(EVENT_LIGHTNING_BLAST, 1200);
                        break;
                    }
                    default:
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_altairusAI (creature);
    }
};

class npc_wind_caster : public CreatureScript
{
public:
    npc_wind_caster() : CreatureScript("npc_wind_caster") { }

    struct npc_wind_casterAI : public ScriptedAI
    {
        npc_wind_casterAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        EventMap events;

        void InitializeAI()
        {
        }

        void UpdateAI(uint32 diff)
        {

        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_wind_casterAI(creature);
    }
};

class spell_vp_chilling_breath : public SpellScriptLoader
{
public:
    spell_vp_chilling_breath() : SpellScriptLoader("spell_vp_chilling_breath") { }

    class spell_vp_chilling_breath_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_vp_chilling_breath_SpellScript);

        void HandleScriptEffect(SpellEffIndex /*effIndex*/)
        {
            GetHitUnit()->CastSpell(GetHitUnit(), GetSpellInfo()->Effects[EFFECT_0].BasePoints);
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_vp_chilling_breath_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_vp_chilling_breath_SpellScript();
    }
};

class spell_vp_call_the_wind : public SpellScriptLoader
{
    public:
        spell_vp_call_the_wind() : SpellScriptLoader("spell_vp_call_the_wind") { }

        class spell_vp_call_the_wind_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_vp_call_the_wind_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                std::list<WorldObject*>::iterator it = unitList.begin();

                while (it != unitList.end())
                {
                    WorldObject* unit = *it;

                    if (!unit)
                        continue;

                    if (unit->ToUnit()->HasAura(SPELL_CALL_THE_WIND_AURA))
                    {
                        unit->ToUnit()->RemoveAurasDueToSpell(SPELL_CALL_THE_WIND_AURA);
                        it = unitList.erase(it);
                    }
                    else
                        it++;
                }
                Trinity::Containers::RandomResizeList(unitList, 1);
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                if (Unit* target = GetHitUnit())
                    if (Creature* stalker = target->FindNearestCreature(NPC_INVISIBLE_STALKER, 150.0f, true))
                    {
                        stalker->SetFacingToObject(target);
                        stalker->CastWithDelay(500, stalker, SPELL_CALL_THE_WIND);
                        target->CastSpell(target, SPELL_CALL_THE_WIND_AURA, true);
                    }
            }

            void Register()
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_vp_call_the_wind_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnEffectHitTarget += SpellEffectFn(spell_vp_call_the_wind_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_vp_call_the_wind_SpellScript();
        }
};

class spell_vp_call_the_wind_channeled : public SpellScriptLoader
{
public:
    spell_vp_call_the_wind_channeled() : SpellScriptLoader("spell_vp_call_the_wind_channeled") { }

    class spell_vp_call_the_wind_channeled_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_vp_call_the_wind_channeled_SpellScript);

        void SetTarget(WorldObject*& target)
        {
            std::list<Creature*> airCurrents;
            GetCaster()->GetCreatureListWithEntryInGrid(airCurrents, NPC_AIR_CURRENT, 100.0f);
            if (airCurrents.empty())
                return;

            for (std::list<Creature*>::iterator itr = airCurrents.begin(); itr != airCurrents.end(); ++itr)
            {
                if ((*itr)->HasAura(SPELL_CALL_THE_WIND_AURA))
                {
                    target = (*itr);
                    break;
                }
            }
        }

        void Register()
        {
            OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_vp_call_the_wind_channeled_SpellScript::SetTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_vp_call_the_wind_channeled_SpellScript();
    }
};

class spell_vp_upwind_of_altairus : public SpellScriptLoader
{
    public:
        spell_vp_upwind_of_altairus() : SpellScriptLoader("spell_vp_upwind_of_altairus") { }

        class spell_vp_upwind_of_altairus_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_vp_upwind_of_altairus_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                std::list<WorldObject*>::iterator it = unitList.begin();

                if (Unit* caster = GetCaster())
                {
                    while (it != unitList.end())
                    {
                        if (!GetCaster())
                            return;

                        WorldObject* unit = *it;

                        if (!unit)
                            continue;

                        if (unit->isInFront(caster))
                        {
                            unit->ToUnit()->CastSpell(unit->ToUnit(), SPELL_DOWNWIND_OF_ALTAIRUS, true);
                            unit->ToUnit()->RemoveAurasDueToSpell(SPELL_UPWIND_OF_ALTAIRUS);
                            it = unitList.erase(it);
                        }
                        else
                        {
                            unit->ToUnit()->RemoveAurasDueToSpell(SPELL_DOWNWIND_OF_ALTAIRUS);
                            it++;
                        }
                    }
                }
            }

            void Register()
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_vp_upwind_of_altairus_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_vp_upwind_of_altairus_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_vp_upwind_of_altairus_SpellScript();
        }
};

void AddSC_boss_altairus()
{
    new boss_altairus();
    new npc_wind_caster();
    new spell_vp_chilling_breath();
    new spell_vp_call_the_wind();
    new spell_vp_call_the_wind_channeled();
    new spell_vp_upwind_of_altairus();
}
