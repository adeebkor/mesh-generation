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
numExtraWavelength = 11;  // 1 to 11
domainRadius = 0.035 + numExtraWavelength*wavelength;

numElementPerWavelength = 4.4;
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

radiusOfCurvature1 = 0.079;
focalPoint1 = 0.026 + radiusOfCurvature1;

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

// ================================ //
// Set transfinite lines (volume 1) //
// ================================ //

numPoints1 = numElementPerWavelength * sourceRadius / 2 / wavelength;
numPoints2 = numElementPerWavelength * (domainRadius - sourceRadius) / wavelength;
numPoints3 = numElementPerWavelength * 0.026 / wavelength;

Transfinite Line {1, 2, 3, 4,
                  5, 6, 7, 8, 9, 10, 11, 12,
                  13, 14, 15, 16, 17, 18, 19, 20,
                  21, 22, 23, 24, 25, 26, 27, 28,
                  37, 38, 39, 40, 41, 42, 43, 44,
                  45, 46, 47, 48,
                  49, 50, 51, 52, 53, 54, 55, 56,
                  57, 58, 59, 60, 61, 62, 63, 64,
                  65, 66, 67, 68, 69, 70, 71, 72,
                  81, 82, 83, 84, 85, 86, 87, 88} = numPoints1;

Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36,
                  73, 74, 75, 76, 77, 78, 79, 80} = numPoints2;

Transfinite Line {89, 90, 91, 92, 93, 94, 95, 96,
                  97, 98, 99, 100, 101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112,
                  1004} = numPoints3;

// -------- //
// Volume 2 //
// -------- //

radiusOfCurvature2 = 0.075;

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

Circle(113) = {52, 1000, 69};
Circle(114) = {52, 1000, 71};
Circle(115) = {52, 1000, 73};
Circle(116) = {52, 1000, 75};

Circle(117) = {69, 1000, 70};
Circle(118) = {70, 1000, 71};
Circle(119) = {71, 1000, 72};
Circle(120) = {72, 1000, 73};
Circle(121) = {73, 1000, 74};
Circle(122) = {74, 1000, 75};
Circle(123) = {75, 1000, 76};
Circle(124) = {76, 1000, 69};

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

// ================================ //
// Set transfinite lines (volume 2) //
// ================================ //

numPoints4 = numElementPerWavelength * 0.004 / wavelength;

Transfinite Line {113, 114, 115, 116,
                  117, 118, 119, 120, 121, 122, 123, 124,
                  125, 126, 127, 128, 129, 130, 131, 132,
                  133, 134, 135, 136, 137, 138, 139, 140,
                  149, 150, 151, 152, 153, 154, 155, 156} = numPoints1;

Transfinite Line {141, 142, 143, 144, 145, 146, 147, 148} = numPoints2;

Transfinite Line {157, 158, 159, 160, 161, 162, 163, 164,
                  165, 166, 167, 168, 169, 170, 171, 172,
                  173, 174, 175, 176, 177, 178, 179, 180,
                  2004} = numPoints4;


// -------- //
// Volume 3 //
// -------- //

radiusOfCurvature3 = 0.0735;

Point(77) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3), 1.0};
Point(78) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(79) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(80) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(81) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(82) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(83) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(84) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};
Point(85) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
             1.0};

Point(86) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(87) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(88) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(89) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(90) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(91) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(92) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};
Point(93) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
             1.0};

Point(94) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(95) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(96) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(97) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(98) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(99) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(100) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(101) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
             1.0};

Circle(213) = {77, 1000, 94};
Circle(214) = {77, 1000, 96};
Circle(215) = {77, 1000, 98};
Circle(216) = {77, 1000, 100};

Circle(217) = {94, 1000, 95};
Circle(218) = {95, 1000, 96};
Circle(219) = {96, 1000, 97};
Circle(220) = {97, 1000, 98};
Circle(221) = {98, 1000, 99};
Circle(222) = {99, 1000, 100};
Circle(223) = {100, 1000, 101};
Circle(224) = {101, 1000, 94};

Circle(225) = {94, 1000, 78};
Circle(226) = {95, 1000, 79};
Circle(227) = {96, 1000, 80};
Circle(228) = {97, 1000, 81};
Circle(229) = {98, 1000, 82};
Circle(230) = {99, 1000, 83};
Circle(231) = {100, 1000, 84};
Circle(232) = {101, 1000, 85};

Point(3002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius), 1.0};

Circle(233) = {78, 3002, 79};
Circle(234) = {79, 3002, 80};
Circle(235) = {80, 3002, 81};
Circle(236) = {81, 3002, 82};
Circle(237) = {82, 3002, 83};
Circle(238) = {83, 3002, 84};
Circle(239) = {84, 3002, 85};
Circle(240) = {85, 3002, 78};

Circle(241) = {78, 1000, 86};
Circle(242) = {79, 1000, 87};
Circle(243) = {80, 1000, 88};
Circle(244) = {81, 1000, 89};
Circle(245) = {82, 1000, 90};
Circle(246) = {83, 1000, 91};
Circle(247) = {84, 1000, 92};
Circle(248) = {85, 1000, 93};

Point(3003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius), 1.0};

Circle(249) = {86, 3003, 87};
Circle(250) = {87, 3003, 88};
Circle(251) = {88, 3003, 89};
Circle(252) = {89, 3003, 90};
Circle(253) = {90, 3003, 91};
Circle(254) = {91, 3003, 92};
Circle(255) = {92, 3003, 93};
Circle(256) = {93, 3003, 86};

Line(257) = {69, 94};
Line(258) = {70, 95};
Line(259) = {71, 96};
Line(260) = {72, 97};
Line(261) = {73, 98};
Line(262) = {74, 99};
Line(263) = {75, 100};
Line(264) = {76, 101};

Line(265) = {53, 78};
Line(266) = {54, 79};
Line(267) = {55, 80};
Line(268) = {56, 81};
Line(269) = {57, 82};
Line(270) = {58, 83};
Line(271) = {59, 84};
Line(272) = {60, 85};

Line(273) = {61, 86};
Line(274) = {62, 87};
Line(275) = {63, 88};
Line(276) = {64, 89};
Line(277) = {65, 90};
Line(278) = {66, 91};
Line(279) = {67, 92};
Line(280) = {68, 93};

Line Loop(501) = {213, 217, 218, -214};
Ruled Surface(502) = {501};
Line Loop(503) = {214, 219, 220, -215};
Ruled Surface(504) = {503};
Line Loop(505) = {215, 221, 222, -216};
Ruled Surface(506) = {505};
Line Loop(507) = {216, 223, 224, -213};
Ruled Surface(508) = {507};

