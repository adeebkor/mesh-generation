// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Planar piston source with spherical scatterer problem
// - structured mesh
//
// ----------------------------------------------------------------------------
// Copyright (C) 2024 Adeeb Arif Kor

// ---------------------------- //
// Geometry and mesh parameters //
// ---------------------------- //

speedOfSound = 1500;
sourceFrequency = 2000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 5;
domainRadius = 3.0 + numExtraWavelength*wavelength;

numElementPerWavelength = 1;
sourceRadius = 1.0;
sphereRadius = sourceRadius;

cp0 = 3/4;

// -------- //
// Volume 1 //
// -------- //

Point(1) = {-4, 0, 0, 1.0};
Point(2) = {-4, sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), 1.0};
Point(3) = {-4, sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), 1.0};
Point(4) = {-4, sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), 1.0};
Point(5) = {-4, sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), 1.0};
Point(6) = {-4, sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), 1.0};
Point(7) = {-4, sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), 1.0};
Point(8) = {-4, sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), 1.0};
Point(9) = {-4, sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), 1.0};

Point(11) = {-4, domainRadius * Cos(Pi), domainRadius * Sin(Pi), 1.0};
Point(12) = {-4, domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), 1.0};
Point(13) = {-4, domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), 1.0};
Point(14) = {-4, domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), 1.0};
Point(15) = {-4, domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), 1.0};
Point(16) = {-4, domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), 1.0};
Point(17) = {-4, domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), 1.0};
Point(18) = {-4, domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), 1.0};

Point(19) = {-4, sourceRadius * cp0 * Cos(Pi), sourceRadius * cp0 * Sin(Pi),  1.0};
Point(20) = {-4, sourceRadius * cp0 * Cos(5/4*Pi), sourceRadius * cp0 * Sin(5/4*Pi), 1.0};
Point(21) = {-4, sourceRadius * cp0 * Cos(3/2*Pi), sourceRadius * cp0 * Sin(3/2*Pi), 1.0};
Point(22) = {-4, sourceRadius * cp0 * Cos(7/4*Pi), sourceRadius * cp0 * Sin(7/4*Pi), 1.0};
Point(23) = {-4, sourceRadius * cp0, 0., 1.0};
Point(24) = {-4, sourceRadius * cp0 * Cos(1/4*Pi), sourceRadius * cp0 * Sin(1/4*Pi), 1.0};
Point(25) = {-4, sourceRadius * cp0 * Cos(1/2*Pi), sourceRadius * cp0 * Sin(1/2*Pi), 1.0};
Point(26) = {-4, sourceRadius * cp0 * Cos(3/4*Pi), sourceRadius * cp0 * Sin(3/4*Pi), 1.0};

Line(1) = {1, 19};
Line(2) = {1, 21};
Line(3) = {1, 23};
Line(4) = {1, 25};

Line(5) = {19, 20};
Line(6) = {20, 21};
Line(7) = {21, 22};
Line(8) = {22, 23};
Line(9) = {23, 24};
Line(10) = {24, 25};
Line(11) = {25, 26};
Line(12) = {26, 19};

Line(13) = {19, 2};
Line(14) = {20, 3};
Line(15) = {21, 4};
Line(16) = {22, 5};
Line(17) = {23, 6};
Line(18) = {24, 7};
Line(19) = {25, 8};
Line(20) = {26, 9};

Circle(21) = {2, 1, 3};
Circle(22) = {3, 1, 4};
Circle(23) = {4, 1, 5};
Circle(24) = {5, 1, 6};
Circle(25) = {6, 1, 7};
Circle(26) = {7, 1, 8};
Circle(27) = {8, 1, 9};
Circle(28) = {9, 1, 2};

Line(29) = {2, 11};
Line(30) = {3, 12};
Line(31) = {4, 13};
Line(32) = {5, 14};
Line(33) = {6, 15};
Line(34) = {7, 16};
Line(35) = {8, 17};
Line(36) = {9, 18};

Circle(37) = {11, 1, 12};
Circle(38) = {12, 1, 13};
Circle(39) = {13, 1, 14};
Circle(40) = {14, 1, 15};
Circle(41) = {15, 1, 16};
Circle(42) = {16, 1, 17};
Circle(43) = {17, 1, 18};
Circle(44) = {18, 1, 11};

