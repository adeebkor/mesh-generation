// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 3D circular planar problem
// - structured mesh
//
// ----------------------------------------------------------------------------
// Copyright (C) 2023 Adeeb Arif Kor

// ---------------------------- //
// Geometry and mesh parameters //
// ---------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 5;  // 1 to 13
domainRadius = 0.035 + numExtraWavelength*wavelength;

numElementPerWavelength = 2;
sourceRadius = 0.01;

// -------- //
// Volume 1 //
// -------- //

Point(1) = {0., 0., 0., 1.0};
Point(2) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), 0., 1.0};
Point(3) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), 0., 1.0};
Point(4) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), 0., 1.0};
Point(5) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), 0., 1.0};
Point(6) = {sourceRadius, 0., 0., 1.0};
Point(7) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), 0., 1.0};
Point(8) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), 0., 1.0};
Point(9) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), 0., 1.0};

Point(10) = {domainRadius, 0., 0., 1.0};
Point(11) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), 0., 1.0};
Point(12) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), 0., 1.0};
Point(13) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), 0., 1.0};
Point(14) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), 0., 1.0};
Point(15) = {domainRadius, 0., 0., 1.0};
Point(16) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), 0., 1.0};
Point(17) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), 0., 1.0};
Point(18) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), 0., 1.0};

Point(19) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), 0., 1.0};
Point(20) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), 0., 1.0};
Point(21) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), 0., 1.0};
Point(22) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), 0., 1.0};
Point(23) = {sourceRadius / 2, 0., 0., 1.0};
Point(24) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), 0., 1.0};
Point(25) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), 0., 1.0};
Point(26) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), 0., 1.0};

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

radiusOfCurvature1 = 0.075;
focalPoint1 = 0.03 + radiusOfCurvature1;

Point(27) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1), 1.0};
Point(28) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(29) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(30) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(31) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(32) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(33) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(34) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(35) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};

Point(36) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(37) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(38) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(39) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(40) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(41) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(42) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(43) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};

Point(44) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(45) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(46) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(47) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(48) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(49) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(50) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(51) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};

Point(1000) = {0., 0., focalPoint1, 1.0};
Point(1001) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2), 1.0};

Circle(45) = {27, 1000, 44};
Circle(46) = {27, 1000, 46};
Circle(47) = {27, 1000, 48};
Circle(48) = {27, 1000, 50};

Circle(49) = {44, 1001, 45};
Circle(50) = {45, 1001, 46};
Circle(51) = {46, 1001, 47};
Circle(52) = {47, 1001, 48};
Circle(53) = {48, 1001, 49};
Circle(54) = {49, 1001, 50};
Circle(55) = {50, 1001, 51};
Circle(56) = {51, 1001, 44};

Circle(57) = {44, 1000, 28};
Circle(58) = {45, 1000, 29};
Circle(59) = {46, 1000, 30};
Circle(60) = {47, 1000, 31};
Circle(61) = {48, 1000, 32};
Circle(62) = {49, 1000, 33};
Circle(63) = {50, 1000, 34};
Circle(64) = {51, 1000, 35};

Point(1002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius), 1.0};

Circle(65) = {28, 1002, 29};
Circle(66) = {29, 1002, 30};
Circle(67) = {30, 1002, 31};
Circle(68) = {31, 1002, 32};
Circle(69) = {32, 1002, 33};
Circle(70) = {33, 1002, 34};
Circle(71) = {34, 1002, 35};
Circle(72) = {35, 1002, 28};

Circle(73) = {28, 1000, 36};
Circle(74) = {29, 1000, 37};
Circle(75) = {30, 1000, 38};
Circle(76) = {31, 1000, 39};
Circle(77) = {32, 1000, 40};
Circle(78) = {33, 1000, 41};
Circle(79) = {34, 1000, 42};
Circle(80) = {35, 1000, 43};

Point(1003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius), 1.0};

Circle(81) = {36, 1003, 37};
Circle(82) = {37, 1003, 38};
Circle(83) = {38, 1003, 39};
Circle(84) = {39, 1003, 40};
Circle(85) = {40, 1003, 41};
Circle(86) = {41, 1003, 42};
Circle(87) = {42, 1003, 43};
Circle(88) = {43, 1003, 36};

Line(89) = {19, 44};
Line(90) = {20, 45};
Line(91) = {21, 46};
Line(92) = {22, 47};
Line(93) = {23, 48};
Line(94) = {24, 49};
Line(95) = {25, 50};
Line(96) = {26, 51};

Line(97) = {2, 28};
Line(98) = {3, 29};
Line(99) = {4, 30};
Line(100) = {5, 31};
Line(101) = {6, 32};
Line(102) = {7, 33};
Line(103) = {8, 34};
Line(104) = {9, 35};

