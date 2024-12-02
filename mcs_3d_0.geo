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
numExtraWavelength = 3;
domainRadius = 3.0 + numExtraWavelength*wavelength;

numElementPerWavelength1 = 3;
numElementPerWavelength2 = 2 * numElementPerWavelength1 + 1;
sourceRadius = 1.0;
sphereRadius = sourceRadius;
domainLength = 9.0 + numExtraWavelength*wavelength;
xa = -4.0;
xb = xa + domainLength;

// -------- //
// Volume 1 //
// -------- //

cp0 = 3/4;

Point(1) = {xa, 0, 0, 1.0};
Point(2) = {xa, sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), 1.0};
Point(3) = {xa, sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), 1.0};
Point(4) = {xa, sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), 1.0};
Point(5) = {xa, sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), 1.0};
Point(6) = {xa, sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), 1.0};
Point(7) = {xa, sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), 1.0};
Point(8) = {xa, sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), 1.0};
Point(9) = {xa, sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), 1.0};

Point(11) = {xa, domainRadius * Cos(Pi), domainRadius * Sin(Pi), 1.0};
Point(12) = {xa, domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), 1.0};
Point(13) = {xa, domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), 1.0};
Point(14) = {xa, domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), 1.0};
Point(15) = {xa, domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), 1.0};
Point(16) = {xa, domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), 1.0};
Point(17) = {xa, domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), 1.0};
Point(18) = {xa, domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), 1.0};

Point(19) = {xa, sourceRadius * cp0 * Cos(Pi), sourceRadius * cp0 * Sin(Pi),  1.0};
Point(20) = {xa, sourceRadius * cp0 * Cos(5/4*Pi), sourceRadius * cp0 * Sin(5/4*Pi), 1.0};
Point(21) = {xa, sourceRadius * cp0 * Cos(3/2*Pi), sourceRadius * cp0 * Sin(3/2*Pi), 1.0};
Point(22) = {xa, sourceRadius * cp0 * Cos(7/4*Pi), sourceRadius * cp0 * Sin(7/4*Pi), 1.0};
Point(23) = {xa, sourceRadius * cp0, 0., 1.0};
Point(24) = {xa, sourceRadius * cp0 * Cos(1/4*Pi), sourceRadius * cp0 * Sin(1/4*Pi), 1.0};
Point(25) = {xa, sourceRadius * cp0 * Cos(1/2*Pi), sourceRadius * cp0 * Sin(1/2*Pi), 1.0};
Point(26) = {xa, sourceRadius * cp0 * Cos(3/4*Pi), sourceRadius * cp0 * Sin(3/4*Pi), 1.0};

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

// -------- //
// Volume 2 //
// -------- //

cp1 = 2/3;

Point(52) = {0, sourceRadius * cp1 * Cos(Pi), sourceRadius * cp1 * Sin(Pi),  1.0};
Point(53) = {0, sourceRadius * cp1 * Cos(5/4*Pi), sourceRadius * cp1 * Sin(5/4*Pi), 1.0};
Point(54) = {0, sourceRadius * cp1 * Cos(3/2*Pi), sourceRadius * cp1 * Sin(3/2*Pi), 1.0};
Point(55) = {0, sourceRadius * cp1 * Cos(7/4*Pi), sourceRadius * cp1 * Sin(7/4*Pi), 1.0};
Point(56) = {0, sourceRadius * cp1, 0., 1.0};
Point(57) = {0, sourceRadius * cp1 * Cos(1/4*Pi), sourceRadius * cp1 * Sin(1/4*Pi), 1.0};
Point(58) = {0, sourceRadius * cp1 * Cos(1/2*Pi), sourceRadius * cp1 * Sin(1/2*Pi), 1.0};
Point(59) = {0, sourceRadius * cp1 * Cos(3/4*Pi), sourceRadius * cp1 * Sin(3/4*Pi), 1.0};

cp2 = 1/2;
cp3 = 1/3;

Point(60) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(Pi), sourceRadius * cp2 * Sin(Pi),  1.0};
Point(61) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(5/4*Pi), sourceRadius * cp2 * Sin(5/4*Pi), 1.0};
Point(62) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(3/2*Pi), sourceRadius * cp2 * Sin(3/2*Pi), 1.0};
Point(63) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(7/4*Pi), sourceRadius * cp2 * Sin(7/4*Pi), 1.0};
Point(64) = {-sourceRadius * cp3, sourceRadius * cp2, 0., 1.0};
Point(65) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(1/4*Pi), sourceRadius * cp2 * Sin(1/4*Pi), 1.0};
Point(66) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(1/2*Pi), sourceRadius * cp2 * Sin(1/2*Pi), 1.0};
Point(67) = {-sourceRadius * cp3, sourceRadius * cp2 * Cos(3/4*Pi), sourceRadius * cp2 * Sin(3/4*Pi), 1.0};

Line(114) = {1000, 52};
Line(115) = {1000, 54};
Line(116) = {1000, 56};
Line(117) = {1000, 58};

Line(118) = {52, 53};
Line(119) = {53, 54};
Line(120) = {54, 55};
Line(121) = {55, 56};
Line(122) = {56, 57};
Line(123) = {57, 58};
Line(124) = {58, 59};
Line(125) = {59, 52};

