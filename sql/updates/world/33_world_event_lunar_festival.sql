UPDATE `game_event` SET `start_time`='2014-01-20 11:00:00' WHERE `eventEntry`=7;

DELETE FROM `game_event_gameobject` WHERE `guid` IN (731634, 731824);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(7, 731634),
(7, 731824);

UPDATE `creature` SET `phaseMask` = '1' WHERE `guid` IN
(1102,
78375,
78381,
78382,
78383,
78384,
91569,
91570,
91571,
91587,
91590,
91638,
200823,
200824,
200825,
200826,
200827,
200828,
200829,
200830,
200831,
200832,
200833,
200834,
200835,
200836,
200837,
200838,
200839,
200840,
200841,
200842,
200843,
200844,
200845,
200846,
200847,
200848,
723205,
725044,
728720,
728721,
728722,
730742,
732634,
732643,
732675,
732997,
733000,
733001,
733002,
733004,
733005,
733006,
736317,
736435,
736436,
736437,
736438,
736439,
736440,
739072,
739073,
739074,
739075,
739076,
739077,
739078,
739079,
739080,
739081,
739082,
739083,
739084,
739085,
739086,
739087,
739088,
739089,
739090,
739091,
739092,
739093,
739094,
739095,
739096,
739097,
739098,
739102,
739113,
739114,
739115,
739116,
739117,
739118,
739119,
739120,
739121,
739122,
739123,
739124,
739125,
739126,
739127,
739128,
739129,
739130,
739131,
739132,
739133,
739134,
739135,
739136,
739137,
739138,
739139,
739140,
739141,
739142,
739143,
739144,
739145,
739146,
739147,
739148,
739149,
739150,
739151,
739152,
739153,
739154,
739155,
739156,
739157,
739158,
739159,
739160,
739161,
739162,
739163,
739164,
739165,
739166,
739167,
739168,
739169,
739170,
739171,
739172,
739173,
739174,
739175,
739180,
739181,
739184,
739185,
739186,
739187,
739188,
739189,
739190,
739191,
739192,
739193,
739202,
739203,
739204,
739205,
739206,
739209,
739210,
739211,
739212,
739213,
739214,
739215,
739216,
739217,
739218,
739219,
739220,
739221,
739222,
739223,
739224,
739225,
739226,
739227,
739228,
739229,
739230,
739231,
739232,
739233,
739234,
739236,
739237,
739254,
760050,
760063,
760088,
760205,
760435,
760436,
760437,
760439,
760442,
760444,
776500,
776501,
776502,
776503,
776504,
776505,
776506,
776507,
776508,
776509,
776510,
776511,
776512,
776513,
776514,
776515,
776516,
776517,
776518,
776519,
776534,
776535,
776536,
776537,
776538,
776539,
776540,
776541,
776542,
776543,
776544,
776545,
776546,
776547,
776548,
776549,
776550,
776551,
776552,
776553,
776556,
776557,
776558,
776559,
776560,
776561,
776563,
777069,
777070,
777071,
777072,
777073,
777074,
777075,
777076,
777077,
777078,
777079,
777080,
777081,
777082,
777083,
777084,
777085,
777086,
777087,
777088,
777089,
777090,
777091);