Line(105) = {11, 36};
Line(106) = {12, 37};
Line(107) = {13, 38};
Line(108) = {14, 39};
Line(109) = {15, 40};
Line(110) = {16, 41};
Line(111) = {17, 42};
Line(112) = {18, 43};

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

Line Loop(181) = {5, 90, -49, -89};
Ruled Surface(182) = {181};
Line Loop(183) = {6, 91, -50, -90};
Ruled Surface(184) = {183};
Line Loop(185) = {7, 92, -51, -91};
Ruled Surface(186) = {185};
Line Loop(187) = {8, 93, -52, -92};
Ruled Surface(188) = {187};
Line Loop(189) = {9, 94, -53, -93};
Ruled Surface(190) = {189};
Line Loop(191) = {10, 95, -54, -94};
Ruled Surface(192) = {191};
Line Loop(193) = {11, 96, -55, -95};
Ruled Surface(194) = {193};
Line Loop(195) = {12, 89, -56, -96};
Ruled Surface(196) = {195};

Line Loop(197) = {21, 98, -65, -97};
Ruled Surface(198) = {197};
Line Loop(199) = {22, 99, -66, -98};
Ruled Surface(200) = {199};
Line Loop(201) = {23, 100, -67, -99};
Ruled Surface(202) = {201};
Line Loop(203) = {24, 101, -68, -100};
Ruled Surface(204) = {203};
Line Loop(205) = {25, 102, -69, -101};
Ruled Surface(206) = {205};
Line Loop(207) = {26, 103, -70, -102};
Ruled Surface(208) = {207};
Line Loop(209) = {27, 104, -71, -103};
Ruled Surface(210) = {209};
Line Loop(211) = {28, 97, -72, -104};
Ruled Surface(212) = {211};

Line Loop(213) = {29, 105, -73, -97};
Ruled Surface(214) = {213};
Line Loop(215) = {30, 106, -74, -98};
Ruled Surface(216) = {215};
Line Loop(217) = {31, 107, -75, -99};
Ruled Surface(218) = {217};
Line Loop(219) = {32, 108, -76, -100};
Ruled Surface(220) = {219};
Line Loop(221) = {33, 109, -77, -101};
Ruled Surface(222) = {221};
Line Loop(223) = {34, 110, -78, -102};
Ruled Surface(224) = {223};
Line Loop(225) = {35, 111, -79, -103};
Ruled Surface(226) = {225};
Line Loop(227) = {36, 112, -80, -104};
Ruled Surface(228) = {227};

Line Loop(229) = {37, 106, -81, -105};
Ruled Surface(230) = {229};
Line Loop(231) = {38, 107, -82, -106};
Ruled Surface(232) = {231};
Line Loop(233) = {39, 108, -83, -107};
Ruled Surface(234) = {233};
Line Loop(235) = {40, 109, -84, -108};
Ruled Surface(236) = {235};
Line Loop(237) = {41, 110, -85, -109};
Ruled Surface(238) = {237};
Line Loop(239) = {42, 111, -86, -110};
Ruled Surface(240) = {239};
Line Loop(241) = {43, 112, -87, -111};
Ruled Surface(242) = {241};
Line Loop(243) = {44, 105, -88, -112};
Ruled Surface(244) = {243};

Line(1004) = {1, 27};
Line Loop(245) = {1, 89, -45, -1004};
Ruled Surface(246) = {245};
Line Loop(247) = {2, 91, -46, -1004};
Ruled Surface(248) = {247};
Line Loop(249) = {3, 93, -47, -1004};
Ruled Surface(250) = {249};
Line Loop(251) = {4, 95, -48, -1004};
Ruled Surface(252) = {251};

Line Loop(253) = {13, 97, -57, -89};
Ruled Surface(254) = {253};
Line Loop(255) = {14, 98, -58, -90};
Ruled Surface(256) = {255};
Line Loop(257) = {15, 99, -59, -91};
Ruled Surface(258) = {257};
Line Loop(259) = {16, 100, -60, -92};
Ruled Surface(260) = {259};
Line Loop(261) = {17, 101, -61, -93};
Ruled Surface(262) = {261};
Line Loop(263) = {18, 102, -62, -94};
Ruled Surface(264) = {263};
Line Loop(265) = {19, 103, -63, -95};
Ruled Surface(266) = {265};
Line Loop(267) = {20, 104, -64, -96};
Ruled Surface(268) = {267};

Surface Loop(1001) = {102, 142, 182, 184, 246, 248};
Volume(1002) = {1001};
Surface Loop(1003) = {104, 144, 186, 188, 248, 250};
Volume(1004) = {1003};
Surface Loop(1005) = {106, 146, 190, 192, 250, 252};
Volume(1006) = {1005};
Surface Loop(1007) = {108, 148, 194, 196, 252, 246};
Volume(1008) = {1007};