Line(126) = {52, 28};
Line(127) = {53, 29};
Line(128) = {54, 30};
Line(129) = {55, 31};
Line(130) = {56, 32};
Line(131) = {57, 33};
Line(132) = {58, 34};
Line(133) = {59, 35};

cp4 = sphereRadius/2;

Point(2000) = {-cp4, 0., 0., 1.0};

Line(134) = {2000, 60};
Line(135) = {2000, 62};
Line(136) = {2000, 64};
Line(137) = {2000, 66};

Line(138) = {60, 61};
Line(139) = {61, 62};
Line(140) = {62, 63};
Line(141) = {63, 64};
Line(142) = {64, 65};
Line(143) = {65, 66};
Line(144) = {66, 67};
Line(145) = {67, 60};

Line(146) = {60, 52};
Line(147) = {61, 53};
Line(148) = {62, 54};
Line(149) = {63, 55};
Line(150) = {64, 56};
Line(151) = {65, 57};
Line(152) = {66, 58};
Line(153) = {67, 59};

Line(154) = {44, 60};
Line(155) = {45, 61};
Line(156) = {46, 62};
Line(157) = {47, 63};
Line(158) = {48, 64};
Line(159) = {49, 65};
Line(160) = {50, 66};
Line(161) = {51, 67};

Line(162) = {27, 2000};
Line(163) = {2000, 1000};

Line Loop(301) = {114, 118, 119, -115};
Ruled Surface(302) = {301};
Line Loop(303) = {115, 120, 121, -116};
Ruled Surface(304) = {303};
Line Loop(305) = {116, 122, 123, -117};
Ruled Surface(306) = {305};
Line Loop(307) = {117, 124, 125, -114};
Ruled Surface(308) = {307};

Line Loop(309) = {126, 65, -127, -118};
Ruled Surface(310) = {309};
Line Loop(311) = {127, 66, -128, -119};
Ruled Surface(312) = {311};
Line Loop(313) = {128, 67, -129, -120};
Ruled Surface(314) = {313};
Line Loop(315) = {129, 68, -130, -121};
Ruled Surface(316) = {315};
Line Loop(317) = {130, 69, -131, -122};
Ruled Surface(318) = {317};
Line Loop(319) = {131, 70, -132, -123};
Ruled Surface(320) = {319};
Line Loop(321) = {132, 71, -133, -124};
Ruled Surface(322) = {321};
Line Loop(323) = {133, 72, -126, -125};
Ruled Surface(324) = {323};

Line Loop(325) = {114, -146, -134, 163};
Ruled Surface(326) = {325};
Line Loop(327) = {115, -148, -135, 163};
Ruled Surface(328) = {327};
Line Loop(329) = {116, -150, -136, 163};
Ruled Surface(330) = {329};
Line Loop(331) = {117, -152, -137, 163};
Ruled Surface(332) = {331};

Line Loop(333) = {-146, 138, 147, -118};
Ruled Surface(334) = {333};
Line Loop(335) = {-147, 139, 148, -119};
Ruled Surface(336) = {335};
Line Loop(337) = {-148, 140, 149, -120};
Ruled Surface(338) = {337};
Line Loop(339) = {-149, 141, 150, -121};
Ruled Surface(340) = {339};
Line Loop(341) = {-150, 142, 151, -122};
Ruled Surface(342) = {341};
Line Loop(343) = {-151, 143, 152, -123};
Ruled Surface(344) = {343};
Line Loop(345) = {-152, 144, 153, -124};
Ruled Surface(346) = {345};
Line Loop(347) = {-153, 145, 146, -125};
Ruled Surface(348) = {347};

Line Loop(349) = {134, -154, -45, 162};
Ruled Surface(350) = {349};
Line Loop(351) = {135, -156, -46, 162};
Ruled Surface(352) = {351};
Line Loop(353) = {136, -158, -47, 162};
Ruled Surface(354) = {353};
Line Loop(355) = {137, -160, -48, 162};
Ruled Surface(356) = {355};

Line Loop(357) = {134, 138, 139, -135};
Ruled Surface(358) = {357};
Line Loop(359) = {135, 140, 141, -136};
Ruled Surface(360) = {359};
Line Loop(361) = {136, 142, 143, -137};
Ruled Surface(362) = {361};
Line Loop(363) = {137, 144, 145, -134};
Ruled Surface(364) = {363};

Line Loop(365) = {-154, 49, 155, -138};
Ruled Surface(366) = {365};
Line Loop(367) = {-155, 50, 156, -139};
Ruled Surface(368) = {367};
Line Loop(369) = {-156, 51, 157, -140};
Ruled Surface(370) = {369};
Line Loop(371) = {-157, 52, 158, -141};
Ruled Surface(372) = {371};
Line Loop(373) = {-158, 53, 159, -142};
Ruled Surface(374) = {373};
Line Loop(375) = {-159, 54, 160, -143};
Ruled Surface(376) = {375};
Line Loop(377) = {-160, 55, 161, -144};
Ruled Surface(378) = {377};
Line Loop(379) = {-161, 56, 154, -145};
Ruled Surface(380) = {379};