Point(27) = {-sphereRadius, 0., 0., 1.0};
Point(28) = {0., sphereRadius * Cos (Pi), sphereRadius * Sin (Pi), 1.0};
Point(29) = {0., sphereRadius * Cos (5/4*Pi), sphereRadius * Sin (5/4*Pi), 1.0};
Point(30) = {0., sphereRadius * Cos (3/2*Pi), sphereRadius * Sin (3/2*Pi), 1.0};
Point(31) = {0., sphereRadius * Cos (7/4*Pi), sphereRadius * Sin (7/4*Pi), 1.0};
Point(32) = {0., sphereRadius * Cos (2*Pi), sphereRadius * Sin (2*Pi), 1.0};
Point(33) = {0., sphereRadius * Cos (1/4*Pi), sphereRadius * Sin (1/4*Pi), 1.0};
Point(34) = {0., sphereRadius * Cos (1/2*Pi), sphereRadius * Sin (1/2*Pi), 1.0};
Point(35) = {0., sphereRadius * Cos (3/4*Pi), sphereRadius * Sin (3/4*Pi), 1.0};

Point(36) = {0, domainRadius * Cos (Pi), domainRadius * Sin (Pi), 1.0};
Point(37) = {0, domainRadius * Cos (5/4*Pi), domainRadius * Sin (5/4*Pi), 1.0};
Point(38) = {0, domainRadius * Cos (3/2*Pi), domainRadius * Sin (3/2*Pi), 1.0};
Point(39) = {0, domainRadius * Cos (7/4*Pi), domainRadius * Sin (7/4*Pi), 1.0};
Point(40) = {0, domainRadius * Cos (2*Pi), domainRadius * Sin (2*Pi), 1.0};
Point(41) = {0, domainRadius * Cos (1/4*Pi), domainRadius * Sin (1/4*Pi), 1.0};
Point(42) = {0, domainRadius * Cos (1/2*Pi), domainRadius * Sin (1/2*Pi), 1.0};
Point(43) = {0, domainRadius * Cos (3/4*Pi), domainRadius * Sin (3/4*Pi), 1.0};

Point(44) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (Pi) * Cos (Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (Pi) * Sin (Pi)), sphereRadius * cp0 * Cos (Pi), sphereRadius * cp0 * Sin(Pi), 1.0};
Point(45) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (5/4*Pi) * Cos (5/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (5/4*Pi) * Sin (5/4*Pi)), sphereRadius * cp0 * Cos (5/4*Pi), sphereRadius * cp0 * Sin(5/4*Pi), 1.0};
Point(46) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (3/2*Pi) * Cos (3/2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (3/2*Pi) * Sin (3/2*Pi)), sphereRadius * cp0 * Cos (3/2*Pi), sphereRadius * cp0 * Sin(3/2*Pi), 1.0};
Point(47) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (7/4*Pi) * Cos (7/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (7/4*Pi) * Sin (7/4*Pi)), sphereRadius * cp0 * Cos (7/4*Pi), sphereRadius * cp0 * Sin(7/4*Pi), 1.0};
Point(48) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (2*Pi) * Cos (2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (2*Pi) * Sin (2*Pi)), sphereRadius * cp0 * Cos (2*Pi), sphereRadius * cp0 * Sin(2*Pi), 1.0};
Point(49) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (1/4*Pi) * Cos (1/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (1/4*Pi) * Sin (1/4*Pi)), sphereRadius * cp0 * Cos (1/4*Pi), sphereRadius * cp0 * Sin(1/4*Pi), 1.0};
Point(50) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (1/2*Pi) * Cos (1/2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (1/2*Pi) * Sin (1/2*Pi)), sphereRadius * cp0 * Cos (1/2*Pi), sphereRadius * cp0 * Sin(1/2*Pi), 1.0};
Point(51) = {- Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (3/4*Pi) * Cos (3/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (3/4*Pi) * Sin (3/4*Pi)), sphereRadius * cp0 * Cos (3/4*Pi), sphereRadius * cp0 * Sin(3/4*Pi), 1.0};

Point(1000) = {0., 0., 0., 1.0};