Surface Loop(1009) = {182, 198, 254, 256, 110, 150};
Volume(1010) = {1009};
Surface Loop(1011) = {184, 200, 256, 258, 112, 152};
Volume(1012) = {1011};
Surface Loop(1013) = {186, 202, 258, 260, 114, 154};
Volume(1014) = {1013};
Surface Loop(1015) = {188, 204, 260, 262, 116, 156};
Volume(1016) = {1015};
Surface Loop(1017) = {190, 206, 262, 264, 118, 158};
Volume(1018) = {1017};
Surface Loop(1019) = {192, 208, 264, 266, 120, 160};
Volume(1020) = {1019};
Surface Loop(1021) = {194, 210, 266, 268, 122, 162};
Volume(1022) = {1021};
Surface Loop(1023) = {196, 212, 268, 254, 124, 164};
Volume(1024) = {1023};

Surface Loop(1025) = {198, 230, 214, 216, 126, 166};
Volume(1026) = {1025};
Surface Loop(1027) = {200, 232, 216, 218, 128, 168};
Volume(1028) = {1027};
Surface Loop(1029) = {202, 234, 218, 220, 130, 170};
Volume(1030) = {1029};
Surface Loop(1031) = {204, 236, 220, 222, 132, 172};
Volume(1032) = {1031};
Surface Loop(1033) = {206, 238, 222, 224, 134, 174};
Volume(1034) = {1033};
Surface Loop(1035) = {208, 240, 224, 226, 136, 176};
Volume(1036) = {1035};
Surface Loop(1037) = {210, 242, 226, 228, 138, 178};
Volume(1038) = {1037};
Surface Loop(1039) = {212, 244, 228, 214, 140, 180};
Volume(1040) = {1039};

// -------- //
// Volume 2 //
// -------- //

radiusOfCurvature2 = 0.0685;

Point(52) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2), 1.0};
Point(53) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(54) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(55) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(56) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(57) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(58) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(59) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(60) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};

Point(61) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(62) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(63) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(64) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(65) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(66) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(67) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(68) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};

Point(69) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(70) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(71) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(72) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(73) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(74) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(75) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(76) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};

Point(2001) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2), 1.0};

Circle(113) = {52, 1000, 69};
Circle(114) = {52, 1000, 71};
Circle(115) = {52, 1000, 73};
Circle(116) = {52, 1000, 75};

Circle(117) = {69, 2001, 70};
Circle(118) = {70, 2001, 71};
Circle(119) = {71, 2001, 72};
Circle(120) = {72, 2001, 73};
Circle(121) = {73, 2001, 74};
Circle(122) = {74, 2001, 75};
Circle(123) = {75, 2001, 76};
Circle(124) = {76, 2001, 69};

Circle(125) = {69, 1000, 53};
Circle(126) = {70, 1000, 54};
Circle(127) = {71, 1000, 55};
Circle(128) = {72, 1000, 56};
Circle(129) = {73, 1000, 57};
Circle(130) = {74, 1000, 58};
Circle(131) = {75, 1000, 59};
Circle(132) = {76, 1000, 60};

Point(2002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius), 1.0};

Circle(133) = {53, 2002, 54};
Circle(134) = {54, 2002, 55};
Circle(135) = {55, 2002, 56};
Circle(136) = {56, 2002, 57};
Circle(137) = {57, 2002, 58};
Circle(138) = {58, 2002, 59};
Circle(139) = {59, 2002, 60};
Circle(140) = {60, 2002, 53};

Circle(141) = {53, 1000, 61};
Circle(142) = {54, 1000, 62};
Circle(143) = {55, 1000, 63};
Circle(144) = {56, 1000, 64};
Circle(145) = {57, 1000, 65};
Circle(146) = {58, 1000, 66};
Circle(147) = {59, 1000, 67};
Circle(148) = {60, 1000, 68};

Point(2003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius), 1.0};

Circle(149) = {61, 2003, 62};
Circle(150) = {62, 2003, 63};
Circle(151) = {63, 2003, 64};
Circle(152) = {64, 2003, 65};
Circle(153) = {65, 2003, 66};
Circle(154) = {66, 2003, 67};
Circle(155) = {67, 2003, 68};
Circle(156) = {68, 2003, 61};

Line(157) = {44, 69};
Line(158) = {45, 70};
Line(159) = {46, 71};
Line(160) = {47, 72};
Line(161) = {48, 73};
Line(162) = {49, 74};
Line(163) = {50, 75};
Line(164) = {51, 76};

Line(165) = {28, 53};
Line(166) = {29, 54};
Line(167) = {30, 55};
Line(168) = {31, 56};
Line(169) = {32, 57};
Line(170) = {33, 58};
Line(171) = {34, 59};
Line(172) = {35, 60};