Line Loop(405) = {126, -57, 154, 146};
Ruled Surface(406) = {405};
Line Loop(407) = {127, -58, 155, 147};
Ruled Surface(408) = {407};
Line Loop(409) = {128, -59, 156, 148};
Ruled Surface(410) = {409};
Line Loop(411) = {129, -60, 157, 149};
Ruled Surface(412) = {411};
Line Loop(413) = {130, -61, 158, 150};
Ruled Surface(414) = {413};
Line Loop(415) = {131, -62, 159, 151};
Ruled Surface(416) = {415};
Line Loop(417) = {132, -63, 160, 152};
Ruled Surface(418) = {417};
Line Loop(419) = {133, -64, 161, 153};
Ruled Surface(420) = {419};

Surface Loop(2001) = {302, 358, 326, 334, 336, 328};
Volume(2002) = {2001};
Surface Loop(2003) = {304, 360, 328, 338, 340, 330};
Volume(2004) = {2003};
Surface Loop(2005) = {306, 362, 330, 342, 344, 332};
Volume(2006) = {2005};
Surface Loop(2007) = {308, 364, 332, 346, 348, 326};
Volume(2008) = {2007};

Surface Loop(2009) = {310, 366, 406, 150, 408, 334};
Volume(2010) = {2009};
Surface Loop(2011) = {312, 368, 408, 152, 410, 336};
Volume(2012) = {2011};
Surface Loop(2013) = {314, 370, 410, 154, 412, 338};
Volume(2014) = {2013};
Surface Loop(2015) = {316, 372, 412, 156, 414, 340};
Volume(2016) = {2015};
Surface Loop(2017) = {318, 374, 414, 158, 416, 342};
Volume(2018) = {2017};
Surface Loop(2019) = {320, 376, 416, 160, 418, 344};
Volume(2020) = {2019};
Surface Loop(2021) = {322, 378, 418, 162, 420, 346};
Volume(2022) = {2021};
Surface Loop(2023) = {324, 380, 420, 164, 406, 348};
Volume(2024) = {2023};

Surface Loop(2025) = {358, 142, 350, 366, 368, 352};
Volume(2026) = {2025};
Surface Loop(2027) = {360, 144, 352, 370, 372, 354};
Volume(2028) = {2027};
Surface Loop(2029) = {362, 146, 354, 374, 376, 356};
Volume(2030) = {2029};
Surface Loop(2031) = {364, 148, 356, 378, 380, 350};
Volume(2032) = {2031};

// -------- //
// Volume 3 //
// -------- //

Point(68) = {sphereRadius, 0., 0., 1.0};
Point(69) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (Pi) * Cos (Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (Pi) * Sin (Pi)), sphereRadius * cp0 * Cos (Pi), sphereRadius * cp0 * Sin(Pi), 1.0};
Point(70) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (5/4*Pi) * Cos (5/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (5/4*Pi) * Sin (5/4*Pi)), sphereRadius * cp0 * Cos (5/4*Pi), sphereRadius * cp0 * Sin(5/4*Pi), 1.0};
Point(71) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (3/2*Pi) * Cos (3/2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (3/2*Pi) * Sin (3/2*Pi)), sphereRadius * cp0 * Cos (3/2*Pi), sphereRadius * cp0 * Sin(3/2*Pi), 1.0};
Point(72) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (7/4*Pi) * Cos (7/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (7/4*Pi) * Sin (7/4*Pi)), sphereRadius * cp0 * Cos (7/4*Pi), sphereRadius * cp0 * Sin(7/4*Pi), 1.0};
Point(73) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (2*Pi) * Cos (2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (2*Pi) * Sin (2*Pi)), sphereRadius * cp0 * Cos (2*Pi), sphereRadius * cp0 * Sin(2*Pi), 1.0};
Point(74) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (1/4*Pi) * Cos (1/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (1/4*Pi) * Sin (1/4*Pi)), sphereRadius * cp0 * Cos (1/4*Pi), sphereRadius * cp0 * Sin(1/4*Pi), 1.0};
Point(75) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (1/2*Pi) * Cos (1/2*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (1/2*Pi) * Sin (1/2*Pi)), sphereRadius * cp0 * Cos (1/2*Pi), sphereRadius * cp0 * Sin(1/2*Pi), 1.0};
Point(76) = {Sqrt(sphereRadius*sphereRadius - (sphereRadius*sphereRadius*cp0*cp0) * Cos (3/4*Pi) * Cos (3/4*Pi) - (sphereRadius*sphereRadius*cp0*cp0) * Sin (3/4*Pi) * Sin (3/4*Pi)), sphereRadius * cp0 * Cos (3/4*Pi), sphereRadius * cp0 * Sin(3/4*Pi), 1.0};

Circle(164) = {68, 1000, 69};
Circle(165) = {68, 1000, 71};
Circle(166) = {68, 1000, 73};
Circle(167) = {68, 1000, 75};

Circle(168) = {69, 1000, 70};
Circle(169) = {70, 1000, 71};
Circle(170) = {71, 1000, 72};
Circle(171) = {72, 1000, 73};
Circle(172) = {73, 1000, 74};
Circle(173) = {74, 1000, 75};
Circle(174) = {75, 1000, 76};
Circle(175) = {76, 1000, 69};