UPDATE `gameobject` SET `phaseMask` = '1' WHERE `guid` IN
(730325,
730326,
730327,
730328,
730329,
730330,
730331,
730332,
730333,
730334,
730335,
730337,
730339,
730340,
730341,
730342,
730343,
730344,
730345,
730346,
730347,
730348,
730349,
730350,
730351,
730352,
730353,
730354,
730355,
730356,
730357,
730358,
730359,
730360,
730361,
730362,
730363,
730364,
730366,
730367,
730368,
730369,
730370,
730371,
730372,
730373,
730374,
730375,
730376,
730377,
730378,
730379,
730380,
730381,
730382,
730383,
730384,
730385,
730386,
730387,
730388,
730389,
730390,
730391,
730392,
730394,
730395,
730396,
730397,
730398,
730399,
730400,
730401,
730402,
730403,
730404,
730405,
730406,
730407,
730408,
730409,
730410,
730411,
730412,
730413,
730414,
730415,
730416,
730417,
730418,
730419,
730420,
730421,
730422,
730423,
730424,
730425,
730426,
730427,
730428,
730430,
730431,
730433,
730434,
730435,
730436,
730437,
730438,
730439,
730440,
730441,
730442,
730443,
730444,
730445,
730446,
730447,
730448,
730449,
730450,
730451,
730452,
730453,
730454,
730455,
730456,
730457,
730458,
730459,
730460,
730461,
730462,
730463,
730464,
730465,
730466,
730467,
730468,
730469,
730470,
730471,
730473,
730477,
730478,
730479,
730480,
730481,
730483,
730484,
730485,
730486,
730487,
730488,
730489,
730490,
730491,
730492,
730493,
730494,
730495,
730496,
730497,
730499,
730501,
730502,
730503,
730505,
730507,
730508,
730509,
730510,
730511,
730512,
730513,
730514,
730515,
730516,
730517,
730518,
730520,
730521,
730522,
730523,
730524,
730526,
730528,
730529,
730530,
730531,
730532,
730533,
730534,
730535,
730536,
730537,
730538,
730539,
730540,
730541,
730542,
730543,
730544,
730545,
730546,
730547,
730548,
730549,
730550,
730551,
730552,
730553,
730554,
730556,
730557,
730558,
730559,
730560,
730561,
730562,
730563,
730564,
730565,
730566,
730567,
730568,
730569,
730570,
730571,
730572,
730573,
730574,
730575,
730576,
730577,
730578,
730579,
730580,
730581,
730582,
730583,
730584,
730585,
730586,
730587,
730588,
730589,
730590,
730591,
730592,
730593,
730594,
730595,
730596,
730597,
730598,
730599,
730600,
730601,
730602,
730603,
730604,
730605,
730606,
730607,
730608,
730609,
730610,
730612,
730613,
730614,
730615,
730616,
730617,
730618,
730619,
730620,
730621,
730622,
730623,
730625,
730626,
730627,
730628,
730629,
730630,
730631,
730632,
730633,
730634,
730635,
730636,
730637,
730638,
730640,
730641,
730642,
730643,
730644,
730645,
730646,
730647,
730648,
730649,
730650,
730651,
730652,
730653,
730656,
730681,
730682,
730683,
730684,
730691,
730694,
730695,
730701,
730702,
730703,
730704,
730705,
730706,
730707,
730708,
730709,
730710,
730711,
730712,
730713,
730714,
730715,
730716,
730717,
730722,
730723,
730724,
730725,
730726,
730727,
730728,
730729,
730730,
730731,
730732,
730733,
730734,
730735,
730736,
730737,
730738,
730739,
730740,
730741,
730742,
730743,
730744,
730745,
730746,
730747,
730748,
730749,
730750,
730751,
730752,
730753,
730754,
730755,
730756,
730757,
730758,
730759,
730760,
730761,
730762,
730763,
730764,
730765,
730766,
730767,
730768,
730769,
730770,
730771,
730772,
730773,
730774,
730775,
730776,
730777,
730778,
730779,
730780,
730781,
730782,
730783,
730784,
730786,
730787,
730788,
730789,
730790,
730791,
730792,
730793,
730794,
730795,
730796,
730797,
730798,
730799,
730800,
730801,
730802,
730803,
730804,
730805,
730806,
730807,
730808,
730810,
730811,
730812,
730813,
730814,
730815,
730816,
730817,
730818,
730819,
730820,
730821,
730822,
730823,
730824,
730825,
730826,
730827,
730828,
730829,
730830,
730831,
730832,
730833,
730834,
730835,
730836,
730837,
730838,
730839,
730840,
730841,
730842,
730843,
730844,
730845,
730846,
730847,
730848,
730849,
730850,
730851,
730852,
730853,
730854,
730855,
730856,
730857,
730858,
730859,
730860,
730861,
730862,
730863,
730864,
730865,
730866,
730867,
730868,
730869,
730870,
730871,
730872,
730873,
730874,
730875,
730876,
730878,
730879,
730880,
730881,
730882,
730883,
730884,
730885,
730886,
730887,
730890,
730891,
730892,
730893,
730894,
730895,
730896,
730897,
730898,
730899,
730900,
730901,
730903,
730904,
730905,
730906,
730907,
730908,
730909,
730910,
730911,
730912,
730913,
730914,
730915,
730916,
730917,
730918,
730919,
730920,
730921,
730922,
730923,
730924,
730925,
730927,
730928,
730929,
730930,
730931,
730932,
730933,
730934,
730935,
730936,
730937,
730938,
730939,
730941,
730942,
730943,
730944,
730945,
730946,
730947,
730950,
730951,
730952,
730953,
730954,
730955,
730956,
730957,
730958,
730959,
730960,
730961,
730962,
730963,
730964,
730965,
730966,
730967,
730968,
730969,
730970,
730971,
730972,
730974,
730976,
730977,
730978,
730979,
730980,
730981,
730982,
730984,
730988,
730989,
730990,
730991,
730992,
730993,
730994,
730995,
730996,
730997,
730998,
730999,
731001,
731003,
731004,
731005,
731006,
731008,
731009,
731010,
731011,
731012,
731013,
731016,
731017,
731018,
731019,
731020,
731021,
731022,
731023,
731024,
731025,
731026,
731027,
731030,
731031,
731032,
731033,
731034,
731035,
731036,
731037,
731038,
731039,
731040,
731042,
731043,
731044,
731048,
731049,
731050,
731051,
731052,
731053,
731054,
731055,
731056,
731057,
731058,
731059,
731060,
731061,
731063,
731064,
731065,
731067,
731068,
731069,
731070,
731071,
731072,
731073,
731074,
731075,
731076,
731077,
731078,
731079,
731080,
731081,
731083,
731085,
731086,
731087,
731088,
731089,
731091,
731092,
731093,
731094,
731095,
731096,
731097,
731098,
731099,
731100,
731101,
731102,
731103,
731104,
731105,
731107,
731108,
731109,
731110,
731112,
731113,
731114,
731115,
731119,
731120,
731121,
731122,
731123,
731124,
731126,
731127,
731128,
731129,
731130,
731132,
731133,
731134,
731135,
731136,
731137,
731138,
731139,
731140,
731141,
731142,
731143,
731144,
731145,
731146,
731147,
731148,
731149,
731150,
731151,
731152,
731153,
731154,
731155,
731156,
731157,
731158,
731159,
731160,
731161,
731162,
731163,
731174,
731175,
731176,
731177,
731178,
731180,
731181,
731182,
731183,
731184,
731185,
731186,
731187,
731188,
731189,
731190,
731191,
731192,
731193,
731194,
731195,
731196,
731197,
731198,
731199,
731200,
731201,
731202,
731203,
731205,
731206,
731207,
731208,
731209,
731210,
731211,
731212,
731213,
731214,
731215,
731216,
731217,
731218,
731219,
731220,
731221,
731222,
731223,
731224,
731225,
731226,
731227,
731228,
731229,
731230,
731231,
731232,
731233,
731234,
731235,
731236,
731237,
731238,
731239,
731240,
731241,
731242,
731243,
731244,
731245,
731246,
731247,
731249,
731250,
731251,
731252,
731253,
731255,
731256,
731257,
731258,
731259,
731260,
731263,
731264,
731265,
731266,
731268,
731269,
731270,
731271,
731272,
731273,
731274,
731275,
731276,
731277,
731278,
731279,
731280,
731281,
731282,
731283,
731284,
731285,
731286,
731287,
731288,
731289,
731290,
731291,
731292,
731293,
731294,
731295,
731296,
731297,
731298,
731299,
731300,
731301,
731302,
731303,
731304,
731305,
731306,
731307,
731308,
731310,
731311,
731318,
731319,
731321,
731323,
731372,
731373,
731374,
731375,
731389,
731395,
731396,
731397,
731398,
731399,
731400,
731401,
731402,
731403,
731404,
731405,
731406,
731407,
731408,
731409,
731410,
731411,
731412,
731413,
731414,
731415,
731416,
731417,
731418,
731419,
731420,
731421,
731422,
731423,
731424,
731425,
731426,
731427,
731428,
731429,
731430,
731431,
731432,
731433,
731434,
731435,
731436,
731437,
731438,
731439,
731440,
731441,
731442,
731443,
731444,
731445,
731446,
731447,
731448,
731449,
731450,
731451,
731452,
731453,
731454,
731455,
731456,
731458,
731459,
731460,
731462,
731463,
731464,
731465,
731466,
731467,
731468,
731469,
731470,
731471,
731472,
731473,
731474,
731475,
731476,
731477,
731478,
731479,
731480,
731481,
731482,
731483,
731484,
731485,
731487,
731488,
731489,
731490,
731491,
731492,
731493,
731494,
731495,
731496,
731497,
731498,
731499,
731500,
731501,
731502,
731503,
731504,
731506,
731507,
731508,
731509,
731510,
731511,
731512,
731513,
731514,
731515,
731516,
731517,
731518,
731519,
731520,
731521,
731522,
731523,
731524,
731525,
731526,
731527,
731528,
731529,
731530,
731531,
731532,
731533,
731534,
731535,
731536,
731537,
731538,
731539,
731540,
731541,
731542,
731543,
731544,
731545,
731546,
731547,
731548,
731549,
731550,
731551,
731552,
731553,
731554,
731555,
731556,
731557,
731558,
731559,
731560,
731561,
731562,
731563,
731564,
731565,
731566,
731567,
731568,
731569,
731570,
731572,
731573,
731574,
731575,
731576,
731577,
731578,
731579,
731580,
731581,
731582,
731583,
731584,
731585,
731586,
731587,
731588,
731589,
731590,
731591,
731592,
731593,
731594,
731595,
731596,
731597,
731598,
731599,
731600,
731601,
731602,
731603,
731604,
731605,
731606,
731607,
731608,
731609,
731610,
731611,
731612,
731613,
731614,
731615,
731616,
731617,
731618,
731619,
731620,
731621,
731622,
731623,
731624,
731625,
731626,
731627,
731628,
731629,
731631,
731632,
731633,
731635,
731636,
731637,
731638,
731639,
731640,
731641,
731642,
731643,
731644,
731645,
731646,
731647,
731648,
731649,
731650,
731651,
731652,
731653,
731654,
731655,
731656,
731657,
731658,
731659,
731660,
731661,
731662,
731663,
731664,
731665,
731666,
731667,
731668,
731669,
731670,
731671,
731673,
731674,
731675,
731676,
731677,
731678,
731679,
731680,
731681,
731682,
731683,
731684,
731685,
731686,
731687,
731688,
731689,
731690,
731691,
731692,
731693,
731695,
731696,
731697,
731698,
731699,
731701,
731702,
731703,
731704,
731705,
731706,
731707,
731708,
731709,
731711,
731712,
731714,
731715,
731716,
731718,
731719,
731720,
731721,
731722,
731723,
731724,
731725,
731726,
731727,
731728,
731730,
731731,
731732,
731733,
731734,
731735,
731736,
731737,
731738,
731739,
731740,
731741,
731742,
731744,
731745,
731746,
731747,
731748,
731749,
731750,
731752,
731753,
731754,
731755,
731756,
731757,
731758,
731760,
731762,
731763,
731764,
731766,
731767,
731768,
731769,
731770,
731771,
731772,
731773,
731774,
731776,
731777,
731778,
731779,
731780,
731781,
731782,
731783,
731784,
731785,
731786,
731787,
731788,
731789,
731790,
731791,
731792,
731793,
731794,
731796,
731797,
731799,
731800,
731801,
731802,
731803,
731804,
731805,
731806,
731807,
731808,
731809,
731810,
731811,
731812,
731813,
731814,
731815,
731816,
731817,
731818,
731819,
731820,
731821,
731822,
731823,
731825,
731827,
731828,
731830,
731831,
731832,
731833,
731834,
731835,
731836,
731837,
731838,
731839,
731840,
731841,
731842,
731843,
731844,
731845,
731848,
731849,
731853,
731859,
731864,
731865,
731867,
731868,
731869,
731870,
731871,
731872,
731873,
731874,
731875,
731876,
731877,
731878,
731879,
731880,
731881,
731882,
731883,
731884,
731885,
731886,
731887,
731888,
731889,
731890,
731891,
731892,
731893,
731894,
731900,
731906,
731907,
731908,
731909,
731910,
731911,
731912,
731913,
731914,
731915,
731916,
731922,
731923,
731924,
731925,
732014,
732015,
732016,
732027,
732028,
732030,
732031,
732032,
732033,
732034,
732035,
732036,
732038,
732039,
732040,
732062,
732063,
732064,
732065,
732066,
732067,
732068,
732070,
732071,
732072,
732073,
732074,
732075,
732076,
732077,
732078,
732079,
732080,
732081,
732083,
732084,
732085,
732086,
732088,
732089,
732090,
732091,
732093,
732094,
732095,
732096,
732097,
732098,
732099,
732100,
732101,
732102,
732103,
732104,
732105,
732106,
732107,
732108,
732109,
732110,
732111,
732113,
732114,
732115,
732116,
732117,
732118,
732119,
732120,
732121,
732122,
732123,
732124,
732125,
732126,
732127,
732128,
732129,
732130,
732131,
732132,
732133,
732134,
732136,
732137,
732138,
732139,
732140,
732156,
732158,
732159,
732161,
732162,
732163,
732164,
732165,
732166,
732167,
732183,
732184,
732185,
732202,
732203,
732204,
732205,
732220,
732229,
732232,
732247,
732248,
732250,
732252,
732253,
732254,
732255,
732256,
732257,
732259,
732260,
732261,
732262,
732263,
732264,
732265,
732586,
732587,
732588,
732589,
732590,
732591,
732592,
732593,
732594,
732595,
732596,
732597,
732598,
732599,
732600,
732601,
732602,
732603,
732604,
732605,
732606,
732607,
732608,
732609,
732610,
732611,
732612,
732613,
732614,
732615,
732616,
732617,
732618,
732619,
732620,
732621,
732622,
732623,
732624,
732625,
733293,
733294,
733295,
733296,
733297,
733298,
733299,
733300,
733301,
733302,
733303,
733304,
733305,
733306,
733307,
733308,
733309,
733310,
733311,
733312,
733313,
733314,
733315,
733352,
733353,
733354,
733355,
733356,
734352,
734353,
734354,
734355,
734356,
734446,
734447,
731634,
731824);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=6918 AND `id`=1;

DELETE FROM `conditions` WHERE `SourceGroup`=6918;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 6918, 0, 0, 0, 8, 0, 8867, 0, 0, 0, 0, 0, '', 'Lunar Invitation - Show gossip only if quest 8867 is Rewarded');

-- Lunar Festival Harbinger
SET @ENTRY := 15895;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,6918,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,6918,0,0,0,56,21711,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Add Item");

DELETE FROM `spell_script_names` WHERE `spell_id` = '26373';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (26373, 'spell_lunar_invitation');

DELETE FROM `creature_text` WHERE `entry`=15467;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(15467,0,0,'Demigod Omen emerges from the Lake Elune\'ara!',41,0,100,0,0,0,'Comment');