Line(173) = {36, 61};
Line(174) = {37, 62};
Line(175) = {38, 63};
Line(176) = {39, 64};
Line(177) = {40, 65};
Line(178) = {41, 66};
Line(179) = {42, 67};
Line(180) = {43, 68};

Line Loop(301) = {113, 117, 118, -114};
Ruled Surface(302) = {301};
Line Loop(303) = {114, 119, 120, -115};
Ruled Surface(304) = {303};
Line Loop(305) = {115, 121, 122, -116};
Ruled Surface(306) = {305};
Line Loop(307) = {116, 123, 124, -113};
Ruled Surface(308) = {307};

Line Loop(309) = {125, 133, -126, -117};
Ruled Surface(310) = {309};
Line Loop(311) = {126, 134, -127, -118};
Ruled Surface(312) = {311};
Line Loop(313) = {127, 135, -128, -119};
Ruled Surface(314) = {313};
Line Loop(315) = {128, 136, -129, -120};
Ruled Surface(316) = {315};
Line Loop(317) = {129, 137, -130, -121};
Ruled Surface(318) = {317};
Line Loop(319) = {130, 138, -131, -122};
Ruled Surface(320) = {319};
Line Loop(321) = {131, 139, -132, -123};
Ruled Surface(322) = {321};
Line Loop(323) = {132, 140, -125, -124};
Ruled Surface(324) = {323};

Line Loop(325) = {141, 149, -142, -133};
Ruled Surface(326) = {325};
Line Loop(327) = {142, 150, -143, -134};
Ruled Surface(328) = {327};
Line Loop(329) = {143, 151, -144, -135};
Ruled Surface(330) = {329};
Line Loop(331) = {144, 152, -145, -136};
Ruled Surface(332) = {331};
Line Loop(333) = {145, 153, -146, -137};
Ruled Surface(334) = {333};
Line Loop(335) = {146, 154, -147, -138};
Ruled Surface(336) = {335};
Line Loop(337) = {147, 155, -148, -139};
Ruled Surface(338) = {337};
Line Loop(339) = {148, 156, -141, -140};
Ruled Surface(340) = {339};

Line Loop(341) = {49, 158, -117, -157};
Ruled Surface(342) = {341};
Line Loop(343) = {50, 159, -118, -158};
Ruled Surface(344) = {343};
Line Loop(345) = {51, 160, -119, -159};
Ruled Surface(346) = {345};
Line Loop(347) = {52, 161, -120, -160};
Ruled Surface(348) = {347};
Line Loop(349) = {53, 162, -121, -161};
Ruled Surface(350) = {349};
Line Loop(351) = {54, 163, -122, -162};
Ruled Surface(352) = {351};
Line Loop(353) = {55, 164, -123, -163};
Ruled Surface(354) = {353};
Line Loop(355) = {56, 157, -124, -164};
Ruled Surface(356) = {355};

Line Loop(357) = {65, 166, -133, -165};
Ruled Surface(358) = {357};
Line Loop(359) = {66, 167, -134, -166};
Ruled Surface(360) = {359};
Line Loop(361) = {67, 168, -135, -167};
Ruled Surface(362) = {361};
Line Loop(363) = {68, 169, -136, -168};
Ruled Surface(364) = {363};
Line Loop(365) = {69, 170, -137, -169};
Ruled Surface(366) = {365};
Line Loop(367) = {70, 171, -138, -170};
Ruled Surface(368) = {367};
Line Loop(369) = {71, 172, -139, -171};
Ruled Surface(370) = {369};
Line Loop(371) = {72, 165, -140, -172};
Ruled Surface(372) = {371};

Line Loop(373) = {73, 173, -141, -165};
Ruled Surface(374) = {373};
Line Loop(375) = {74, 174, -142, -166};
Ruled Surface(376) = {375};
Line Loop(377) = {75, 175, -143, -167};
Ruled Surface(378) = {377};
Line Loop(379) = {76, 176, -144, -168};
Ruled Surface(380) = {379};
Line Loop(381) = {77, 177, -145, -169};
Ruled Surface(382) = {381};
Line Loop(383) = {78, 178, -146, -170};
Ruled Surface(384) = {383};
Line Loop(385) = {79, 179, -147, -171};
Ruled Surface(386) = {385};
Line Loop(387) = {80, 180, -148, -172};
Ruled Surface(388) = {387};

Line Loop(389) = {81, 174, -149, -173};
Ruled Surface(390) = {389};
Line Loop(391) = {82, 175, -150, -174};
Ruled Surface(392) = {391};
Line Loop(393) = {83, 176, -151, -175};
Ruled Surface(394) = {393};
Line Loop(395) = {84, 177, -152, -176};
Ruled Surface(396) = {395};
Line Loop(397) = {85, 178, -153, -177};
Ruled Surface(398) = {397};
Line Loop(399) = {86, 179, -154, -178};
Ruled Surface(400) = {399};
Line Loop(401) = {87, 180, -155, -179};
Ruled Surface(402) = {401};
Line Loop(403) = {88, 173, -156, -180};
Ruled Surface(404) = {403};