Circle(176) = {69, 1000, 28};
Circle(177) = {70, 1000, 29};
Circle(178) = {71, 1000, 30};
Circle(179) = {72, 1000, 31};
Circle(180) = {73, 1000, 32};
Circle(181) = {74, 1000, 33};
Circle(182) = {75, 1000, 34};
Circle(183) = {76, 1000, 35};

Point(77) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(Pi), sourceRadius * cp2 * Sin(Pi),  1.0};
Point(78) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(5/4*Pi), sourceRadius * cp2 * Sin(5/4*Pi), 1.0};
Point(79) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(3/2*Pi), sourceRadius * cp2 * Sin(3/2*Pi), 1.0};
Point(80) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(7/4*Pi), sourceRadius * cp2 * Sin(7/4*Pi), 1.0};
Point(81) = {sourceRadius * cp3, sourceRadius * cp2, 0., 1.0};
Point(82) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(1/4*Pi), sourceRadius * cp2 * Sin(1/4*Pi), 1.0};
Point(83) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(1/2*Pi), sourceRadius * cp2 * Sin(1/2*Pi), 1.0};
Point(84) = {sourceRadius * cp3, sourceRadius * cp2 * Cos(3/4*Pi), sourceRadius * cp2 * Sin(3/4*Pi), 1.0};

Point(3000) = {cp4, 0., 0., 1.0};

Line(184) = {3000, 77};
Line(185) = {3000, 79};
Line(186) = {3000, 81};
Line(187) = {3000, 83};

Line(188) = {77, 78};
Line(189) = {78, 79};
Line(190) = {79, 80};
Line(191) = {80, 81};
Line(192) = {81, 82};
Line(193) = {82, 83};
Line(194) = {83, 84};
Line(195) = {84, 77};

Line(196) = {52, 77};
Line(197) = {53, 78};
Line(198) = {54, 79};
Line(199) = {55, 80};
Line(200) = {56, 81};
Line(201) = {57, 82};
Line(202) = {58, 83};
Line(203) = {59, 84};

Line(204) = {77, 69};
Line(205) = {78, 70};
Line(206) = {79, 71};
Line(207) = {80, 72};
Line(208) = {81, 73};
Line(209) = {82, 74};
Line(210) = {83, 75};
Line(211) = {84, 76};

Line(212) = {1000, 3000};
Line(213) = {3000, 68};

Line Loop(525) = {114, 196, -184, -212};
Ruled Surface(526) = {525};
Line Loop(527) = {115, 198, -185, -212};
Ruled Surface(528) = {527};
Line Loop(529) = {116, 200, -186, -212};
Ruled Surface(530) = {529};
Line Loop(531) = {117, 202, -187, -212};
Ruled Surface(532) = {531};

Line Loop(533) = {196, 188, -197, -118};
Ruled Surface(534) = {533};
Line Loop(535) = {197, 189, -198, -119};
Ruled Surface(536) = {535};
Line Loop(537) = {198, 190, -199, -120};
Ruled Surface(538) = {537};
Line Loop(539) = {199, 191, -200, -121};
Ruled Surface(540) = {539};
Line Loop(541) = {200, 192, -201, -122};
Ruled Surface(542) = {541};
Line Loop(543) = {201, 193, -202, -123};
Ruled Surface(544) = {543};
Line Loop(545) = {202, 194, -203, -124};
Ruled Surface(546) = {545};
Line Loop(547) = {203, 195, -196, -125};
Ruled Surface(548) = {547};

Line Loop(549) = {184, 204, -164, -213};
Ruled Surface(550) = {549};
Line Loop(551) = {185, 206, -165, -213};
Ruled Surface(552) = {551};
Line Loop(553) = {186, 208, -166, -213};
Ruled Surface(554) = {553};
Line Loop(555) = {187, 210, -167, -213};
Ruled Surface(556) = {555};

Line Loop(557) = {184, 188, 189, -185};
Ruled Surface(558) = {557};
Line Loop(559) = {185, 190, 191, -186};
Ruled Surface(560) = {559};
Line Loop(561) = {186, 192, 193, -187};
Ruled Surface(562) = {561};
Line Loop(563) = {187, 194, 195, -184};
Ruled Surface(564) = {563};

Line Loop(565) = {204, 168, -205, -188};
Ruled Surface(566) = {565};
Line Loop(567) = {205, 169, -206, -189};
Ruled Surface(568) = {567};
Line Loop(569) = {206, 170, -207, -190};
Ruled Surface(570) = {569};
Line Loop(571) = {207, 171, -208, -191};
Ruled Surface(572) = {571};
Line Loop(573) = {208, 172, -209, -192};
Ruled Surface(574) = {573};
Line Loop(575) = {209, 173, -210, -193};
Ruled Surface(576) = {575};
Line Loop(577) = {210, 174, -211, -194};
Ruled Surface(578) = {577};
Line Loop(579) = {211, 175, -204, -195};
Ruled Surface(580) = {579};