Line Loop(509) = {225, 233, -226, -217};
Ruled Surface(510) = {509};
Line Loop(511) = {226, 234, -227, -218};
Ruled Surface(512) = {511};
Line Loop(513) = {227, 235, -228, -219};
Ruled Surface(514) = {513};
Line Loop(515) = {228, 236, -229, -220};
Ruled Surface(516) = {515};
Line Loop(517) = {229, 237, -230, -221};
Ruled Surface(518) = {517};
Line Loop(519) = {230, 238, -231, -222};
Ruled Surface(520) = {519};
Line Loop(521) = {231, 239, -232, -223};
Ruled Surface(522) = {521};
Line Loop(523) = {232, 240, -225, -224};
Ruled Surface(524) = {523};

Line Loop(525) = {241, 249, -242, -233};
Ruled Surface(526) = {525};
Line Loop(527) = {242, 250, -243, -234};
Ruled Surface(528) = {527};
Line Loop(529) = {243, 251, -244, -235};
Ruled Surface(530) = {529};
Line Loop(531) = {244, 252, -245, -236};
Ruled Surface(532) = {531};
Line Loop(533) = {245, 253, -246, -237};
Ruled Surface(534) = {533};
Line Loop(535) = {246, 254, -247, -238};
Ruled Surface(536) = {535};
Line Loop(537) = {247, 255, -248, -239};
Ruled Surface(538) = {537};
Line Loop(539) = {248, 256, -241, -240};
Ruled Surface(540) = {539};

Line Loop(541) = {117, 258, -217, -257};
Ruled Surface(542) = {541};
Line Loop(543) = {118, 259, -218, -258};
Ruled Surface(544) = {543};
Line Loop(545) = {119, 260, -219, -259};
Ruled Surface(546) = {545};
Line Loop(547) = {120, 261, -220, -260};
Ruled Surface(548) = {547};
Line Loop(549) = {121, 262, -221, -261};
Ruled Surface(550) = {549};
Line Loop(551) = {122, 263, -222, -262};
Ruled Surface(552) = {551};
Line Loop(553) = {123, 264, -223, -263};
Ruled Surface(554) = {553};
Line Loop(555) = {124, 257, -224, -264};
Ruled Surface(556) = {555};

Line Loop(557) = {133, 266, -233, -265};
Ruled Surface(558) = {557};
Line Loop(559) = {134, 267, -234, -266};
Ruled Surface(560) = {559};
Line Loop(561) = {135, 268, -235, -267};
Ruled Surface(562) = {561};
Line Loop(563) = {136, 269, -236, -268};
Ruled Surface(564) = {563};
Line Loop(565) = {137, 270, -237, -269};
Ruled Surface(566) = {565};
Line Loop(567) = {138, 271, -238, -270};
Ruled Surface(568) = {567};
Line Loop(569) = {139, 272, -239, -271};
Ruled Surface(570) = {569};
Line Loop(571) = {140, 265, -240, -272};
Ruled Surface(572) = {571};

Line Loop(573) = {141, 273, -241, -265};
Ruled Surface(574) = {573};
Line Loop(575) = {142, 274, -242, -266};
Ruled Surface(576) = {575};
Line Loop(577) = {143, 275, -243, -267};
Ruled Surface(578) = {577};
Line Loop(579) = {144, 276, -244, -268};
Ruled Surface(580) = {579};
Line Loop(581) = {145, 277, -245, -269};
Ruled Surface(582) = {581};
Line Loop(583) = {146, 278, -246, -270};
Ruled Surface(584) = {583};
Line Loop(585) = {147, 279, -247, -271};
Ruled Surface(586) = {585};
Line Loop(587) = {148, 280, -248, -272};
Ruled Surface(588) = {587};

Line Loop(589) = {149, 274, -249, -273};
Ruled Surface(590) = {589};
Line Loop(591) = {150, 275, -250, -274};
Ruled Surface(592) = {591};
Line Loop(593) = {151, 276, -251, -275};
Ruled Surface(594) = {593};
Line Loop(595) = {152, 277, -252, -276};
Ruled Surface(596) = {595};
Line Loop(597) = {153, 278, -253, -277};
Ruled Surface(598) = {597};
Line Loop(599) = {154, 279, -254, -278};
Ruled Surface(600) = {599};
Line Loop(601) = {155, 280, -255, -279};
Ruled Surface(602) = {601};
Line Loop(603) = {156, 273, -256, -280};
Ruled Surface(604) = {603};

Line(3004) = {52, 77};

Line Loop(605) = {113, 257, -213, -3004};
Ruled Surface(606) = {605};
Line Loop(607) = {114, 259, -214, -3004};
Ruled Surface(608) = {607};
Line Loop(609) = {115, 261, -215, -3004};
Ruled Surface(610) = {609};
Line Loop(611) = {116, 263, -216, -3004};
Ruled Surface(612) = {611};

Line Loop(613) = {125, 265, -225, -257};
Ruled Surface(614) = {613};
Line Loop(615) = {126, 266, -226, -258};
Ruled Surface(616) = {615};
Line Loop(617) = {127, 267, -227, -259};
Ruled Surface(618) = {617};
Line Loop(619) = {128, 268, -228, -260};
Ruled Surface(620) = {619};
Line Loop(621) = {129, 269, -229, -261};
Ruled Surface(622) = {621};
Line Loop(623) = {130, 270, -230, -262};
Ruled Surface(624) = {623};
Line Loop(625) = {131, 271, -231, -263};
Ruled Surface(626) = {625};
Line Loop(627) = {132, 272, -232, -264};
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

// ================================ //
// Set transfinite lines (volume 3) //
// ================================ //

numPoints5 = numElementPerWavelength * 0.0015 / wavelength;

Transfinite Line {213, 214, 215, 216,
                  217, 218, 219, 220, 221, 222, 223, 224,
                  225, 226, 227, 228, 229, 230, 231, 232,
                  233, 234, 235, 236, 237, 238, 239, 240,
                  249, 250, 251, 252, 253, 254, 255, 256} = numPoints1;

Transfinite Line {241, 242, 243, 244, 245, 246, 247, 248} = numPoints2;

Transfinite Line {257, 258, 259, 260, 261, 262, 263, 264,
                  265, 266, 267, 268, 269, 270, 271, 272,
                  273, 274, 275, 276, 277, 278, 279, 280,
                  3004} = numPoints5;

// -------- //
// Volume 4 //
// -------- //

radiusOfCurvature4 = 0.0695;

Point(1077) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4), 1.0};
Point(1078) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1079) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1080) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1081) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1082) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1083) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1084) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};
Point(1085) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
               1.0};

Point(1086) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1087) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1088) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1089) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1090) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1091) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1092) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};
Point(1093) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
               1.0};

Point(1094) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1095) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1096) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1097) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1098) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1099) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1100) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(1101) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
               1.0};