Line(2004) = {27, 52};
Line Loop(405) = {45, 157, -113, -2004};
Ruled Surface(406) = {405};
Line Loop(407) = {46, 159, -114, -2004};
Ruled Surface(408) = {407};
Line Loop(409) = {47, 161, -115, -2004};
Ruled Surface(410) = {409};
Line Loop(411) = {48, 163, -116, -2004};
Ruled Surface(412) = {411};

Line Loop(413) = {57, 165, -125, -157};
Ruled Surface(414) = {413};
Line Loop(415) = {58, 166, -126, -158};
Ruled Surface(416) = {415};
Line Loop(417) = {59, 167, -127, -159};
Ruled Surface(418) = {417};
Line Loop(419) = {60, 168, -128, -160};
Ruled Surface(420) = {419};
Line Loop(421) = {61, 169, -129, -161};
Ruled Surface(422) = {421};
Line Loop(423) = {62, 170, -130, -162};
Ruled Surface(424) = {423};
Line Loop(425) = {63, 171, -131, -163};
Ruled Surface(426) = {425};
Line Loop(427) = {64, 172, -132, -164};
Ruled Surface(428) = {427};

Surface Loop(2001) = {142, 302, 342, 344, 406, 408};
Volume(2002) = {2001};
Surface Loop(2003) = {144, 304, 346, 348, 408, 410};
Volume(2004) = {2003};
Surface Loop(2005) = {146, 306, 350, 352, 410, 412};
Volume(2006) = {2005};
Surface Loop(2007) = {148, 308, 354, 356, 412, 406};
Volume(2008) = {2007};

Surface Loop(2009) = {342, 358, 414, 416, 150, 310};
Volume(2010) = {2009};
Surface Loop(2011) = {344, 360, 416, 418, 152, 312};
Volume(2012) = {2011};
Surface Loop(2013) = {346, 362, 418, 420, 154, 314};
Volume(2014) = {2013};
Surface Loop(2015) = {348, 364, 420, 422, 156, 316};
Volume(2016) = {2015};
Surface Loop(2017) = {350, 366, 422, 424, 158, 318};
Volume(2018) = {2017};
Surface Loop(2019) = {352, 368, 424, 426, 160, 320};
Volume(2020) = {2019};
Surface Loop(2021) = {354, 370, 426, 428, 162, 322};
Volume(2022) = {2021};
Surface Loop(2023) = {356, 372, 428, 414, 164, 324};
Volume(2024) = {2023};

Surface Loop(2025) = {358, 390, 374, 376, 166, 326};
Volume(2026) = {2025};
Surface Loop(2027) = {360, 392, 376, 378, 168, 328};
Volume(2028) = {2027};
Surface Loop(2029) = {362, 394, 378, 380, 170, 330};
Volume(2030) = {2029};
Surface Loop(2031) = {364, 396, 380, 382, 172, 332};
Volume(2032) = {2031};
Surface Loop(2033) = {366, 398, 382, 384, 174, 334};
Volume(2034) = {2033};
Surface Loop(2035) = {368, 400, 384, 386, 176, 336};
Volume(2036) = {2035};
Surface Loop(2037) = {370, 402, 386, 388, 178, 338};
Volume(2038) = {2037};
Surface Loop(2039) = {372, 404, 388, 374, 180, 340};
Volume(2040) = {2039};

// -------- //
// Volume 3 //
// -------- //

domainLength = 0.12 + numExtraWavelength*wavelength;

Point(77) = {0., 0., domainLength, 1.0};
Point(78) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), domainLength, 1.0};
Point(79) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(80) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(81) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(82) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), domainLength, 1.0};
Point(83) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(84) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(85) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(86) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), domainLength, 1.0};
Point(87) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(88) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(89) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(90) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), domainLength, 1.0};
Point(91) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(92) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(93) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(94) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi), domainLength, 1.0};
Point(95) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi), domainLength, 1.0};
Point(96) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi), domainLength, 1.0};
Point(97) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi), domainLength, 1.0};
Point(98) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi), domainLength, 1.0};
Point(99) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi), domainLength, 1.0};
Point(100) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi), domainLength, 1.0};
Point(101) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi), domainLength, 1.0};

Line(181) = {77, 94};
Line(182) = {77, 96};
Line(183) = {77, 98};
Line(184) = {77, 100};