Line Loop(581) = {164, 168, 169, -165};
Ruled Surface(582) = {581};
Line Loop(583) = {165, 170, 171, -166};
Ruled Surface(584) = {583};
Line Loop(585) = {166, 172, 173, -167};
Ruled Surface(586) = {585};
Line Loop(587) = {167, 174, 175, -164};
Ruled Surface(588) = {587};

Line Loop(589) = {-176, 168, 177, -65};
Ruled Surface(590) = {589};
Line Loop(591) = {-177, 169, 178, -66};
Ruled Surface(592) = {591};
Line Loop(593) = {-178, 170, 179, -67};
Ruled Surface(594) = {593};
Line Loop(595) = {-179, 171, 180, -68};
Ruled Surface(596) = {595};
Line Loop(597) = {-180, 172, 181, -69};
Ruled Surface(598) = {597};
Line Loop(599) = {-181, 173, 182, -70};
Ruled Surface(600) = {599};
Line Loop(601) = {-182, 174, 183, -71};
Ruled Surface(602) = {601};
Line Loop(603) = {-183, 175, 176, -72};
Ruled Surface(604) = {603};

Line Loop(605) = {126, -176, -204, -196};
Ruled Surface(606) = {605};
Line Loop(607) = {127, -177, -205, -197};
Ruled Surface(608) = {607};
Line Loop(609) = {128, -178, -206, -198};
Ruled Surface(610) = {609};
Line Loop(611) = {129, -179, -207, -199};
Ruled Surface(612) = {611};
Line Loop(613) = {130, -180, -208, -200};
Ruled Surface(614) = {613};
Line Loop(615) = {131, -181, -209, -201};
Ruled Surface(616) = {615};
Line Loop(617) = {132, -182, -210, -202};
Ruled Surface(618) = {617};
Line Loop(619) = {133, -183, -211, -203};
Ruled Surface(620) = {619};

Surface Loop(3001) = {302, 558, 526, 534, 536, 528};
Volume(3002) = {3001};
Surface Loop(3003) = {304, 560, 528, 538, 540, 530};
Volume(3004) = {3003};
Surface Loop(3005) = {306, 562, 530, 542, 544, 532};
Volume(3006) = {3005};
Surface Loop(3007) = {308, 564, 532, 546, 548, 526};
Volume(3008) = {3007};

Surface Loop(3009) = {310, 566, 606, 590, 608, 534};
Volume(3010) = {3009};
Surface Loop(3011) = {312, 568, 608, 592, 610, 536};
Volume(3012) = {3011};
Surface Loop(3013) = {314, 570, 610, 594, 612, 538};
Volume(3014) = {3013};
Surface Loop(3015) = {316, 572, 612, 596, 614, 540};
Volume(3016) = {3015};
Surface Loop(3017) = {318, 574, 614, 598, 616, 542};
Volume(3018) = {3017};
Surface Loop(3019) = {320, 576, 616, 600, 618, 544};
Volume(3020) = {3019};
Surface Loop(3021) = {322, 578, 618, 602, 620, 546};
Volume(3022) = {3021};
Surface Loop(3023) = {324, 580, 620, 604, 606, 548};
Volume(3024) = {3023};

Surface Loop(3025) = {558, 582, 550, 566, 568, 552};
Volume(3026) = {3025};
Surface Loop(3027) = {560, 584, 552, 570, 572, 554};
Volume(3028) = {3027};
Surface Loop(3029) = {562, 586, 554, 574, 576, 556};
Volume(3030) = {3029};
Surface Loop(3031) = {564, 588, 556, 578, 580, 550};
Volume(3032) = {3031};

// -------- //
// Volume 4 //
// -------- //

Point(85) = {xb, 0., 0., 1.0};
Point(86) = {xb, sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), 1.0};
Point(87) = {xb, sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), 1.0};
Point(88) = {xb, sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), 1.0};
Point(89) = {xb, sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), 1.0};
Point(90) = {xb, sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), 1.0};
Point(91) = {xb, sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), 1.0};
Point(92) = {xb, sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), 1.0};
Point(93) = {xb, sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), 1.0};

Point(94) = {xb, domainRadius * Cos(Pi), domainRadius * Sin(Pi), 1.0};
Point(95) = {xb, domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), 1.0};
Point(96) = {xb, domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), 1.0};
Point(97) = {xb, domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), 1.0};
Point(98) = {xb, domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), 1.0};
Point(99) = {xb, domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), 1.0};
Point(100) = {xb, domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), 1.0};
Point(101) = {xb, domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), 1.0};

Point(102) = {xb, sourceRadius * cp0 * Cos(Pi), sourceRadius * cp0 * Sin(Pi),  1.0};
Point(103) = {xb, sourceRadius * cp0 * Cos(5/4*Pi), sourceRadius * cp0 * Sin(5/4*Pi), 1.0};
Point(104) = {xb, sourceRadius * cp0 * Cos(3/2*Pi), sourceRadius * cp0 * Sin(3/2*Pi), 1.0};
Point(105) = {xb, sourceRadius * cp0 * Cos(7/4*Pi), sourceRadius * cp0 * Sin(7/4*Pi), 1.0};
Point(106) = {xb, sourceRadius * cp0, 0., 1.0};
Point(107) = {xb, sourceRadius * cp0 * Cos(1/4*Pi), sourceRadius * cp0 * Sin(1/4*Pi), 1.0};
Point(108) = {xb, sourceRadius * cp0 * Cos(1/2*Pi), sourceRadius * cp0 * Sin(1/2*Pi), 1.0};
Point(109) = {xb, sourceRadius * cp0 * Cos(3/4*Pi), sourceRadius * cp0 * Sin(3/4*Pi), 1.0};