Circle(313) = {1077, 1000, 1094};
Circle(314) = {1077, 1000, 1096};
Circle(315) = {1077, 1000, 1098};
Circle(316) = {1077, 1000, 1100};

Circle(317) = {1094, 1000, 1095};
Circle(318) = {1095, 1000, 1096};
Circle(319) = {1096, 1000, 1097};
Circle(320) = {1097, 1000, 1098};
Circle(321) = {1098, 1000, 1099};
Circle(322) = {1099, 1000, 1100};
Circle(323) = {1100, 1000, 1101};
Circle(324) = {1101, 1000, 1094};

Circle(325) = {1094, 1000, 1078};
Circle(326) = {1095, 1000, 1079};
Circle(327) = {1096, 1000, 1080};
Circle(328) = {1097, 1000, 1081};
Circle(329) = {1098, 1000, 1082};
Circle(330) = {1099, 1000, 1083};
Circle(331) = {1100, 1000, 1084};
Circle(332) = {1101, 1000, 1085};

Point(4002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius), 1.0};

Circle(333) = {1078, 4002, 1079};
Circle(334) = {1079, 4002, 1080};
Circle(335) = {1080, 4002, 1081};
Circle(336) = {1081, 4002, 1082};
Circle(337) = {1082, 4002, 1083};
Circle(338) = {1083, 4002, 1084};
Circle(339) = {1084, 4002, 1085};
Circle(340) = {1085, 4002, 1078};

Circle(341) = {1078, 1000, 1086};
Circle(342) = {1079, 1000, 1087};
Circle(343) = {1080, 1000, 1088};
Circle(344) = {1081, 1000, 1089};
Circle(345) = {1082, 1000, 1090};
Circle(346) = {1083, 1000, 1091};
Circle(347) = {1084, 1000, 1092};
Circle(348) = {1085, 1000, 1093};

Point(4003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius), 1.0};

Circle(349) = {1086, 4003, 1087};
Circle(350) = {1087, 4003, 1088};
Circle(351) = {1088, 4003, 1089};
Circle(352) = {1089, 4003, 1090};
Circle(353) = {1090, 4003, 1091};
Circle(354) = {1091, 4003, 1092};
Circle(355) = {1092, 4003, 1093};
Circle(356) = {1093, 4003, 1086};

Line(357) = {94, 1094};
Line(358) = {95, 1095};
Line(359) = {96, 1096};
Line(360) = {97, 1097};
Line(361) = {98, 1098};
Line(362) = {99, 1099};
Line(363) = {100, 1100};
Line(364) = {101, 1101};

Line(365) = {78, 1078};
Line(366) = {79, 1079};
Line(367) = {80, 1080};
Line(368) = {81, 1081};
Line(369) = {82, 1082};
Line(370) = {83, 1083};
Line(371) = {84, 1084};
Line(372) = {85, 1085};

Line(373) = {86, 1086};
Line(374) = {87, 1087};
Line(375) = {88, 1088};
Line(376) = {89, 1089};
Line(377) = {90, 1090};
Line(378) = {91, 1091};
Line(379) = {92, 1092};
Line(380) = {93, 1093};

Line Loop(701) = {313, 317, 318, -314};
Ruled Surface(702) = {701};
Line Loop(703) = {314, 319, 320, -315};
Ruled Surface(704) = {703};
Line Loop(705) = {315, 321, 322, -316};
Ruled Surface(706) = {705};
Line Loop(707) = {316, 323, 324, -313};
Ruled Surface(708) = {707};

Line Loop(709) = {325, 333, -326, -317};
Ruled Surface(710) = {709};
Line Loop(711) = {326, 334, -327, -318};
Ruled Surface(712) = {711};
Line Loop(713) = {327, 335, -328, -319};
Ruled Surface(714) = {713};
Line Loop(715) = {328, 336, -329, -320};
Ruled Surface(716) = {715};
Line Loop(717) = {329, 337, -330, -321};
Ruled Surface(718) = {717};
Line Loop(719) = {330, 338, -331, -322};
Ruled Surface(720) = {719};
Line Loop(721) = {331, 339, -332, -323};
Ruled Surface(722) = {721};
Line Loop(723) = {332, 340, -325, -324};
Ruled Surface(724) = {723};

Line Loop(725) = {341, 349, -342, -333};
Ruled Surface(726) = {725};
Line Loop(727) = {342, 350, -343, -334};
Ruled Surface(728) = {727};
Line Loop(729) = {343, 351, -344, -335};
Ruled Surface(730) = {729};
Line Loop(731) = {344, 352, -345, -336};
Ruled Surface(732) = {731};
Line Loop(733) = {345, 353, -346, -337};
Ruled Surface(734) = {733};
Line Loop(735) = {346, 354, -347, -338};
Ruled Surface(736) = {735};
Line Loop(737) = {347, 355, -348, -339};
Ruled Surface(738) = {737};
Line Loop(739) = {348, 356, -341, -340};
Ruled Surface(740) = {739};

Line Loop(741) = {217, 358, -317, -357};
Ruled Surface(742) = {741};
Line Loop(743) = {218, 359, -318, -358};
Ruled Surface(744) = {743};
Line Loop(745) = {219, 360, -319, -359};
Ruled Surface(746) = {745};
Line Loop(747) = {220, 361, -320, -360};
Ruled Surface(748) = {747};
Line Loop(749) = {221, 362, -321, -361};
Ruled Surface(750) = {749};
Line Loop(751) = {222, 363, -322, -362};
Ruled Surface(752) = {751};
Line Loop(753) = {223, 364, -323, -363};
Ruled Surface(754) = {753};
Line Loop(755) = {224, 357, -324, -364};
Ruled Surface(756) = {755};

Line Loop(757) = {233, 366, -333, -365};
Ruled Surface(758) = {757};
Line Loop(759) = {234, 367, -334, -366};
Ruled Surface(760) = {759};
Line Loop(761) = {235, 368, -335, -367};
Ruled Surface(762) = {761};
Line Loop(763) = {236, 369, -336, -368};
Ruled Surface(764) = {763};
Line Loop(765) = {237, 370, -337, -369};
Ruled Surface(766) = {765};
Line Loop(767) = {238, 371, -338, -370};
Ruled Surface(768) = {767};
Line Loop(769) = {239, 372, -339, -371};
Ruled Surface(770) = {769};
Line Loop(771) = {240, 365, -340, -372};
Ruled Surface(772) = {771};