Circle(45) = {27, 1000, 44};
Circle(46) = {27, 1000, 46};
Circle(47) = {27, 1000, 48};
Circle(48) = {27, 1000, 50};

Circle(49) = {44, 1000, 45};
Circle(50) = {45, 1000, 46};
Circle(51) = {46, 1000, 47};
Circle(52) = {47, 1000, 48};
Circle(53) = {48, 1000, 49};
Circle(54) = {49, 1000, 50};
Circle(55) = {50, 1000, 51};
Circle(56) = {51, 1000, 44};

Circle(57) = {44, 1000, 28};
Circle(58) = {45, 1000, 29};
Circle(59) = {46, 1000, 30};
Circle(60) = {47, 1000, 31};
Circle(61) = {48, 1000, 32};
Circle(62) = {49, 1000, 33};
Circle(63) = {50, 1000, 34};
Circle(64) = {51, 1000, 35};

Circle(65) = {28, 1000, 29};
Circle(66) = {29, 1000, 30};
Circle(67) = {30, 1000, 31};
Circle(68) = {31, 1000, 32};
Circle(69) = {32, 1000, 33};
Circle(70) = {33, 1000, 34};
Circle(71) = {34, 1000, 35};
Circle(72) = {35, 1000, 28};

Line(73) = {28, 36};
Line(74) = {29, 37};
Line(75) = {30, 38};
Line(76) = {31, 39};
Line(77) = {32, 40};
Line(78) = {33, 41};
Line(79) = {34, 42};
Line(80) = {35, 43};

Circle(81) = {36, 1000, 37};
Circle(82) = {37, 1000, 38};
Circle(83) = {38, 1000, 39};
Circle(84) = {39, 1000, 40};
Circle(85) = {40, 1000, 41};
Circle(86) = {41, 1000, 42};
Circle(87) = {42, 1000, 43};
Circle(88) = {43, 1000, 36};

Line(89) = {1, 27};
Line(90) = {2, 28};
Line(91) = {3, 29};
Line(92) = {4, 30};
Line(93) = {5, 31};
Line(94) = {6, 32};
Line(95) = {7, 33};
Line(96) = {8, 34};
Line(97) = {9, 35};

Line(98) = {11, 36};
Line(99) = {12, 37};
Line(100) = {13, 38};
Line(101) = {14, 39};
Line(102) = {15, 40};
Line(103) = {16, 41};
Line(104) = {17, 42};
Line(105) = {18, 43};

Line(106) = {19, 44};
Line(107) = {20, 45};
Line(108) = {21, 46};
Line(109) = {22, 47};
Line(110) = {23, 48};
Line(111) = {24, 49};
Line(112) = {25, 50};
Line(113) = {26, 51};

Line Loop(101) = {1, 5, 6, -2};
Ruled Surface(102) = {101};
Line Loop(103) = {2, 7, 8, -3};
Ruled Surface(104) = {103};
Line Loop(105) = {3, 9, 10, -4};
Ruled Surface(106) = {105};
Line Loop(107) = {4, 11, 12, -1};
Ruled Surface(108) = {107};

Line Loop(109) = {13, 21, -14, -5};
Ruled Surface(110) = {109};
Line Loop(111) = {14, 22, -15, -6};
Ruled Surface(112) = {111};
Line Loop(113) = {15, 23, -16, -7};
Ruled Surface(114) = {113};
Line Loop(115) = {16, 24, -17, -8};
Ruled Surface(116) = {115};
Line Loop(117) = {17, 25, -18, -9};
Ruled Surface(118) = {117};
Line Loop(119) = {18, 26, -19, -10};
Ruled Surface(120) = {119};
Line Loop(121) = {19, 27, -20, -11};
Ruled Surface(122) = {121};
Line Loop(123) = {20, 28, -13, -12};
Ruled Surface(124) = {123};

Line Loop(125) = {29, 37, -30, -21};
Ruled Surface(126) = {125};
Line Loop(127) = {30, 38, -31, -22};
Ruled Surface(128) = {127};
Line Loop(129) = {31, 39, -32, -23};
Ruled Surface(130) = {129};
Line Loop(131) = {32, 40, -33, -24};
Ruled Surface(132) = {131};
Line Loop(133) = {33, 41, -34, -25};
Ruled Surface(134) = {133};
Line Loop(135) = {34, 42, -35, -26};
Ruled Surface(136) = {135};
Line Loop(137) = {35, 43, -36, -27};
Ruled Surface(138) = {137};
Line Loop(139) = {36, 44, -29, -28};
Ruled Surface(140) = {139};