Line(185) = {94, 95};
Line(186) = {95, 96};
Line(187) = {96, 97};
Line(188) = {97, 98};
Line(189) = {98, 99};
Line(190) = {99, 100};
Line(191) = {100, 101};
Line(192) = {101, 94};

Line(193) = {94, 78};
Line(194) = {95, 79};
Line(195) = {96, 80};
Line(196) = {97, 81};
Line(197) = {98, 82};
Line(198) = {99, 83};
Line(199) = {100, 84};
Line(200) = {101, 85};

Circle(201) = {78, 77, 79};
Circle(202) = {79, 77, 80};
Circle(203) = {80, 77, 81};
Circle(204) = {81, 77, 82};
Circle(205) = {82, 77, 83};
Circle(206) = {83, 77, 84};
Circle(207) = {84, 77, 85};
Circle(208) = {85, 77, 78};

Line(209) = {78, 86};
Line(210) = {79, 87};
Line(211) = {80, 88};
Line(212) = {81, 89};
Line(213) = {82, 90};
Line(214) = {83, 91};
Line(215) = {84, 92};
Line(216) = {85, 93};

Circle(217) = {86, 77, 87};
Circle(218) = {87, 77, 88};
Circle(219) = {88, 77, 89};
Circle(220) = {89, 77, 90};
Circle(221) = {90, 77, 91};
Circle(222) = {91, 77, 92};
Circle(223) = {92, 77, 93};
Circle(224) = {93, 77, 86};

Line(225) = {69, 94};
Line(226) = {70, 95};
Line(227) = {71, 96};
Line(228) = {72, 97};
Line(229) = {73, 98};
Line(230) = {74, 99};
Line(231) = {75, 100};
Line(232) = {76, 101};

Line(233) = {53, 78};
Line(234) = {54, 79};
Line(235) = {55, 80};
Line(236) = {56, 81};
Line(237) = {57, 82};
Line(238) = {58, 83};
Line(239) = {59, 84};
Line(240) = {60, 85};

Line(241) = {61, 86};
Line(242) = {62, 87};
Line(243) = {63, 88};
Line(244) = {64, 89};
Line(245) = {65, 90};
Line(246) = {66, 91};
Line(247) = {67, 92};
Line(248) = {68, 93};

Line Loop(501) = {181, 185, 186, -182};
Ruled Surface(502) = {501};
Line Loop(503) = {182, 187, 188, -183};
Ruled Surface(504) = {503};
Line Loop(505) = {183, 189, 190, -184};
Ruled Surface(506) = {505};
Line Loop(507) = {184, 191, 192, -181};
Ruled Surface(508) = {507};

Line Loop(509) = {193, 201, -194, -185};
Ruled Surface(510) = {509};
Line Loop(511) = {194, 202, -195, -186};
Ruled Surface(512) = {511};
Line Loop(513) = {195, 203, -196, -187};
Ruled Surface(514) = {513};
Line Loop(515) = {196, 204, -197, -188};
Ruled Surface(516) = {515};
Line Loop(517) = {197, 205, -198, -189};
Ruled Surface(518) = {517};
Line Loop(519) = {198, 206, -199, -190};
Ruled Surface(520) = {519};
Line Loop(521) = {199, 207, -200, -191};
Ruled Surface(522) = {521};
Line Loop(523) = {200, 208, -193, -192};
Ruled Surface(524) = {523};

Line Loop(525) = {209, 217, -210, -201};
Ruled Surface(526) = {525};
Line Loop(527) = {210, 218, -211, -202};
Ruled Surface(528) = {527};
Line Loop(529) = {211, 219, -212, -203};
Ruled Surface(530) = {529};
Line Loop(531) = {212, 220, -213, -204};
Ruled Surface(532) = {531};
Line Loop(533) = {213, 221, -214, -205};
Ruled Surface(534) = {533};
Line Loop(535) = {214, 222, -215, -206};
Ruled Surface(536) = {535};
Line Loop(537) = {215, 223, -216, -207};
Ruled Surface(538) = {537};
Line Loop(539) = {216, 224, -209, -208};
Ruled Surface(540) = {539};

Line Loop(541) = {117, 226, -185, -225};
Ruled Surface(542) = {541};
Line Loop(543) = {118, 227, -186, -226};
Ruled Surface(544) = {543};
Line Loop(545) = {119, 228, -187, -227};
Ruled Surface(546) = {545};
Line Loop(547) = {120, 229, -188, -228};
Ruled Surface(548) = {547};
Line Loop(549) = {121, 230, -189, -229};
Ruled Surface(550) = {549};
Line Loop(551) = {122, 231, -190, -230};
Ruled Surface(552) = {551};
Line Loop(553) = {123, 232, -191, -231};
Ruled Surface(554) = {553};
Line Loop(555) = {124, 225, -192, -232};
Ruled Surface(556) = {555};