Line Loop(773) = {241, 373, -341, -365};
Ruled Surface(774) = {773};
Line Loop(775) = {242, 374, -342, -366};
Ruled Surface(776) = {775};
Line Loop(777) = {243, 375, -343, -367};
Ruled Surface(778) = {777};
Line Loop(779) = {244, 376, -344, -368};
Ruled Surface(780) = {779};
Line Loop(781) = {245, 377, -345, -369};
Ruled Surface(782) = {781};
Line Loop(783) = {246, 378, -346, -370};
Ruled Surface(784) = {783};
Line Loop(785) = {247, 379, -347, -371};
Ruled Surface(786) = {785};
Line Loop(787) = {248, 380, -348, -372};
Ruled Surface(788) = {787};

Line Loop(789) = {249, 374, -349, -373};
Ruled Surface(790) = {789};
Line Loop(791) = {250, 375, -350, -374};
Ruled Surface(792) = {791};
Line Loop(793) = {251, 376, -351, -375};
Ruled Surface(794) = {793};
Line Loop(795) = {252, 377, -352, -376};
Ruled Surface(796) = {795};
Line Loop(797) = {253, 378, -353, -377};
Ruled Surface(798) = {797};
Line Loop(799) = {254, 379, -354, -378};
Ruled Surface(800) = {799};
Line Loop(801) = {255, 380, -355, -379};
Ruled Surface(802) = {801};
Line Loop(803) = {256, 373, -356, -380};
Ruled Surface(804) = {803};

Line(4004) = {77, 1077};

Line Loop(805) = {213, 357, -313, -4004};
Ruled Surface(806) = {805};
Line Loop(807) = {214, 359, -314, -4004};
Ruled Surface(808) = {807};
Line Loop(809) = {215, 361, -315, -4004};
Ruled Surface(810) = {809};
Line Loop(811) = {216, 363, -316, -4004};
Ruled Surface(812) = {811};

Line Loop(813) = {225, 365, -325, -357};
Ruled Surface(814) = {813};
Line Loop(815) = {226, 366, -326, -358};
Ruled Surface(816) = {815};
Line Loop(817) = {227, 367, -327, -359};
Ruled Surface(818) = {817};
Line Loop(819) = {228, 368, -328, -360};
Ruled Surface(820) = {819};
Line Loop(821) = {229, 369, -329, -361};
Ruled Surface(822) = {821};
Line Loop(823) = {230, 370, -330, -362};
Ruled Surface(824) = {823};
Line Loop(825) = {231, 371, -331, -363};
Ruled Surface(826) = {825};
Line Loop(827) = {232, 372, -332, -364};
Ruled Surface(828) = {827};

Surface Loop(4001) = {502, 702, 742, 744, 806, 808};
Volume(4002) = {4001};
Surface Loop(4003) = {504, 704, 746, 748, 808, 810};
Volume(4004) = {4003};
Surface Loop(4005) = {506, 706, 750, 752, 810, 812};
Volume(4006) = {4005};
Surface Loop(4007) = {508, 708, 754, 756, 812, 806};
Volume(4008) = {4007};

Surface Loop(4009) = {742, 758, 814, 816, 510, 710};
Volume(4010) = {4009};
Surface Loop(4011) = {744, 760, 816, 818, 512, 712};
Volume(4012) = {4011};
Surface Loop(4013) = {746, 762, 818, 820, 514, 714};
Volume(4014) = {4013};
Surface Loop(4015) = {748, 764, 820, 822, 516, 716};
Volume(4016) = {4015};
Surface Loop(4017) = {750, 766, 822, 824, 518, 718};
Volume(4018) = {4017};
Surface Loop(4019) = {752, 768, 824, 826, 520, 720};
Volume(4020) = {4019};
Surface Loop(4021) = {754, 770, 826, 828, 522, 722};
Volume(4022) = {4021};
Surface Loop(4023) = {756, 772, 828, 814, 524, 724};
Volume(4024) = {4023};

Surface Loop(4025) = {758, 790, 774, 776, 526, 726};
Volume(4026) = {4025};
Surface Loop(4027) = {760, 792, 776, 778, 528, 728};
Volume(4028) = {4027};
Surface Loop(4029) = {762, 794, 778, 780, 530, 730};
Volume(4030) = {4029};
Surface Loop(4031) = {764, 796, 780, 782, 532, 732};
Volume(4032) = {4031};
Surface Loop(4033) = {766, 798, 782, 784, 534, 734};
Volume(4034) = {4033};
Surface Loop(4035) = {768, 800, 784, 786, 536, 736};
Volume(4036) = {4035};
Surface Loop(4037) = {770, 802, 786, 788, 538, 738};
Volume(4038) = {4037};
Surface Loop(4039) = {772, 804, 788, 774, 540, 740};
Volume(4040) = {4039};

// ================================ //
// Set transfinite lines (volume 4) //
// ================================ //

numPoints6 = numElementPerWavelength * 0.004 / wavelength;

Transfinite Line {313, 314, 315, 316,
                  317, 318, 319, 320, 321, 322, 323, 324,
                  325, 326, 327, 328, 329, 330, 331, 332,
                  333, 334, 335, 336, 337, 338, 339, 340,
                  349, 350, 351, 352, 353, 354, 355, 356} = numPoints1;

Transfinite Line {341, 342, 343, 344, 345, 346, 347, 348} = numPoints2;

Transfinite Line {357, 358, 359, 360, 361, 362, 363, 364,
                  365, 366, 367, 368, 369, 370, 371, 372,
                  373, 374, 375, 376, 377, 378, 379, 380,
                  4004} = numPoints6;


// -------- //
// Volume 5 //
// -------- //

radiusOfCurvature5 = 0.0685;

Point(2077) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5), 1.0};
Point(2078) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2079) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2080) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2081) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2082) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2083) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2084) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};
Point(2085) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
               1.0};

Point(2086) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2087) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2088) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2089) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2090) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2091) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2092) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};
Point(2093) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
               1.0};

Point(2094) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2095) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2096) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2097) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2098) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2099) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2100) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};
Point(2101) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
               focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
               1.0};

Circle(413) = {2077, 1000, 2094};
Circle(414) = {2077, 1000, 2096};
Circle(415) = {2077, 1000, 2098};
Circle(416) = {2077, 1000, 2100};

Circle(417) = {2094, 1000, 2095};
Circle(418) = {2095, 1000, 2096};
Circle(419) = {2096, 1000, 2097};
Circle(420) = {2097, 1000, 2098};
Circle(421) = {2098, 1000, 2099};
Circle(422) = {2099, 1000, 2100};
Circle(423) = {2100, 1000, 2101};
Circle(424) = {2101, 1000, 2094};

Circle(425) = {2094, 1000, 2078};
Circle(426) = {2095, 1000, 2079};
Circle(427) = {2096, 1000, 2080};
Circle(428) = {2097, 1000, 2081};
Circle(429) = {2098, 1000, 2082};
Circle(430) = {2099, 1000, 2083};
Circle(431) = {2100, 1000, 2084};
Circle(432) = {2101, 1000, 2085};