Line Loop(141) = {45, 49, 50, -46};
Ruled Surface(142) = {141};
Line Loop(143) = {46, 51, 52, -47};
Ruled Surface(144) = {143};
Line Loop(145) = {47, 53, 54, -48};
Ruled Surface(146) = {145};
Line Loop(147) = {48, 55, 56, -45};
Ruled Surface(148) = {147};

Line Loop(149) = {57, 65, -58, -49};
Ruled Surface(150) = {149};
Line Loop(151) = {58, 66, -59, -50};
Ruled Surface(152) = {151};
Line Loop(153) = {59, 67, -60, -51};
Ruled Surface(154) = {153};
Line Loop(155) = {60, 68, -61, -52};
Ruled Surface(156) = {155};
Line Loop(157) = {61, 69, -62, -53};
Ruled Surface(158) = {157};
Line Loop(159) = {62, 70, -63, -54};
Ruled Surface(160) = {159};
Line Loop(161) = {63, 71, -64, -55};
Ruled Surface(162) = {161};
Line Loop(163) = {64, 72, -57, -56};
Ruled Surface(164) = {163};

Line Loop(165) = {73, 81, -74, -65};
Ruled Surface(166) = {165};
Line Loop(167) = {74, 82, -75, -66};
Ruled Surface(168) = {167};
Line Loop(169) = {75, 83, -76, -67};
Ruled Surface(170) = {169};
Line Loop(171) = {76, 84, -77, -68};
Ruled Surface(172) = {171};
Line Loop(173) = {77, 85, -78, -69};
Ruled Surface(174) = {173};
Line Loop(175) = {78, 86, -79, -70};
Ruled Surface(176) = {175};
Line Loop(177) = {79, 87, -80, -71};
Ruled Surface(178) = {177};
Line Loop(179) = {80, 88, -73, -72};
Ruled Surface(180) = {179};

Line Loop(181) = {89, 45, -106, -1};
Ruled Surface(182) = {181};
Line Loop(183) = {89, 46, -108, -2};
Ruled Surface(184) = {183};
Line Loop(185) = {89, 47, -110, -3};
Ruled Surface(186) = {185};
Line Loop(187) = {89, 48, -112, -4};
Ruled Surface(188) = {187};

Line Loop(189) = {5, 107, -49, -106};
Ruled Surface(190) = {189};
Line Loop(191) = {6, 108, -50, -107};
Ruled Surface(192) = {191};
Line Loop(193) = {7, 109, -51, -108};
Ruled Surface(194) = {193};
Line Loop(195) = {8, 110, -52, -109};
Ruled Surface(196) = {195};
Line Loop(197) = {9, 111, -53, -110};
Ruled Surface(198) = {197};
Line Loop(199) = {10, 112, -54, -111};
Ruled Surface(200) = {199};
Line Loop(201) = {11, 113, -55, -112};
Ruled Surface(202) = {201};
Line Loop(203) = {12, 106, -56, -113};
Ruled Surface(204) = {203};

Line Loop(205) = {13, 90, -57, -106};
Ruled Surface(206) = {205};
Line Loop(207) = {14, 91, -58, -107};
Ruled Surface(208) = {207};
Line Loop(209) = {15, 92, -59, -108};
Ruled Surface(210) = {209};
Line Loop(211) = {16, 93, -60, -109};
Ruled Surface(212) = {211};
Line Loop(213) = {17, 94, -61, -110};
Ruled Surface(214) = {213};
Line Loop(215) = {18, 95, -62, -111};
Ruled Surface(216) = {215};
Line Loop(217) = {19, 96, -63, -112};
Ruled Surface(218) = {217};
Line Loop(219) = {20, 97, -64, -113};
Ruled Surface(220) = {219};