Line Loop(557) = {133, 234, -201, -233};
Ruled Surface(558) = {557};
Line Loop(559) = {134, 235, -202, -234};
Ruled Surface(560) = {559};
Line Loop(561) = {135, 236, -203, -235};
Ruled Surface(562) = {561};
Line Loop(563) = {136, 237, -204, -236};
Ruled Surface(564) = {563};
Line Loop(565) = {137, 238, -205, -237};
Ruled Surface(566) = {565};
Line Loop(567) = {138, 239, -206, -238};
Ruled Surface(568) = {567};
Line Loop(569) = {139, 240, -207, -239};
Ruled Surface(570) = {569};
Line Loop(571) = {140, 233, -208, -240};
Ruled Surface(572) = {571};

Line Loop(573) = {141, 241, -209, -233};
Ruled Surface(574) = {573};
Line Loop(575) = {142, 242, -210, -234};
Ruled Surface(576) = {575};
Line Loop(577) = {143, 243, -211, -235};
Ruled Surface(578) = {577};
Line Loop(579) = {144, 244, -212, -236};
Ruled Surface(580) = {579};
Line Loop(581) = {145, 245, -213, -237};
Ruled Surface(582) = {581};
Line Loop(583) = {146, 246, -214, -238};
Ruled Surface(584) = {583};
Line Loop(585) = {147, 247, -215, -239};
Ruled Surface(586) = {585};
Line Loop(587) = {148, 248, -216, -240};
Ruled Surface(588) = {587};

Line Loop(589) = {149, 242, -217, -241};
Ruled Surface(590) = {589};
Line Loop(591) = {150, 243, -218, -242};
Ruled Surface(592) = {591};
Line Loop(593) = {151, 244, -219, -243};
Ruled Surface(594) = {593};
Line Loop(595) = {152, 245, -220, -244};
Ruled Surface(596) = {595};
Line Loop(597) = {153, 246, -221, -245};
Ruled Surface(598) = {597};
Line Loop(599) = {154, 247, -222, -246};
Ruled Surface(600) = {599};
Line Loop(601) = {155, 248, -223, -247};
Ruled Surface(602) = {601};
Line Loop(603) = {156, 241, -224, -248};
Ruled Surface(604) = {603};

Line(3004) = {52, 77};
Line Loop(605) = {113, 225, -181, -3004};
Ruled Surface(606) = {605};
Line Loop(607) = {114, 227, -182, -3004};
Ruled Surface(608) = {607};
Line Loop(609) = {115, 229, -183, -3004};
Ruled Surface(610) = {609};
Line Loop(611) = {116, 231, -184, -3004};
Ruled Surface(612) = {611};

Line Loop(613) = {125, 233, -193, -225};
Ruled Surface(614) = {613};
Line Loop(615) = {126, 234, -194, -226};
Ruled Surface(616) = {615};
Line Loop(617) = {127, 235, -195, -227};
Ruled Surface(618) = {617};
Line Loop(619) = {128, 236, -196, -228};
Ruled Surface(620) = {619};
Line Loop(621) = {129, 237, -197, -229};
Ruled Surface(622) = {621};
Line Loop(623) = {130, 238, -198, -230};
Ruled Surface(624) = {623};
Line Loop(625) = {131, 239, -199, -231};
Ruled Surface(626) = {625};
Line Loop(627) = {132, 240, -200, -232};
Ruled Surface(628) = {627};

Surface Loop(3001) = {302, 502, 542, 544, 606, 608};
Volume(3002) = {3001};
Surface Loop(3003) = {304, 504, 546, 548, 608, 610};
Volume(3004) = {3003};
Surface Loop(3005) = {306, 506, 550, 552, 610, 612};
Volume(3006) = {3005};
Surface Loop(3007) = {308, 508, 554, 556, 612, 606};
Volume(3008) = {3007};

Surface Loop(3009) = {542, 558, 614, 616, 310, 510};
Volume(3010) = {3009};
Surface Loop(3011) = {544, 560, 616, 618, 312, 512};
Volume(3012) = {3011};
Surface Loop(3013) = {546, 562, 618, 620, 314, 514};
Volume(3014) = {3013};
Surface Loop(3015) = {548, 564, 620, 622, 316, 516};
Volume(3016) = {3015};
Surface Loop(3017) = {550, 566, 622, 624, 318, 518};
Volume(3018) = {3017};
Surface Loop(3019) = {552, 568, 624, 626, 320, 520};
Volume(3020) = {3019};
Surface Loop(3021) = {554, 570, 626, 628, 322, 522};
Volume(3022) = {3021};
Surface Loop(3023) = {556, 572, 628, 614, 324, 524};
Volume(3024) = {3023};