Point(5002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius), 1.0};

Circle(433) = {2078, 5002, 2079};
Circle(434) = {2079, 5002, 2080};
Circle(435) = {2080, 5002, 2081};
Circle(436) = {2081, 5002, 2082};
Circle(437) = {2082, 5002, 2083};
Circle(438) = {2083, 5002, 2084};
Circle(439) = {2084, 5002, 2085};
Circle(440) = {2085, 5002, 2078};

Circle(441) = {2078, 1000, 2086};
Circle(442) = {2079, 1000, 2087};
Circle(443) = {2080, 1000, 2088};
Circle(444) = {2081, 1000, 2089};
Circle(445) = {2082, 1000, 2090};
Circle(446) = {2083, 1000, 2091};
Circle(447) = {2084, 1000, 2092};
Circle(448) = {2085, 1000, 2093};

Point(5003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius), 1.0};

Circle(449) = {2086, 5003, 2087};
Circle(450) = {2087, 5003, 2088};
Circle(451) = {2088, 5003, 2089};
Circle(452) = {2089, 5003, 2090};
Circle(453) = {2090, 5003, 2091};
Circle(454) = {2091, 5003, 2092};
Circle(455) = {2092, 5003, 2093};
Circle(456) = {2093, 5003, 2086};

Line(457) = {1094, 2094};
Line(458) = {1095, 2095};
Line(459) = {1096, 2096};
Line(460) = {1097, 2097};
Line(461) = {1098, 2098};
Line(462) = {1099, 2099};
Line(463) = {1100, 2100};
Line(464) = {1101, 2101};

Line(465) = {1078, 2078};
Line(466) = {1079, 2079};
Line(467) = {1080, 2080};
Line(468) = {1081, 2081};
Line(469) = {1082, 2082};
Line(470) = {1083, 2083};
Line(471) = {1084, 2084};
Line(472) = {1085, 2085};

Line(473) = {1086, 2086};
Line(474) = {1087, 2087};
Line(475) = {1088, 2088};
Line(476) = {1089, 2089};
Line(477) = {1090, 2090};
Line(478) = {1091, 2091};
Line(479) = {1092, 2092};
Line(480) = {1093, 2093};

Line Loop(901) = {413, 417, 418, -414};
Ruled Surface(902) = {901};
Line Loop(903) = {414, 419, 420, -415};
Ruled Surface(904) = {903};
Line Loop(905) = {415, 421, 422, -416};
Ruled Surface(906) = {905};
Line Loop(907) = {416, 423, 424, -413};
Ruled Surface(908) = {907};

Line Loop(909) = {425, 433, -426, -417};
Ruled Surface(910) = {909};
Line Loop(911) = {426, 434, -427, -418};
Ruled Surface(912) = {911};
Line Loop(913) = {427, 435, -428, -419};
Ruled Surface(914) = {913};
Line Loop(915) = {428, 436, -429, -420};
Ruled Surface(916) = {915};
Line Loop(917) = {429, 437, -430, -421};
Ruled Surface(918) = {917};
Line Loop(919) = {430, 438, -431, -422};
Ruled Surface(920) = {919};
Line Loop(921) = {431, 439, -432, -423};
Ruled Surface(922) = {921};
Line Loop(923) = {432, 440, -425, -424};
Ruled Surface(924) = {923};

Line Loop(925) = {441, 449, -442, -433};
Ruled Surface(926) = {925};
Line Loop(927) = {442, 450, -443, -434};
Ruled Surface(928) = {927};
Line Loop(929) = {443, 451, -444, -435};
Ruled Surface(930) = {929};
Line Loop(931) = {444, 452, -445, -436};
Ruled Surface(932) = {931};
Line Loop(933) = {445, 453, -446, -437};
Ruled Surface(934) = {933};
Line Loop(935) = {446, 454, -447, -438};
Ruled Surface(936) = {935};
Line Loop(937) = {447, 455, -448, -439};
Ruled Surface(938) = {937};
Line Loop(939) = {448, 456, -441, -440};
Ruled Surface(940) = {939};

Line Loop(941) = {317, 458, -417, -457};
Ruled Surface(942) = {941};
Line Loop(943) = {318, 459, -418, -458};
Ruled Surface(944) = {943};
Line Loop(945) = {319, 460, -419, -459};
Ruled Surface(946) = {945};
Line Loop(947) = {320, 461, -420, -460};
Ruled Surface(948) = {947};
Line Loop(949) = {321, 462, -421, -461};
Ruled Surface(950) = {949};
Line Loop(951) = {322, 463, -422, -462};
Ruled Surface(952) = {951};
Line Loop(953) = {323, 464, -423, -463};
Ruled Surface(954) = {953};
Line Loop(955) = {324, 457, -424, -464};
Ruled Surface(956) = {955};

Line Loop(957) = {333, 466, -433, -465};
Ruled Surface(958) = {957};
Line Loop(959) = {334, 467, -434, -466};
Ruled Surface(960) = {959};
Line Loop(961) = {335, 468, -435, -467};
Ruled Surface(962) = {961};
Line Loop(963) = {336, 469, -436, -468};
Ruled Surface(964) = {963};
Line Loop(965) = {337, 470, -437, -469};
Ruled Surface(966) = {965};
Line Loop(967) = {338, 471, -438, -470};
Ruled Surface(968) = {967};
Line Loop(969) = {339, 472, -439, -471};
Ruled Surface(970) = {969};
Line Loop(971) = {340, 465, -440, -472};
Ruled Surface(972) = {971};

Line Loop(973) = {341, 473, -441, -465};
Ruled Surface(974) = {973};
Line Loop(975) = {342, 474, -442, -466};
Ruled Surface(976) = {975};
Line Loop(977) = {343, 475, -443, -467};
Ruled Surface(978) = {977};
Line Loop(979) = {344, 476, -444, -468};
Ruled Surface(980) = {979};
Line Loop(981) = {345, 477, -445, -469};
Ruled Surface(982) = {981};
Line Loop(983) = {346, 478, -446, -470};
Ruled Surface(984) = {983};
Line Loop(985) = {347, 479, -447, -471};
Ruled Surface(986) = {985};
Line Loop(987) = {348, 480, -448, -472};
Ruled Surface(988) = {987};

Line Loop(989) = {349, 474, -449, -473};
Ruled Surface(990) = {989};
Line Loop(991) = {350, 475, -450, -474};
Ruled Surface(992) = {991};
Line Loop(993) = {351, 476, -451, -475};
Ruled Surface(994) = {993};
Line Loop(995) = {352, 477, -452, -476};
Ruled Surface(996) = {995};
Line Loop(997) = {353, 478, -453, -477};
Ruled Surface(998) = {997};
Line Loop(999) = {354, 479, -454, -478};
Ruled Surface(1000) = {999};
Line Loop(1001) = {355, 480, -455, -479};
Ruled Surface(1002) = {1001};
Line Loop(1003) = {356, 473, -456, -480};
Ruled Surface(1004) = {1003};