Line(214) = {85, 102};
Line(215) = {85, 104};
Line(216) = {85, 106};
Line(217) = {85, 108};

Line(218) = {102, 103};
Line(219) = {103, 104};
Line(220) = {104, 105};
Line(221) = {105, 106};
Line(222) = {106, 107};
Line(223) = {107, 108};
Line(224) = {108, 109};
Line(225) = {109, 102};

Line(226) = {102, 86};
Line(227) = {103, 87};
Line(228) = {104, 88};
Line(229) = {105, 89};
Line(230) = {106, 90};
Line(231) = {107, 91};
Line(232) = {108, 92};
Line(233) = {109, 93};

Circle(234) = {86, 85, 87};
Circle(235) = {87, 85, 88};
Circle(236) = {88, 85, 89};
Circle(237) = {89, 85, 90};
Circle(238) = {90, 85, 91};
Circle(239) = {91, 85, 92};
Circle(240) = {92, 85, 93};
Circle(241) = {93, 85, 86};

Line(242) = {86, 94};
Line(243) = {87, 95};
Line(244) = {88, 96};
Line(245) = {89, 97};
Line(246) = {90, 98};
Line(247) = {91, 99};
Line(248) = {92, 100};
Line(249) = {93, 101};

Circle(250) = {94, 85, 95};
Circle(251) = {95, 85, 96};
Circle(252) = {96, 85, 97};
Circle(253) = {97, 85, 98};
Circle(254) = {98, 85, 99};
Circle(255) = {99, 85, 100};
Circle(256) = {100, 85, 101};
Circle(257) = {101, 85, 94};

Line(258) = {68, 85};

Line(259) = {28, 86};
Line(260) = {29, 87};
Line(261) = {30, 88};
Line(262) = {31, 89};
Line(263) = {32, 90};
Line(264) = {33, 91};
Line(265) = {34, 92};
Line(266) = {35, 93};

Line(267) = {36, 94};
Line(268) = {37, 95};
Line(269) = {38, 96};
Line(270) = {39, 97};
Line(271) = {40, 98};
Line(272) = {41, 99};
Line(273) = {42, 100};
Line(274) = {43, 101};

Line(275) = {69, 102};
Line(276) = {70, 103};
Line(277) = {71, 104};
Line(278) = {72, 105};
Line(279) = {73, 106};
Line(280) = {74, 107};
Line(281) = {75, 108};
Line(282) = {76, 109};

Line Loop(701) = {214, 218, 219, -215};
Ruled Surface(702) = {701};
Line Loop(703) = {215, 220, 221, -216};
Ruled Surface(704) = {703};
Line Loop(705) = {216, 222, 223, -217};
Ruled Surface(706) = {705};
Line Loop(707) = {217, 224, 225, -214};
Ruled Surface(708) = {707};

Line Loop(709) = {226, 234, -227, -218};
Ruled Surface(710) = {709};
Line Loop(711) = {227, 235, -228, -219};
Ruled Surface(712) = {711};
Line Loop(713) = {228, 236, -229, -220};
Ruled Surface(714) = {713};
Line Loop(715) = {229, 237, -230, -221};
Ruled Surface(716) = {715};
Line Loop(717) = {230, 238, -231, -222};
Ruled Surface(718) = {717};
Line Loop(719) = {231, 239, -232, -223};
Ruled Surface(720) = {719};
Line Loop(721) = {232, 240, -233, -224};
Ruled Surface(722) = {721};
Line Loop(723) = {233, 241, -226, -225};
Ruled Surface(724) = {723};

Line Loop(725) = {242, 250, -243, -234};
Ruled Surface(726) = {725};
Line Loop(727) = {243, 251, -244, -235};
Ruled Surface(728) = {727};
Line Loop(729) = {244, 252, -245, -236};
Ruled Surface(730) = {729};
Line Loop(731) = {245, 253, -246, -237};
Ruled Surface(732) = {731};
Line Loop(733) = {246, 254, -247, -238};
Ruled Surface(734) = {733};
Line Loop(735) = {247, 255, -248, -239};
Ruled Surface(736) = {735};
Line Loop(737) = {248, 256, -249, -240};
Ruled Surface(738) = {737};
Line Loop(739) = {249, 257, -242, -241};
Ruled Surface(740) = {739};

Line Loop(781) = {258, 214, -275, -164};
Ruled Surface(782) = {781};
Line Loop(783) = {258, 215, -277, -165};
Ruled Surface(784) = {783};
Line Loop(785) = {258, 216, -279, -166};
Ruled Surface(786) = {785};
Line Loop(787) = {258, 217, -281, -167};
Ruled Surface(788) = {787};