Line Loop(221) = {21, 91, -65, -90};
Ruled Surface(222) = {221};
Line Loop(223) = {22, 92, -66, -91};
Ruled Surface(224) = {223};
Line Loop(225) = {23, 93, -67, -92};
Ruled Surface(226) = {225};
Line Loop(227) = {24, 94, -68, -93};
Ruled Surface(228) = {227};
Line Loop(229) = {25, 95, -69, -94};
Ruled Surface(230) = {229};
Line Loop(231) = {26, 96, -70, -95};
Ruled Surface(232) = {231};
Line Loop(233) = {27, 97, -71, -96};
Ruled Surface(234) = {233};
Line Loop(235) = {28, 90, -72, -97};
Ruled Surface(236) = {235};

Line Loop(237) = {29, 98, -73, -90};
Ruled Surface(238) = {237};
Line Loop(239) = {30, 99, -74, -91};
Ruled Surface(240) = {239};
Line Loop(241) = {31, 100, -75, -92};
Ruled Surface(242) = {241};
Line Loop(243) = {32, 101, -76, -93};
Ruled Surface(244) = {243};
Line Loop(245) = {33, 102, -77, -94};
Ruled Surface(246) = {245};
Line Loop(247) = {34, 103, -78, -95};
Ruled Surface(248) = {247};
Line Loop(249) = {35, 104, -79, -96};
Ruled Surface(250) = {249};
Line Loop(251) = {36, 105, -80, -97};
Ruled Surface(252) = {251};

Line Loop(253) = {37, 99, -81, -98};
Ruled Surface(254) = {253};
Line Loop(255) = {38, 100, -82, -99};
Ruled Surface(256) = {255};
Line Loop(257) = {39, 101, -83, -100};
Ruled Surface(258) = {257};
Line Loop(259) = {40, 102, -84, -101};
Ruled Surface(260) = {259};
Line Loop(261) = {41, 103, -85, -102};
Ruled Surface(262) = {261};
Line Loop(263) = {42, 104, -86, -103};
Ruled Surface(264) = {263};
Line Loop(265) = {43, 105, -87, -104};
Ruled Surface(266) = {265};
Line Loop(267) = {44, 98, -88, -105};
Ruled Surface(268) = {267};

Surface Loop(1001) = {102, 142, 190, 192, 184, 182};
Volume(1002) = {1001};
Surface Loop(1003) = {104, 144, 194, 196, 186, 184};
Volume(1004) = {1003};
Surface Loop(1005) = {106, 146, 198, 200, 188, 186};
Volume(1006) = {1005};
Surface Loop(1007) = {108, 148, 202, 204, 182, 188};
Volume(1008) = {1007};

Surface Loop(1009) = {110, 150, 222, 208, 190, 206};
Volume(1010) = {1009};
Surface Loop(1011) = {112, 152, 224, 210, 192, 208};
Volume(1012) = {1011};
Surface Loop(1013) = {114, 154, 226, 212, 194, 210};
Volume(1014) = {1013};
Surface Loop(1015) = {116, 156, 228, 214, 196, 212};
Volume(1016) = {1015};
Surface Loop(1017) = {118, 158, 230, 216, 198, 214};
Volume(1018) = {1017};
Surface Loop(1019) = {120, 160, 232, 218, 200, 216};
Volume(1020) = {1019};
Surface Loop(1021) = {122, 162, 234, 220, 202, 218};
Volume(1022) = {1021};
Surface Loop(1023) = {124, 164, 236, 206, 204, 220};
Volume(1024) = {1023};

Surface Loop(1025) = {126, 166, 254, 240, 222, 238};
Volume(1026) = {1025};
Surface Loop(1027) = {128, 168, 256, 242, 224, 240};
Volume(1028) = {1027};
Surface Loop(1029) = {130, 170, 258, 244, 226, 242};
Volume(1030) = {1029};
Surface Loop(1031) = {132, 172, 260, 246, 228, 244};
Volume(1032) = {1031};
Surface Loop(1033) = {134, 174, 262, 248, 230, 246};
Volume(1034) = {1033};
Surface Loop(1035) = {136, 176, 264, 250, 232, 248};
Volume(1036) = {1035};
Surface Loop(1037) = {138, 178, 266, 252, 234, 250};
Volume(1038) = {1037};
Surface Loop(1039) = {140, 180, 268, 238, 236, 252};
Volume(1040) = {1039};