Line(5004) = {1077, 2077};

Line Loop(1005) = {313, 457, -413, -5004};
Ruled Surface(1006) = {1005};
Line Loop(1007) = {314, 459, -414, -5004};
Ruled Surface(1008) = {1007};
Line Loop(1009) = {315, 461, -415, -5004};
Ruled Surface(1010) = {1009};
Line Loop(1011) = {316, 463, -416, -5004};
Ruled Surface(1012) = {1011};

Line Loop(1013) = {325, 465, -425, -457};
Ruled Surface(1014) = {1013};
Line Loop(1015) = {326, 466, -426, -458};
Ruled Surface(1016) = {1015};
Line Loop(1017) = {327, 467, -427, -459};
Ruled Surface(1018) = {1017};
Line Loop(1019) = {328, 468, -428, -460};
Ruled Surface(1020) = {1019};
Line Loop(1021) = {329, 469, -429, -461};
Ruled Surface(1022) = {1021};
Line Loop(1023) = {330, 470, -430, -462};
Ruled Surface(1024) = {1023};
Line Loop(1025) = {331, 471, -431, -463};
Ruled Surface(1026) = {1025};
Line Loop(1027) = {332, 472, -432, -464};
Ruled Surface(1028) = {1027};

Surface Loop(5001) = {702, 902, 942, 944, 1006, 1008};
Volume(5002) = {5001};
Surface Loop(5003) = {704, 904, 946, 948, 1008, 1010};
Volume(5004) = {5003};
Surface Loop(5005) = {706, 906, 950, 952, 1010, 1012};
Volume(5006) = {5005};
Surface Loop(5007) = {708, 908, 954, 956, 1012, 1006};
Volume(5008) = {5007};

Surface Loop(5009) = {942, 958, 1014, 1016, 710, 910};
Volume(5010) = {5009};
Surface Loop(5011) = {944, 960, 1016, 1018, 712, 912};
Volume(5012) = {5011};
Surface Loop(5013) = {946, 962, 1018, 1020, 714, 914};
Volume(5014) = {5013};
Surface Loop(5015) = {948, 964, 1020, 1022, 716, 916};
Volume(5016) = {5015};
Surface Loop(5017) = {950, 966, 1022, 1024, 718, 918};
Volume(5018) = {5017};
Surface Loop(5019) = {952, 968, 1024, 1026, 720, 920};
Volume(5020) = {5019};
Surface Loop(5021) = {954, 970, 1026, 1028, 722, 922};
Volume(5022) = {5021};
Surface Loop(5023) = {956, 972, 1028, 1014, 724, 924};
Volume(5024) = {5023};

Surface Loop(5025) = {958, 990, 974, 976, 726, 926};
Volume(5026) = {5025};
Surface Loop(5027) = {960, 992, 976, 978, 728, 928};
Volume(5028) = {5027};
Surface Loop(5029) = {962, 994, 978, 980, 730, 930};
Volume(5030) = {5029};
Surface Loop(5031) = {964, 996, 980, 982, 732, 932};
Volume(5032) = {5031};
Surface Loop(5033) = {966, 998, 982, 984, 734, 934};
Volume(5034) = {5033};
Surface Loop(5035) = {968, 1000, 984, 986, 736, 936};
Volume(5036) = {5035};
Surface Loop(5037) = {970, 1002, 986, 988, 738, 938};
Volume(5038) = {5037};
Surface Loop(5039) = {972, 1004, 988, 974, 740, 940};
Volume(5040) = {5039};

// ================================ //
// Set transfinite lines (volume 5) //
// ================================ //

numPoints7 = numElementPerWavelength * 0.001 / wavelength;

Transfinite Line {413, 414, 415, 416,
                  417, 418, 419, 420, 421, 422, 423, 424,
                  425, 426, 427, 428, 429, 430, 431, 432,
                  433, 434, 435, 436, 437, 438, 439, 440,
                  449, 450, 451, 452, 453, 454, 455, 456} = numPoints1;

Transfinite Line {441, 442, 443, 444, 445, 446, 447, 448} = numPoints2;

Transfinite Line {457, 458, 459, 460, 461, 462, 463, 464,
                  465, 466, 467, 468, 469, 470, 471, 472,
                  473, 474, 475, 476, 477, 478, 479, 480,
                  5004} = numPoints7;


// -------- //
// Volume 6 //
// -------- //

domainLength = 0.12 + numExtraWavelength*wavelength;

Point(3077) = {0., 0., domainLength, 1.0};
Point(3078) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), domainLength, 1.0};
Point(3079) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(3080) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(3081) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(3082) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), domainLength, 1.0};
Point(3083) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(3084) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(3085) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(3086) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), domainLength, 1.0};
Point(3087) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(3088) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(3089) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(3090) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), domainLength, 1.0};
Point(3091) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(3092) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(3093) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(3094) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi), domainLength, 1.0};
Point(3095) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi), domainLength, 1.0};
Point(3096) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi), domainLength, 1.0};
Point(3097) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi), domainLength, 1.0};
Point(3098) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi), domainLength, 1.0};
Point(3099) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi), domainLength, 1.0};
Point(3100) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi), domainLength, 1.0};
Point(3101) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi), domainLength, 1.0};

Line(513) = {3077, 3094};
Line(514) = {3077, 3096};
Line(515) = {3077, 3098};
Line(516) = {3077, 3100};

Line(517) = {3094, 3095};
Line(518) = {3095, 3096};
Line(519) = {3096, 3097};
Line(520) = {3097, 3098};
Line(521) = {3098, 3099};
Line(522) = {3099, 3100};
Line(523) = {3100, 3101};
Line(524) = {3101, 3094};

Line(525) = {3094, 3078};
Line(526) = {3095, 3079};
Line(527) = {3096, 3080};
Line(528) = {3097, 3081};
Line(529) = {3098, 3082};
Line(530) = {3099, 3083};
Line(531) = {3100, 3084};
Line(532) = {3101, 3085};

Circle(533) = {3078, 3077, 3079};
Circle(534) = {3079, 3077, 3080};
Circle(535) = {3080, 3077, 3081};
Circle(536) = {3081, 3077, 3082};
Circle(537) = {3082, 3077, 3083};
Circle(538) = {3083, 3077, 3084};
Circle(539) = {3084, 3077, 3085};
Circle(540) = {3085, 3077, 3078};