Line Loop(789) = {168, 276, -218, -275};
Ruled Surface(790) = {789};
Line Loop(791) = {169, 277, -219, -276};
Ruled Surface(792) = {791};
Line Loop(793) = {170, 278, -220, -277};
Ruled Surface(794) = {793};
Line Loop(795) = {171, 279, -221, -278};
Ruled Surface(796) = {795};
Line Loop(797) = {172, 280, -222, -279};
Ruled Surface(798) = {797};
Line Loop(799) = {173, 281, -223, -280};
Ruled Surface(800) = {799};
Line Loop(801) = {174, 282, -224, -281};
Ruled Surface(802) = {801};
Line Loop(803) = {175, 275, -225, -282};
Ruled Surface(804) = {803};

Line Loop(805) = {176, 259, -226, -275};
Ruled Surface(806) = {805};
Line Loop(807) = {177, 260, -227, -276};
Ruled Surface(808) = {807};
Line Loop(809) = {178, 261, -228, -277};
Ruled Surface(810) = {809};
Line Loop(811) = {179, 262, -229, -278};
Ruled Surface(812) = {811};
Line Loop(813) = {180, 263, -230, -279};
Ruled Surface(814) = {813};
Line Loop(815) = {181, 264, -231, -280};
Ruled Surface(816) = {815};
Line Loop(817) = {182, 265, -232, -281};
Ruled Surface(818) = {817};
Line Loop(819) = {183, 266, -233, -282};
Ruled Surface(820) = {819};

Line Loop(821) = {65, 260, -234, -259};
Ruled Surface(822) = {821};
Line Loop(823) = {66, 261, -235, -260};
Ruled Surface(824) = {823};
Line Loop(825) = {67, 262, -236, -261};
Ruled Surface(826) = {825};
Line Loop(827) = {68, 263, -237, -262};
Ruled Surface(828) = {827};
Line Loop(829) = {69, 264, -238, -263};
Ruled Surface(830) = {829};
Line Loop(831) = {70, 265, -239, -264};
Ruled Surface(832) = {831};
Line Loop(833) = {71, 266, -240, -265};
Ruled Surface(834) = {833};
Line Loop(835) = {72, 259, -241, -266};
Ruled Surface(836) = {835};

Line Loop(837) = {73, 267, -242, -259};
Ruled Surface(838) = {837};
Line Loop(839) = {74, 268, -243, -260};
Ruled Surface(840) = {839};
Line Loop(841) = {75, 269, -244, -261};
Ruled Surface(842) = {841};
Line Loop(843) = {76, 270, -245, -262};
Ruled Surface(844) = {843};
Line Loop(845) = {77, 271, -246, -263};
Ruled Surface(846) = {845};
Line Loop(847) = {78, 272, -247, -264};
Ruled Surface(848) = {847};
Line Loop(849) = {79, 273, -248, -265};
Ruled Surface(850) = {849};
Line Loop(851) = {80, 274, -249, -266};
Ruled Surface(852) = {851};

Line Loop(853) = {81, 268, -250, -267};
Ruled Surface(854) = {853};
Line Loop(855) = {82, 269, -251, -268};
Ruled Surface(856) = {855};
Line Loop(857) = {83, 270, -252, -269};
Ruled Surface(858) = {857};
Line Loop(859) = {84, 271, -253, -270};
Ruled Surface(860) = {859};
Line Loop(861) = {85, 272, -254, -271};
Ruled Surface(862) = {861};
Line Loop(863) = {86, 273, -255, -272};
Ruled Surface(864) = {863};
Line Loop(865) = {87, 274, -256, -273};
Ruled Surface(866) = {865};
Line Loop(867) = {88, 267, -257, -274};
Ruled Surface(868) = {867};

Surface Loop(4001) = {582, 702, 790, 792, 784, 782};
Volume(4002) = {4001};
Surface Loop(4003) = {584, 704, 794, 796, 786, 784};
Volume(4004) = {4003};
Surface Loop(4005) = {586, 706, 798, 800, 788, 786};
Volume(4006) = {4005};
Surface Loop(4007) = {588, 708, 802, 804, 782, 788};
Volume(4008) = {4007};

Surface Loop(4009) = {590, 710, 822, 808, 790, 806};
Volume(4010) = {4009};
Surface Loop(4011) = {592, 712, 824, 810, 792, 808};
Volume(4012) = {4011};
Surface Loop(4013) = {594, 714, 826, 812, 794, 810};
Volume(4014) = {4013};
Surface Loop(4015) = {596, 716, 828, 814, 796, 812};
Volume(4016) = {4015};
Surface Loop(4017) = {598, 718, 830, 816, 798, 814};
Volume(4018) = {4017};
Surface Loop(4019) = {600, 720, 832, 818, 800, 816};
Volume(4020) = {4019};
Surface Loop(4021) = {602, 722, 834, 820, 802, 818};
Volume(4022) = {4021};
Surface Loop(4023) = {604, 724, 836, 806, 804, 820};
Volume(4024) = {4023};