Surface Loop(3025) = {558, 590, 574, 576, 326, 526};
Volume(3026) = {3025};
Surface Loop(3027) = {560, 592, 576, 578, 328, 528};
Volume(3028) = {3027};
Surface Loop(3029) = {562, 594, 578, 580, 330, 530};
Volume(3030) = {3029};
Surface Loop(3031) = {564, 596, 580, 582, 332, 532};
Volume(3032) = {3031};
Surface Loop(3033) = {566, 598, 582, 584, 334, 534};
Volume(3034) = {3033};
Surface Loop(3035) = {568, 600, 584, 586, 336, 536};
Volume(3036) = {3035};
Surface Loop(3037) = {570, 602, 586, 588, 338, 538};
Volume(3038) = {3037};
Surface Loop(3039) = {572, 604, 588, 574, 340, 540};
Volume(3040) = {3039};

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124};
Physical Surface(2) = {230, 232, 234, 236, 238, 240, 242, 244,
                       390, 392, 394, 396, 398, 400, 402, 404,
                       590, 592, 594, 596, 598, 600, 602, 604,
                       502, 504, 506, 508,
                       510, 512, 514, 516, 518, 520, 522, 524,
                       526, 528, 530, 532, 534, 536, 538, 540};
Physical Surface(3) = {126, 128, 130, 132, 134, 136, 138, 140};

Physical Volume(1) = {1002, 1004, 1006, 1008, 1010, 1012, 1014, 1016,
                      1018, 1020, 1022, 1024, 1026, 1028, 1030, 1032,
                      1034, 1036, 1038, 1040, 3002, 3004, 3006, 3008,
                      3010, 3012, 3014, 3016, 3018, 3020, 3022, 3024,
                      3026, 3028, 3030, 3032, 3034, 3036, 3038, 3040};

Physical Volume(2) = {2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016,
                      2018, 2020, 2022, 2024, 2026, 2028, 2030, 2032,
                      2034, 2036, 2038, 2040};

// --------------- //
// Set transfinite //
// --------------- //

numWavesVolume1 = 0.03 / wavelength;
numPoints1 = numElementPerWavelength * numWavesVolume1 + 1;
numWavesVolume2 = 0.0065 / wavelength;
numPoints2 = numElementPerWavelength * numWavesVolume2 + 1;
numWavesVolume3 = (domainLength - 0.0365) / wavelength;
numPoints3 = numElementPerWavelength * numWavesVolume3 + 1;

numPoints4 = numPoints1 * sourceRadius / 0.03;
numPoints5 = numPoints1 * (domainRadius - sourceRadius) / 0.03;

Transfinite Line {1, 2, 3, 4,
                  5, 6, 7, 8, 9, 10, 11, 12,
                  13, 14, 15, 16, 17, 18, 19, 20,
                  21, 22, 23, 24, 25, 26, 27, 28,
                  37, 38, 39, 40, 41, 42, 43, 44} = numPoints4;
Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36} = numPoints5;

Transfinite Line {45, 46, 47, 48,
                  49, 50, 51, 52, 53, 54, 55, 56,
                  57, 58, 59, 60, 61, 62, 63, 64,
                  65, 66, 67, 68, 69, 70, 71, 72,
                  81, 82, 83, 84, 85, 86, 87, 88} = numPoints4;
Transfinite Line {73, 74, 75, 76, 77, 78, 79, 80} = numPoints5;

Transfinite Line {89, 90, 91, 92, 93, 94, 95, 96,
                  97, 98, 99, 100, 101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112,
                  1004} = numPoints1;

Transfinite Line {113, 114, 115, 116,
                  117, 118, 119, 120, 121, 122, 123, 124,
                  125, 126, 127, 128, 129, 130, 131, 132,
                  133, 134, 135, 136, 137, 138, 139, 140,
                  149, 150, 151, 152, 153, 154, 155, 156} = numPoints4;
Transfinite Line {141, 142, 143, 144, 145, 146, 147, 148} = numPoints5;

Transfinite Line {157, 158, 159, 160, 161, 162, 163, 164,
                  165, 166, 167, 168, 169, 170, 171, 172,
                  173, 174, 175, 176, 177, 178, 179, 180,
                  2004} = numPoints2;

Transfinite Line {181, 182, 183, 184,
                  185, 186, 187, 188, 189, 190, 191, 192,
                  193, 194, 195, 196, 197, 198, 199, 200,
                  201, 202, 203, 204, 205, 206, 207, 208,
                  217, 218, 219, 220, 221, 222, 223, 224} = numPoints4;
Transfinite Line {209, 210, 211, 212, 213, 214, 215, 216} = numPoints5;

Transfinite Line {225, 226, 227, 228, 229, 230, 231, 232,
                  233, 234, 235, 236, 237, 238, 239, 240,
                  241, 242, 243, 244, 245, 246, 247, 248,
                  3004} = numPoints3;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";