Line(541) = {3078, 3086};
Line(542) = {3079, 3087};
Line(543) = {3080, 3088};
Line(544) = {3081, 3089};
Line(545) = {3082, 3090};
Line(546) = {3083, 3091};
Line(547) = {3084, 3092};
Line(548) = {3085, 3093};

Circle(549) = {3086, 3077, 3087};
Circle(550) = {3087, 3077, 3088};
Circle(551) = {3088, 3077, 3089};
Circle(552) = {3089, 3077, 3090};
Circle(553) = {3090, 3077, 3091};
Circle(554) = {3091, 3077, 3092};
Circle(555) = {3092, 3077, 3093};
Circle(556) = {3093, 3077, 3086};

Line(557) = {2094, 3094};
Line(558) = {2095, 3095};
Line(559) = {2096, 3096};
Line(560) = {2097, 3097};
Line(561) = {2098, 3098};
Line(562) = {2099, 3099};
Line(563) = {2100, 3100};
Line(564) = {2101, 3101};

Line(565) = {2078, 3078};
Line(566) = {2079, 3079};
Line(567) = {2080, 3080};
Line(568) = {2081, 3081};
Line(569) = {2082, 3082};
Line(570) = {2083, 3083};
Line(571) = {2084, 3084};
Line(572) = {2085, 3085};

Line(573) = {2086, 3086};
Line(574) = {2087, 3087};
Line(575) = {2088, 3088};
Line(576) = {2089, 3089};
Line(577) = {2090, 3090};
Line(578) = {2091, 3091};
Line(579) = {2092, 3092};
Line(580) = {2093, 3093};

Line Loop(1101) = {513, 517, 518, -514};
Ruled Surface(1102) = {1101};
Line Loop(1103) = {514, 519, 520, -515};
Ruled Surface(1104) = {1103};
Line Loop(1105) = {515, 521, 522, -516};
Ruled Surface(1106) = {1105};
Line Loop(1107) = {516, 523, 524, -513};
Ruled Surface(1108) = {1107};

Line Loop(1109) = {525, 533, -526, -517};
Ruled Surface(1110) = {1109};
Line Loop(1111) = {526, 534, -527, -518};
Ruled Surface(1112) = {1111};
Line Loop(1113) = {527, 535, -528, -519};
Ruled Surface(1114) = {1113};
Line Loop(1115) = {528, 536, -529, -520};
Ruled Surface(1116) = {1115};
Line Loop(1117) = {529, 537, -530, -521};
Ruled Surface(1118) = {1117};
Line Loop(1119) = {530, 538, -531, -522};
Ruled Surface(1120) = {1119};
Line Loop(1121) = {531, 539, -532, -523};
Ruled Surface(1122) = {1121};
Line Loop(1123) = {532, 540, -525, -524};
Ruled Surface(1124) = {1123};

Line Loop(1125) = {541, 549, -542, -533};
Ruled Surface(1126) = {1125};
Line Loop(1127) = {542, 550, -543, -534};
Ruled Surface(1128) = {1127};
Line Loop(1129) = {543, 551, -544, -535};
Ruled Surface(1130) = {1129};
Line Loop(1131) = {544, 552, -545, -536};
Ruled Surface(1132) = {1131};
Line Loop(1133) = {545, 553, -546, -537};
Ruled Surface(1134) = {1133};
Line Loop(1135) = {546, 554, -547, -538};
Ruled Surface(1136) = {1135};
Line Loop(1137) = {547, 555, -548, -539};
Ruled Surface(1138) = {1137};
Line Loop(1139) = {548, 556, -541, -540};
Ruled Surface(1140) = {1139};

Line Loop(1141) = {417, 558, -517, -557};
Ruled Surface(1142) = {1141};
Line Loop(1143) = {418, 559, -518, -558};
Ruled Surface(1144) = {1143};
Line Loop(1145) = {419, 560, -519, -559};
Ruled Surface(1146) = {1145};
Line Loop(1147) = {420, 561, -520, -560};
Ruled Surface(1148) = {1147};
Line Loop(1149) = {421, 562, -521, -561};
Ruled Surface(1150) = {1149};
Line Loop(1151) = {422, 563, -522, -562};
Ruled Surface(1152) = {1151};
Line Loop(1153) = {423, 564, -523, -563};
Ruled Surface(1154) = {1153};
Line Loop(1155) = {424, 557, -524, -564};
Ruled Surface(1156) = {1155};

Line Loop(1157) = {433, 566, -533, -565};
Ruled Surface(1158) = {1157};
Line Loop(1159) = {434, 567, -534, -566};
Ruled Surface(1160) = {1159};
Line Loop(1161) = {435, 568, -535, -567};
Ruled Surface(1162) = {1161};
Line Loop(1163) = {436, 569, -536, -568};
Ruled Surface(1164) = {1163};
Line Loop(1165) = {437, 570, -537, -569};
Ruled Surface(1166) = {1165};
Line Loop(1167) = {438, 571, -538, -570};
Ruled Surface(1168) = {1167};
Line Loop(1169) = {439, 572, -539, -571};
Ruled Surface(1170) = {1169};
Line Loop(1171) = {440, 565, -540, -572};
Ruled Surface(1172) = {1171};

Line Loop(1173) = {441, 573, -541, -565};
Ruled Surface(1174) = {1173};
Line Loop(1175) = {442, 574, -542, -566};
Ruled Surface(1176) = {1175};
Line Loop(1177) = {443, 575, -543, -567};
Ruled Surface(1178) = {1177};
Line Loop(1179) = {444, 576, -544, -568};
Ruled Surface(1180) = {1179};
Line Loop(1181) = {445, 577, -545, -569};
Ruled Surface(1182) = {1181};
Line Loop(1183) = {446, 578, -546, -570};
Ruled Surface(1184) = {1183};
Line Loop(1185) = {447, 579, -547, -571};
Ruled Surface(1186) = {1185};
Line Loop(1187) = {448, 580, -548, -572};
Ruled Surface(1188) = {1187};

Line Loop(1189) = {449, 574, -549, -573};
Ruled Surface(1190) = {1189};
Line Loop(1191) = {450, 575, -550, -574};
Ruled Surface(1192) = {1191};
Line Loop(1193) = {451, 576, -551, -575};
Ruled Surface(1194) = {1193};
Line Loop(1195) = {452, 577, -552, -576};
Ruled Surface(1196) = {1195};
Line Loop(1197) = {453, 578, -553, -577};
Ruled Surface(1198) = {1197};
Line Loop(1199) = {454, 579, -554, -578};
Ruled Surface(1200) = {1199};
Line Loop(1201) = {455, 580, -555, -579};
Ruled Surface(1202) = {1201};
Line Loop(1203) = {456, 573, -556, -580};
Ruled Surface(1204) = {1203};

