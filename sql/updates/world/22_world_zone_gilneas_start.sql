/*
SET @CGUID := 798530;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+71;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 50260, 638, 1, 2047, 0, 0, -1615.77, 1306.3, 19.2244, 2.5565, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+1, 50260, 638, 1, 2047, 0, 0, -1617.03, 1309.57, 19.3648, 1.83393, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+2, 50260, 638, 1, 2047, 0, 0, -1616.96, 1317.65, 19.1091, 4.37548, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+3, 50260, 638, 1, 2047, 0, 0, -1399.08, 1437.95, 35.5561, 3.1557, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+4, 50260, 638, 1, 2047, 0, 0, -1401.86, 1440.29, 35.5561, 3.51463, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+5, 50260, 638, 1, 2047, 0, 0, -1406.2, 1436.88, 35.5561, 1.22441, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+6, 50260, 638, 1, 2047, 0, 0, -1401.44, 1438.85, 35.5561, 1.90299, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+7, 50260, 638, 1, 2047, 0, 0, -1407.22, 1439.84, 35.5561, 6.11273, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+8, 50260, 638, 1, 2047, 0, 0, -1409.18, 1438.57, 35.947, 6.2164, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+9, 50260, 638, 1, 2047, 0, 0, -1406.25, 1441.85, 35.5559, 4.1241, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+10, 50260, 638, 1, 2047, 0, 0, -1403.77, 1441.6, 35.5559, 4.21835, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+11, 50260, 638, 1, 2047, 0, 0, -1400.51, 1441.15, 35.5559, 3.28529, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+12, 50260, 638, 1, 2047, 0, 0, -1402.46, 1437.24, 35.5559, 1.13566, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+13, 50260, 638, 1, 2047, 0, 0, -1404.77, 1439.38, 35.556, 4.28982, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+14, 50260, 638, 1, 2047, 0, 0, -1799.7, 1553.23, 22.741, 1.72861, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+15, 50260, 638, 1, 2047, 0, 0, -1799.29, 1550.65, 22.7378, 3.79264, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+16, 50260, 638, 1, 2047, 0, 0, -1797.43, 1552.06, 22.7326, 1.19768, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+17, 50260, 638, 1, 2047, 0, 0, -1798.71, 1548.19, 22.7355, 1.87391, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+18, 50260, 638, 1, 2047, 0, 0, -1797.94, 1545.4, 22.5087, 5.9352, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+19, 50260, 638, 1, 2047, 0, 0, -1800.82, 1547.72, 22.7376, 4.77517, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+20, 50260, 638, 1, 2047, 0, 0, -1801.02, 1551.07, 22.7451, 3.16274, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+21, 50260, 638, 1, 2047, 0, 0, -1796.01, 1549.16, 22.726, 0.963629, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+22, 50260, 654, 1, 1, 0, 0, -1818.85, 2290.39, 46.9559, 2.86, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+23, 50260, 654, 1, 1, 0, 0, -1827.84, 2301.24, 48.5305, 4.8337, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+24, 50260, 654, 1, 1, 0, 0, -1836.33, 2292.18, 50.665, 6.13353, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+25, 50260, 654, 1, 1, 0, 0, -1863.72, 2290.88, 47.9826, 2.02983, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+26, 50260, 654, 1, 1, 0, 0, -1867.57, 2310.92, 43.6316, 0.942055, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+27, 50260, 0, 1, 1, 0, 0, -1535.77, 1641.05, 21.2979, 4.83353, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+28, 50260, 0, 1, 1, 0, 0, -1579.87, 1635.84, 20.5471, 4.43297, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+29, 50260, 0, 1, 1, 0, 0, -1569.89, 1675.59, 20.5636, 4.43297, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+30, 50260, 0, 1, 1, 0, 0, -1564.55, 1695.37, 20.4963, 2.78756, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+31, 50260, 0, 1, 1, 0, 0, -1531.05, 1672.76, 21.5488, 1.58983, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+32, 50260, 0, 1, 1, 0, 0, -1508.06, 1622.96, 26.9465, 0.98898, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+33, 50260, 0, 1, 1, 0, 0, -1465.91, 1623.56, 20.4855, 3.36483, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+34, 50260, 0, 1, 1, 0, 0, -1411.5, 1554.65, 20.4726, 4.90421, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+35, 50260, 0, 1, 1, 0, 0, -1429.53, 1574.83, 20.7378, 5.79563, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+36, 50260, 0, 1, 1, 0, 0, -1471.51, 1578.68, 20.4856, 0.910457, 30, 15, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+37, 50260, 0, 1, 1, 0, 0, -1484.04, 1562.28, 20.5177, 1.47987, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+38, 50260, 0, 1, 1, 0, 0, -1472.07, 1540.22, 20.4854, 2.58336, 30, 10, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+39, 50260, 638, 1, 2047, 0, 0, -1619.88, 1307.22, 19.9435, 1.9596, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+40, 50260, 638, 1, 2047, 0, 0, -1619.39, 1310.94, 19.7299, 0.420211, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+41, 50260, 638, 1, 2047, 0, 0, -1617.5, 1312.99, 19.35, 5.82061, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+42, 50260, 638, 1, 2047, 0, 0, -1619.84, 1314.45, 19.6611, 0.307109, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+43, 50260, 638, 1, 2047, 0, 0, -1622.55, 1312.44, 20.0398, 0.0440004, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+44, 50260, 638, 1, 2047, 0, 0, -1621.57, 1314.44, 19.9151, 1.53626, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+45, 50260, 638, 1, 2047, 0, 0, -1621.55, 1309.14, 20.0544, 5.98946, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+46, 50260, 638, 1, 2047, 0, 0, -1615.11, 1310.87, 18.9664, 1.13177, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+47, 50260, 654, 1, 2, 0, 0, -1608.47, 1315.89, 19.1158, 0.326143, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+48, 50260, 654, 1, 2, 0, 0, -1615.2, 1313.62, 19.9094, 0.326143, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+49, 50260, 654, 1, 2, 0, 0, -1621.48, 1317.63, 20.7782, 3.24333, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+50, 50260, 654, 1, 2, 0, 0, -1616.27, 1317.47, 19.9843, 0.527579, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+51, 50260, 654, 1, 2, 0, 0, -1627.55, 1312.76, 21.3555, 2.5978, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+52, 50260, 654, 1, 2, 0, 0, -1623.02, 1311.11, 21.0898, 2.22205, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+53, 50260, 654, 1, 2, 0, 0, -1616.58, 1306.57, 20.3693, 3.27618, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+54, 50260, 654, 1, 2, 0, 0, -1611.91, 1308.25, 19.4791, 3.23905, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+55, 50260, 654, 1, 2, 0, 0, -1608.93, 1308.78, 19.1147, 3.3538, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+56, 50260, 654, 1, 2, 0, 0, -1604.99, 1309.79, 19.2194, 5.54418, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+57, 50260, 654, 1, 2, 0, 0, -1608, 1312.55, 19.1152, 5.05143, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+58, 50260, 654, 1, 2, 0, 0, -1610.02, 1318.13, 19.1152, 0.642495, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+59, 50260, 654, 1, 2, 0, 0, -1614.98, 1310.98, 19.9423, 0.451245, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+60, 50260, 654, 1, 2, 0, 0, -1624.64, 1308.24, 21.2361, 4.14157, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+61, 50260, 654, 1, 2, 0, 0, -1617.78, 1314.68, 20.35, 2.51032, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+62, 50260, 654, 1, 2, 0, 0, -1610.73, 1311.22, 19.1974, 3.39344, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+63, 50260, 654, 1, 2, 0, 0, -1608.85, 1317.51, 19.1159, 0.371029, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+64, 50260, 654, 1, 2, 0, 0, -1612.97, 1314.28, 19.5276, 0.988654, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+65, 50260, 654, 1, 2, 0, 0, -1613.69, 1309.79, 19.7619, 0.0189037, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+66, 50260, 654, 1, 2, 0, 0, -1618.29, 1311.44, 20.5452, 5.90721, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+67, 50260, 654, 1, 2, 0, 0, -1621.7, 1314.44, 20.933, 0.242779, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+68, 50260, 654, 1, 2, 0, 0, -1623.63, 1313.94, 21.0669, 2.15415, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+69, 50260, 654, 1, 2, 0, 0, -1620.14, 1312.19, 20.7916, 3.33315, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+70, 50260, 654, 1, 2, 0, 0, -1617.44, 1308.68, 20.4689, 3.33315, 30, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+71, 50260, 654, 1, 2, 0, 0, -1621.57, 1306.73, 21.1033, 3.33315, 30, 0, 0, 42, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `speed_walk`=2.14286, `speed_run`=2.14286 WHERE  `entry`=50260;
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry`=50260;
UPDATE `quest_template` SET `Flags`=0 WHERE `Id`=14212;
*/