Surface Loop(4025) = {166, 726, 854, 840, 822, 838};
Volume(4026) = {4025};
Surface Loop(4027) = {168, 728, 856, 842, 824, 840};
Volume(4028) = {4027};
Surface Loop(4029) = {170, 730, 858, 844, 826, 842};
Volume(4030) = {4029};
Surface Loop(4031) = {172, 732, 860, 846, 828, 844};
Volume(4032) = {4031};
Surface Loop(4033) = {174, 734, 862, 848, 830, 846};
Volume(4034) = {4033};
Surface Loop(4035) = {176, 736, 864, 850, 832, 848};
Volume(4036) = {4035};
Surface Loop(4037) = {178, 738, 866, 852, 834, 850};
Volume(4038) = {4037};
Surface Loop(4039) = {180, 740, 868, 838, 836, 852};
Volume(4040) = {4039};

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {102, 104, 106, 108,
                       110, 112, 114, 116, 118, 120, 122, 124};
Physical Surface(2) = {254, 256, 258, 260, 262, 264, 266, 268,
                       854, 856, 858, 860, 862, 864, 866, 868,
                       702, 704, 706, 708,
                       710, 712, 714, 716, 718, 720, 722, 724,
                       726, 728, 730, 732, 734, 736, 738, 740};
Physical Surface(3) = {126, 128, 130, 132, 134, 136, 138, 140};

Physical Volume(1) = {1002, 1004, 1006, 1008,
                      1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024,
                      1026, 1028, 1030, 1032, 1034, 1036, 1038, 1040,
                      4002, 4004, 4006, 4008,
                      4010, 4012, 4014, 4016, 4018, 4020, 4022, 4024,
                      4026, 4028, 4030, 4032, 4034, 4036, 4038, 4040};

Physical Volume(2) = {2002, 2004, 2006, 2008,
                      2010, 2012, 2014, 2016, 2018, 2020, 2022, 2024,
                      2026, 2028, 2030, 2032,
                      3002, 3004, 3006, 3008,
                      3010, 3012, 3014, 3016, 3018, 3020, 3022, 3024,
                      3026, 3028, 3030, 3032};

// --------------- //
// Set transfinite //
// --------------- //

numPoints1 = Ceil(numElementPerWavelength1 * (sourceRadius * cp0) / wavelength);
numPoints2 = Ceil(numElementPerWavelength2 * (sourceRadius - sourceRadius * cp0) / wavelength);
numPoints3 = Ceil(numElementPerWavelength1 * (domainRadius - sourceRadius) / wavelength);
numPoints4 = Ceil(numElementPerWavelength1 * (- sphereRadius - xa) / wavelength);
numPoints5 = Ceil(numElementPerWavelength1 * (xb - sphereRadius) / wavelength);

Transfinite Line {1, 2, 3, 4,
                  5, 6, 7, 8, 9, 10, 11, 12,
                  21, 22, 23, 24, 25, 26, 27, 28,
                  37, 38, 39, 40, 41, 42, 43, 44,
                  45, 46, 47, 48,
                  49, 50, 51, 52, 53, 54, 55, 56,
                  65, 66, 67, 68, 69, 70, 71, 72,
                  81, 82, 83, 84, 85, 86, 87, 88,
                  114, 115, 116, 117,
                  118, 119, 120, 121, 122, 123, 124, 125,
                  134, 135, 136, 137,
                  138, 139, 140, 141, 142, 143, 144, 145,
                  164, 165, 166, 167,
                  168, 169, 170, 171, 172, 173, 174, 175,
                  184, 185, 186, 187,
                  188, 189, 190, 191, 192, 193, 194, 195,
                  214, 215, 216, 217,
                  218, 219, 220, 221, 222, 223, 224, 225,
                  234, 235, 236, 237, 238, 239, 240, 241,
                  250, 251, 252, 253, 254, 255, 256, 257} = numPoints1;

Transfinite Line {13, 14, 15, 16, 17, 18, 19, 20,
                  57, 58, 59, 60, 61, 62, 63, 64,
                  126, 127, 128, 129, 130, 131, 132, 133,
                  176, 177, 178, 179, 180, 181, 182, 183,
                  226, 227, 228, 229, 230, 231, 232, 233,
                  146, 147, 148, 149, 150, 151, 152, 153,
                  163,
                  196, 197, 198, 199, 200, 201, 202, 203,
                  212,
                  154, 155, 156, 157, 158, 159, 160, 161,
                  162,
                  204, 205, 206, 207, 208, 209, 210, 211,
                  213} = numPoints2;

Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36, 
                  73, 74, 75, 76, 77, 78, 79, 80,
                  242, 243, 244, 245, 246, 247, 248, 249} = numPoints3;

Transfinite Line {89,
                  90, 91, 92, 93, 94, 95, 96, 97,
                  98, 99, 100, 101, 102, 103, 104, 105,
                  106, 107, 108, 109, 110, 111, 112, 113} = numPoints4;

Transfinite Line {258,
                  259, 260, 261, 262, 263, 264, 265, 266,
                  267, 268, 269, 270, 271, 272, 273, 274,
                  275, 276, 277, 278, 279, 280, 281, 282} = numPoints5;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";

// ---------------- //
// Print parameters //
// ---------------- //

Printf("The wavelength is %g meter", wavelength);
Printf("Number of points 1 is %g", numPoints1);
Printf("Number of points 2 is %g", numPoints2);
Printf("Number of points 3 is %g", numPoints3);
Printf("Number of points 4 is %g", numPoints4);