Line(6004) = {2077, 3077};

Line Loop(1205) = {413, 557, -513, -6004};
Ruled Surface(1206) = {1205};
Line Loop(1207) = {414, 559, -514, -6004};
Ruled Surface(1208) = {1207};
Line Loop(1209) = {415, 561, -515, -6004};
Ruled Surface(1210) = {1209};
Line Loop(1211) = {416, 563, -516, -6004};
Ruled Surface(1212) = {1211};

Line Loop(1213) = {425, 565, -525, -557};
Ruled Surface(1214) = {1213};
Line Loop(1215) = {426, 566, -526, -558};
Ruled Surface(1216) = {1215};
Line Loop(1217) = {427, 567, -527, -559};
Ruled Surface(1218) = {1217};
Line Loop(1219) = {428, 568, -528, -560};
Ruled Surface(1220) = {1219};
Line Loop(1221) = {429, 569, -529, -561};
Ruled Surface(1222) = {1221};
Line Loop(1223) = {430, 570, -530, -562};
Ruled Surface(1224) = {1223};
Line Loop(1225) = {431, 571, -531, -563};
Ruled Surface(1226) = {1225};
Line Loop(1227) = {432, 572, -532, -564};
Ruled Surface(1228) = {1227};

Surface Loop(6001) = {902, 1102, 1142, 1144, 1206, 1208};
Volume(6002) = {6001};
Surface Loop(6003) = {904, 1104, 1146, 1148, 1208, 1210};
Volume(6004) = {6003};
Surface Loop(6005) = {906, 1106, 1150, 1152, 1210, 1212};
Volume(6006) = {6005};
Surface Loop(6007) = {908, 1108, 1154, 1156, 1212, 1206};
Volume(6008) = {6007};

Surface Loop(6009) = {1142, 1158, 1214, 1216, 910, 1110};
Volume(6010) = {6009};
Surface Loop(6011) = {1144, 1160, 1216, 1218, 912, 1112};
Volume(6012) = {6011};
Surface Loop(6013) = {1146, 1162, 1218, 1220, 914, 1114};
Volume(6014) = {6013};
Surface Loop(6015) = {1148, 1164, 1220, 1222, 916, 1116};
Volume(6016) = {6015};
Surface Loop(6017) = {1150, 1166, 1222, 1224, 918, 1118};
Volume(6018) = {6017};
Surface Loop(6019) = {1152, 1168, 1224, 1226, 920, 1120};
Volume(6020) = {6019};
Surface Loop(6021) = {1154, 1170, 1226, 1228, 922, 1122};
Volume(6022) = {6021};
Surface Loop(6023) = {1156, 1172, 1228, 1214, 924, 1124};
Volume(6024) = {6023};

Surface Loop(6025) = {1158, 1190, 1174, 1176, 926, 1126};
Volume(6026) = {6025};
Surface Loop(6027) = {1160, 1192, 1176, 1178, 928, 1128};
Volume(6028) = {6027};
Surface Loop(6029) = {1162, 1194, 1178, 1180, 930, 1130};
Volume(6030) = {6029};
Surface Loop(6031) = {1164, 1196, 1180, 1182, 932, 1132};
Volume(6032) = {6031};
Surface Loop(6033) = {1166, 1198, 1182, 1184, 934, 1134};
Volume(6034) = {6033};
Surface Loop(6035) = {1168, 1200, 1184, 1186, 936, 1136};
Volume(6036) = {6035};
Surface Loop(6037) = {1170, 1202, 1186, 1188, 938, 1138};
Volume(6038) = {6037};
Surface Loop(6039) = {1172, 1204, 1188, 1174, 940, 1140};
Volume(6040) = {6039};

// ================================ //
// Set transfinite lines (volume 6) //
// ================================ //

numPoints8 = 0.4 * numElementPerWavelength * (domainLength - 0.0365) / wavelength;

Transfinite Line {513, 514, 515, 516,
                  517, 518, 519, 520, 521, 522, 523, 524,
                  525, 526, 527, 528, 529, 530, 531, 532,
                  533, 534, 535, 536, 537, 538, 539, 540,
                  549, 550, 551, 552, 553, 554, 555, 556} = numPoints1;

Transfinite Line {541, 542, 543, 544, 545, 546, 547, 548} = numPoints2;

Transfinite Line {557, 558, 559, 560, 561, 562, 563, 564,
                  565, 566, 567, 568, 569, 570, 571, 572,
                  573, 574, 575, 576, 577, 578, 579, 580,
                  6004} = numPoints8;


// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {102, 104, 106, 108, 
                       110, 112, 114, 116, 118, 120, 122, 124};
Physical Surface(2) = {230, 232, 234, 236, 238, 240, 242, 244,
                       390, 392, 394, 396, 398, 400, 402, 404,
                       590, 592, 594, 596, 598, 600, 602, 604,
                       790, 792, 794, 796, 798, 800, 802, 804,
                       990, 992, 994, 996, 998, 1000, 1002, 1004,
                       1190, 1192, 1194, 1196, 1198, 1200, 1202, 1204,
                       1102, 1104, 1106, 1108,
                       1110, 1112, 1114, 1116, 1118, 1120, 1122, 1124,
                       1126, 1128, 1130, 1132, 1134, 1136, 1138, 1140};
Physical Surface(3) = {126, 128, 130, 132, 134, 136, 138, 140};

Physical Volume(1) = {1002, 1004, 1006, 1008,
                      1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024,
                      1026, 1028, 1030, 1032, 1034, 1036, 1038, 1040};
Physical Volume(2) = {2002, 2004, 2006, 2008,
                      2010, 2012, 2014, 2016, 2018, 2020, 2022, 2024,
                      2026, 2028, 2030, 2032, 2034, 2036, 2038, 2040};
Physical Volume(3) = {3002, 3004, 3006, 3008,
                      3010, 3012, 3014, 3016, 3018, 3020, 3022, 3024,
                      3026, 3028, 3030, 3032, 3034, 3036, 3038, 3040};
Physical Volume(4) = {4002, 4004, 4006, 4008,
                      4010, 4012, 4014, 4016, 4018, 4020, 4022, 4024,
                      4026, 4028, 4030, 4032, 4034, 4036, 4038, 4040};
Physical Volume(5) = {5002, 5004, 5006, 5008,
                      5010, 5012, 5014, 5016, 5018, 5020, 5022, 5024,
                      5026, 5028, 5030, 5032, 5034, 5036, 5038, 5040};
Physical Volume(6) = {6002, 6004, 6006, 6008,
                      6010, 6012, 6014, 6016, 6018, 6020, 6022, 6024,
                      6026, 6028, 6030, 6032, 6034, 6036, 6038, 6040};

// =============== //
// Set transfinite //
// =============== //

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
