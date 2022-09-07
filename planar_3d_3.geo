// ------------------------------------------------------------------------- //
//
// Gmsh GEO file
//
// Heterogenous domain for 3D circular planar problem 1
// 
// - structured mesh
// - sponge layer
//
// Copyright (C) 2021 Adeeb Arif Kor
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 15;
domainRadius = 0.035;
spongeLayerRadius = domainRadius + numExtraWavelength*wavelength;

numElementPerWavelength = 2.39;
sourceRadius = 0.01;

// ------------------------------------------------------------------------- //
// Volume 1                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer1 = 0.03;

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

Point(27) = {0., 0., lengthLayer1, 1.0};
Point(28) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer1, 1.0};
Point(29) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer1, 1.0};
Point(30) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer1, 1.0};
Point(31) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer1, 1.0};
Point(32) = {sourceRadius, 0., lengthLayer1, 1.0};
Point(33) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer1, 1.0};
Point(34) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer1, 1.0};
Point(35) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer1, 1.0};

Point(36) = {domainRadius, 0., lengthLayer1, 1.0};
Point(37) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer1, 1.0};
Point(38) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer1, 1.0};
Point(39) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer1, 1.0};
Point(40) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer1, 1.0};
Point(41) = {domainRadius, 0., lengthLayer1, 1.0};
Point(42) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer1, 1.0};
Point(43) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer1, 1.0};
Point(44) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer1, 1.0};

Point(45) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer1, 1.0};
Point(46) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer1, 1.0};
Point(47) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer1, 1.0};
Point(48) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer1, 1.0};
Point(49) = {sourceRadius / 2, 0., lengthLayer1, 1.0};
Point(50) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer1, 1.0};
Point(51) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer1, 1.0};
Point(52) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer1, 1.0};

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

Line(45) = {27, 45};
Line(46) = {27, 47};
Line(47) = {27, 49};
Line(48) = {27, 51};
Line(49) = {45, 46};
Line(50) = {46, 47};
Line(51) = {47, 48};
Line(52) = {48, 49};
Line(53) = {49, 50};
Line(54) = {50, 51};
Line(55) = {51, 52};
Line(56) = {52, 45};
Line(57) = {45, 28};
Line(58) = {46, 29};
Line(59) = {47, 30};
Line(60) = {48, 31};
Line(61) = {49, 32};
Line(62) = {50, 33};
Line(63) = {51, 34};
Line(64) = {52, 35};
Circle(65) = {28, 27, 29};
Circle(66) = {29, 27, 30};
Circle(67) = {30, 27, 31};
Circle(68) = {31, 27, 32};
Circle(69) = {32, 27, 33};
Circle(70) = {33, 27, 34};
Circle(71) = {34, 27, 35};
Circle(72) = {35, 27, 28};
Line(73) = {28, 37};
Line(74) = {29, 38};
Line(75) = {30, 39};
Line(76) = {31, 40};
Line(77) = {32, 41};
Line(78) = {33, 42};
Line(79) = {34, 43};
Line(80) = {35, 44};
Circle(81) = {37, 27, 38};
Circle(82) = {38, 27, 39};
Circle(83) = {39, 27, 40};
Circle(84) = {40, 27, 41};
Circle(85) = {41, 27, 42};
Circle(86) = {42, 27, 43};
Circle(87) = {43, 27, 44};
Circle(88) = {44, 27, 37};

Line(89) = {19, 45};
Line(90) = {20, 46};
Line(91) = {21, 47};
Line(92) = {22, 48};
Line(93) = {23, 49};
Line(94) = {24, 50};
Line(95) = {25, 51};
Line(96) = {26, 52};
Line(97) = {2, 28};
Line(98) = {3, 29};
Line(99) = {4, 30};
Line(100) = {5, 31};
Line(101) = {6, 32};
Line(102) = {7, 33};
Line(103) = {8, 34};
Line(104) = {9, 35};
Line(105) = {11, 37};
Line(106) = {12, 38};
Line(107) = {13, 39};
Line(108) = {14, 40};
Line(109) = {15, 41};
Line(110) = {16, 42};
Line(111) = {17, 43};
Line(112) = {18, 44};

Line Loop(1) = {1, 5, 6, -2};
Ruled Surface(2) = {1};
Line Loop(3) = {2, 7, 8, -3};
Ruled Surface(4) = {3};
Line Loop(5) = {3, 9, 10, -4};
Ruled Surface(6) = {5};
Line Loop(7) = {4, 11, 12, -1};
Ruled Surface(8) = {7};
Line Loop(9) = {13, 21, -14, -5};
Ruled Surface(10) = {9};
Line Loop(11) = {14, 22, -15, -6};
Ruled Surface(12) = {11};
Line Loop(13) = {15, 23, -16, -7};
Ruled Surface(14) = {13};
Line Loop(15) = {16, 24, -17, -8};
Ruled Surface(16) = {15};
Line Loop(17) = {17, 25, -18, -9};
Ruled Surface(18) = {17};
Line Loop(19) = {18, 26, -19, -10};
Ruled Surface(20) = {19};
Line Loop(21) = {19, 27, -20, -11};
Ruled Surface(22) = {21};
Line Loop(23) = {20, 28, -13, -12};
Ruled Surface(24) = {23};
Line Loop(25) = {29, 37, -30, -21};
Ruled Surface(26) = {25};
Line Loop(27) = {30, 38, -31, -22};
Ruled Surface(28) = {27};
Line Loop(29) = {31, 39, -32, -23};
Ruled Surface(30) = {29};
Line Loop(31) = {32, 40, -33, -24};
Ruled Surface(32) = {31};
Line Loop(33) = {33, 41, -34, -25};
Ruled Surface(34) = {33};
Line Loop(35) = {34, 42, -35, -26};
Ruled Surface(36) = {35};
Line Loop(37) = {35, 43, -36, -27};
Ruled Surface(38) = {37};
Line Loop(39) = {36, 44, -29, -28};
Ruled Surface(40) = {39};

Line Loop(41) = {45, 49, 50, -46};
Ruled Surface(42) = {41};
Line Loop(43) = {46, 51, 52, -47};
Ruled Surface(44) = {43};
Line Loop(45) = {47, 53, 54, -48};
Ruled Surface(46) = {45};
Line Loop(47) = {48, 55, 56, -45};
Ruled Surface(48) = {47};
Line Loop(49) = {57, 65, -58, -49};
Ruled Surface(50) = {49};
Line Loop(51) = {58, 66, -59, -50};
Ruled Surface(52) = {51};
Line Loop(53) = {59, 67, -60, -51};
Ruled Surface(54) = {53};
Line Loop(55) = {60, 68, -61, -52};
Ruled Surface(56) = {55};
Line Loop(57) = {61, 69, -62, -53};
Ruled Surface(58) = {57};
Line Loop(59) = {62, 70, -63, -54};
Ruled Surface(60) = {59};
Line Loop(61) = {63, 71, -64, -55};
Ruled Surface(62) = {61};
Line Loop(63) = {64, 72, -57, -56};
Ruled Surface(64) = {63};
Line Loop(65) = {73, 81, -74, -65};
Ruled Surface(66) = {65};
Line Loop(67) = {74, 82, -75, -66};
Ruled Surface(68) = {67};
Line Loop(69) = {75, 83, -76, -67};
Ruled Surface(70) = {69};
Line Loop(71) = {76, 84, -77, -68};
Ruled Surface(72) = {71};
Line Loop(73) = {77, 85, -78, -69};
Ruled Surface(74) = {73};
Line Loop(75) = {78, 86, -79, -70};
Ruled Surface(76) = {75};
Line Loop(77) = {79, 87, -80, -71};
Ruled Surface(78) = {77};
Line Loop(79) = {80, 88, -73, -72};
Ruled Surface(80) = {79};

Line Loop(81) = {5, 90, -49, -89};
Ruled Surface(82) = {81};
Line Loop(83) = {6, 91, -50, -90};
Ruled Surface(84) = {83};
Line Loop(85) = {7, 92, -51, -91};
Ruled Surface(86) = {85};
Line Loop(87) = {8, 93, -52, -92};
Ruled Surface(88) = {87};
Line Loop(89) = {9, 94, -53, -93};
Ruled Surface(90) = {89};
Line Loop(91) = {10, 95, -54, -94};
Ruled Surface(92) = {91};
Line Loop(93) = {11, 96, -55, -95};
Ruled Surface(94) = {93};
Line Loop(95) = {12, 89, -56, -96};
Ruled Surface(96) = {95};

Line Loop(97) = {21, 98, -65, -97};
Ruled Surface(98) = {97};
Line Loop(99) = {22, 99, -66, -98};
Ruled Surface(100) = {99};
Line Loop(101) = {23, 100, -67, -99};
Ruled Surface(102) = {101};
Line Loop(103) = {24, 101, -68, -100};
Ruled Surface(104) = {103};
Line Loop(105) = {25, 102, -69, -101};
Ruled Surface(106) = {105};
Line Loop(107) = {26, 103, -70, -102};
Ruled Surface(108) = {107};
Line Loop(109) = {27, 104, -71, -103};
Ruled Surface(110) = {109};
Line Loop(111) = {28, 97, -72, -104};
Ruled Surface(112) = {111};

Line Loop(113) = {29, 105, -73, -97};
Ruled Surface(114) = {113};
Line Loop(115) = {30, 106, -74, -98};
Ruled Surface(116) = {115};
Line Loop(117) = {31, 107, -75, -99};
Ruled Surface(118) = {117};
Line Loop(119) = {32, 108, -76, -100};
Ruled Surface(120) = {119};
Line Loop(121) = {33, 109, -77, -101};
Ruled Surface(122) = {121};
Line Loop(123) = {34, 110, -78, -102};
Ruled Surface(124) = {123};
Line Loop(125) = {35, 111, -79, -103};
Ruled Surface(126) = {125};
Line Loop(127) = {36, 112, -80, -104};
Ruled Surface(128) = {127};

Line Loop(129) = {37, 106, -81, -105};
Ruled Surface(130) = {129};
Line Loop(131) = {38, 107, -82, -106};
Ruled Surface(132) = {131};
Line Loop(133) = {39, 108, -83, -107};
Ruled Surface(134) = {133};
Line Loop(135) = {40, 109, -84, -108};
Ruled Surface(136) = {135};
Line Loop(137) = {41, 110, -85, -109};
Ruled Surface(138) = {137};
Line Loop(139) = {42, 111, -86, -110};
Ruled Surface(140) = {139};
Line Loop(141) = {43, 112, -87, -111};
Ruled Surface(142) = {141};
Line Loop(143) = {44, 105, -88, -112};
Ruled Surface(144) = {143};

Line(113) = {1, 27};
Line Loop(145) = {1, 89, -45, -113};
Ruled Surface(146) = {145};
Line Loop(147) = {2, 91, -46, -113};
Ruled Surface(148) = {147};
Line Loop(149) = {3, 93, -47, -113};
Ruled Surface(150) = {149};
Line Loop(151) = {4, 95, -48, -113};
Ruled Surface(152) = {151};

Line Loop(153) = {13, 97, -57, -89};
Ruled Surface(154) = {153};
Line Loop(155) = {14, 98, -58, -90};
Ruled Surface(156) = {155};
Line Loop(157) = {15, 99, -59, -91};
Ruled Surface(158) = {157};
Line Loop(159) = {16, 100, -60, -92};
Ruled Surface(160) = {159};
Line Loop(161) = {17, 101, -61, -93};
Ruled Surface(162) = {161};
Line Loop(163) = {18, 102, -62, -94};
Ruled Surface(164) = {163};
Line Loop(165) = {19, 103, -63, -95};
Ruled Surface(166) = {165};
Line Loop(167) = {20, 104, -64, -96};
Ruled Surface(168) = {167};

Surface Loop(169) = {2, 42, 82, 84, 146, 148};
Volume(170) = {169};
Surface Loop(171) = {4, 44, 86, 88, 148, 150};
Volume(172) = {171};
Surface Loop(173) = {6, 46, 90, 92, 150, 152};
Volume(174) = {173};
Surface Loop(175) = {8, 48, 94, 96, 152, 146};
Volume(176) = {175};

Surface Loop(177) = {82, 98, 154, 156, 10, 50};
Volume(178) = {177};
Surface Loop(179) = {84, 100, 156, 158, 12, 52};
Volume(180) = {179};
Surface Loop(181) = {86, 102, 158, 160, 14, 54};
Volume(182) = {181};
Surface Loop(183) = {88, 104, 160, 162, 16, 56};
Volume(184) = {183};
Surface Loop(185) = {90, 106, 162, 164, 18, 58};
Volume(186) = {185};
Surface Loop(187) = {92, 108, 164, 166, 20, 60};
Volume(188) = {187};
Surface Loop(189) = {94, 110, 166, 168, 22, 62};
Volume(190) = {189};
Surface Loop(191) = {96, 112, 168, 154, 24, 64};
Volume(192) = {191};

Surface Loop(193) = {98, 130, 114, 116, 26, 66};
Volume(194) = {193};
Surface Loop(195) = {100, 132, 116, 118, 28, 68};
Volume(196) = {195};
Surface Loop(197) = {102, 134, 118, 120, 30, 70};
Volume(198) = {197};
Surface Loop(199) = {104, 136, 120, 122, 32, 72};
Volume(200) = {199};
Surface Loop(201) = {106, 138, 122, 124, 34, 74};
Volume(202) = {201};
Surface Loop(203) = {108, 140, 124, 126, 36, 76};
Volume(204) = {203};
Surface Loop(205) = {110, 142, 126, 128, 38, 78};
Volume(206) = {205};
Surface Loop(207) = {112, 144, 128, 114, 40, 80};
Volume(208) = {207};

// ------------------------------------------------------------------------- //
// Volume 2                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer2 = lengthLayer1 + 0.0065;

Point(53) = {0., 0., lengthLayer2, 1.0};
Point(54) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer2, 1.0};
Point(55) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer2, 1.0};
Point(56) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer2, 1.0};
Point(57) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer2, 1.0};
Point(58) = {sourceRadius, 0., lengthLayer2, 1.0};
Point(59) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer2, 1.0};
Point(60) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer2, 1.0};
Point(61) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer2, 1.0};

Point(62) = {domainRadius, 0., lengthLayer2, 1.0};
Point(63) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer2, 1.0};
Point(64) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer2, 1.0};
Point(65) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer2, 1.0};
Point(66) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer2, 1.0};
Point(67) = {domainRadius, 0., lengthLayer2, 1.0};
Point(68) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer2, 1.0};
Point(69) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer2, 1.0};
Point(70) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer2, 1.0};

Point(71) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer2, 1.0};
Point(72) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer2, 1.0};
Point(73) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer2, 1.0};
Point(74) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer2, 1.0};
Point(75) = {sourceRadius / 2, 0., lengthLayer2, 1.0};
Point(76) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer2, 1.0};
Point(77) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer2, 1.0};
Point(78) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer2, 1.0};

Line(201) = {53, 71};
Line(202) = {53, 73};
Line(203) = {53, 75};
Line(204) = {53, 77};
Line(205) = {71, 72};
Line(206) = {72, 73};
Line(207) = {73, 74};
Line(208) = {74, 75};
Line(209) = {75, 76};
Line(210) = {76, 77};
Line(211) = {77, 78};
Line(212) = {78, 71};
Line(213) = {71, 54};
Line(214) = {72, 55};
Line(215) = {73, 56};
Line(216) = {74, 57};
Line(217) = {75, 58};
Line(218) = {76, 59};
Line(219) = {77, 60};
Line(220) = {78, 61};
Circle(221) = {54, 53, 55};
Circle(222) = {55, 53, 56};
Circle(223) = {56, 53, 57};
Circle(224) = {57, 53, 58};
Circle(225) = {58, 53, 59};
Circle(226) = {59, 53, 60};
Circle(227) = {60, 53, 61};
Circle(228) = {61, 53, 54};
Line(229) = {54, 63};
Line(230) = {55, 64};
Line(231) = {56, 65};
Line(232) = {57, 66};
Line(233) = {58, 67};
Line(234) = {59, 68};
Line(235) = {60, 69};
Line(236) = {61, 70};
Circle(237) = {63, 53, 64};
Circle(238) = {64, 53, 65};
Circle(239) = {65, 53, 66};
Circle(240) = {66, 53, 67};
Circle(241) = {67, 53, 68};
Circle(242) = {68, 53, 69};
Circle(243) = {69, 53, 70};
Circle(244) = {70, 53, 63};

Line(245) = {45, 71};
Line(246) = {46, 72};
Line(247) = {47, 73};
Line(248) = {48, 74};
Line(249) = {49, 75};
Line(250) = {50, 76};
Line(251) = {51, 77};
Line(252) = {52, 78};
Line(253) = {28, 54};
Line(254) = {29, 55};
Line(255) = {30, 56};
Line(256) = {31, 57};
Line(257) = {32, 58};
Line(258) = {33, 59};
Line(259) = {34, 60};
Line(260) = {35, 61};
Line(261) = {37, 63};
Line(262) = {38, 64};
Line(263) = {39, 65};
Line(264) = {40, 66};
Line(265) = {41, 67};
Line(266) = {42, 68};
Line(267) = {43, 69};
Line(268) = {44, 70};

Line Loop(201) = {201, 205, 206, -202};
Ruled Surface(202) = {201};
Line Loop(203) = {202, 207, 208, -203};
Ruled Surface(204) = {203};
Line Loop(205) = {203, 209, 210, -204};
Ruled Surface(206) = {205};
Line Loop(207) = {204, 211, 212, -201};
Ruled Surface(208) = {207};
Line Loop(209) = {213, 221, -214, -205};
Ruled Surface(210) = {209};
Line Loop(211) = {214, 222, -215, -206};
Ruled Surface(212) = {211};
Line Loop(213) = {215, 223, -216, -207};
Ruled Surface(214) = {213};
Line Loop(215) = {216, 224, -217, -208};
Ruled Surface(216) = {215};
Line Loop(217) = {217, 225, -218, -209};
Ruled Surface(218) = {217};
Line Loop(219) = {218, 226, -219, -210};
Ruled Surface(220) = {219};
Line Loop(221) = {219, 227, -220, -211};
Ruled Surface(222) = {221};
Line Loop(223) = {220, 228, -213, -212};
Ruled Surface(224) = {223};
Line Loop(225) = {229, 237, -230, -221};
Ruled Surface(226) = {225};
Line Loop(227) = {230, 238, -231, -222};
Ruled Surface(228) = {227};
Line Loop(229) = {231, 239, -232, -223};
Ruled Surface(230) = {229};
Line Loop(231) = {232, 240, -233, -224};
Ruled Surface(232) = {231};
Line Loop(233) = {233, 241, -234, -225};
Ruled Surface(234) = {233};
Line Loop(235) = {234, 242, -235, -226};
Ruled Surface(236) = {235};
Line Loop(237) = {235, 243, -236, -227};
Ruled Surface(238) = {237};
Line Loop(239) = {236, 244, -229, -228};
Ruled Surface(240) = {239};

Line Loop(241) = {49, 246, -205, -245};
Ruled Surface(242) = {241};
Line Loop(243) = {50, 247, -206, -246};
Ruled Surface(244) = {243};
Line Loop(245) = {51, 248, -207, -247};
Ruled Surface(246) = {245};
Line Loop(247) = {52, 249, -208, -248};
Ruled Surface(248) = {247};
Line Loop(249) = {53, 250, -209, -249};
Ruled Surface(250) = {249};
Line Loop(251) = {54, 251, -210, -250};
Ruled Surface(252) = {251};
Line Loop(253) = {55, 252, -211, -251};
Ruled Surface(254) = {253};
Line Loop(255) = {56, 245, -212, -252};
Ruled Surface(256) = {255};

Line Loop(257) = {65, 254, -221, -253};
Ruled Surface(258) = {257};
Line Loop(259) = {66, 255, -222, -254};
Ruled Surface(260) = {259};
Line Loop(261) = {67, 256, -223, -255};
Ruled Surface(262) = {261};
Line Loop(263) = {68, 257, -224, -256};
Ruled Surface(264) = {263};
Line Loop(265) = {69, 258, -225, -257};
Ruled Surface(266) = {265};
Line Loop(267) = {70, 259, -226, -258};
Ruled Surface(268) = {267};
Line Loop(269) = {71, 260, -227, -259};
Ruled Surface(270) = {269};
Line Loop(271) = {72, 253, -228, -260};
Ruled Surface(272) = {271};

Line Loop(273) = {73, 261, -229, -253};
Ruled Surface(274) = {273};
Line Loop(275) = {74, 262, -230, -254};
Ruled Surface(276) = {275};
Line Loop(277) = {75, 263, -231, -255};
Ruled Surface(278) = {277};
Line Loop(279) = {76, 264, -232, -256};
Ruled Surface(280) = {279};
Line Loop(281) = {77, 265, -233, -257};
Ruled Surface(282) = {281};
Line Loop(283) = {78, 266, -234, -258};
Ruled Surface(284) = {283};
Line Loop(285) = {79, 267, -235, -259};
Ruled Surface(286) = {285};
Line Loop(287) = {80, 268, -236, -260};
Ruled Surface(288) = {287};

Line Loop(289) = {81, 262, -237, -261};
Ruled Surface(290) = {289};
Line Loop(291) = {82, 263, -238, -262};
Ruled Surface(292) = {291};
Line Loop(293) = {83, 264, -239, -263};
Ruled Surface(294) = {293};
Line Loop(295) = {84, 265, -240, -264};
Ruled Surface(296) = {295};
Line Loop(297) = {85, 266, -241, -265};
Ruled Surface(298) = {297};
Line Loop(299) = {86, 267, -242, -266};
Ruled Surface(300) = {299};
Line Loop(301) = {87, 268, -243, -267};
Ruled Surface(302) = {301};
Line Loop(303) = {88, 261, -244, -268};
Ruled Surface(304) = {303};

Line(269) = {27, 53};
Line Loop(305) = {45, 245, -201, -269};
Ruled Surface(306) = {305};
Line Loop(307) = {46, 247, -202, -269};
Ruled Surface(308) = {307};
Line Loop(309) = {47, 249, -203, -269};
Ruled Surface(310) = {309};
Line Loop(311) = {48, 251, -204, -269};
Ruled Surface(312) = {311};

Line Loop(313) = {57, 253, -213, -245};
Ruled Surface(314) = {313};
Line Loop(315) = {58, 254, -214, -246};
Ruled Surface(316) = {315};
Line Loop(317) = {59, 255, -215, -247};
Ruled Surface(318) = {317};
Line Loop(319) = {60, 256, -216, -248};
Ruled Surface(320) = {319};
Line Loop(321) = {61, 257, -217, -249};
Ruled Surface(322) = {321};
Line Loop(323) = {62, 258, -218, -250};
Ruled Surface(324) = {323};
Line Loop(325) = {63, 259, -219, -251};
Ruled Surface(326) = {325};
Line Loop(327) = {64, 260, -220, -252};
Ruled Surface(328) = {327};

Surface Loop(329) = {42, 202, 242, 244, 306, 308};
Volume(330) = {329};
Surface Loop(331) = {44, 204, 246, 248, 308, 310};
Volume(332) = {331};
Surface Loop(333) = {46, 206, 250, 252, 310, 312};
Volume(334) = {333};
Surface Loop(335) = {48, 208, 254, 256, 312, 306};
Volume(336) = {335};

Surface Loop(337) = {242, 258, 314, 316, 50, 210};
Volume(338) = {337};
Surface Loop(339) = {244, 260, 316, 318, 52, 212};
Volume(340) = {339};
Surface Loop(341) = {246, 262, 318, 320, 54, 214};
Volume(342) = {341};
Surface Loop(343) = {248, 264, 320, 322, 56, 216};
Volume(344) = {343};
Surface Loop(345) = {250, 266, 322, 324, 58, 218};
Volume(346) = {345};
Surface Loop(347) = {252, 268, 324, 326, 60, 220};
Volume(348) = {347};
Surface Loop(349) = {254, 270, 326, 328, 62, 222};
Volume(350) = {349};
Surface Loop(351) = {256, 272, 328, 314, 64, 224};
Volume(352) = {351};

Surface Loop(353) = {258, 290, 274, 276, 66, 226};
Volume(354) = {353};
Surface Loop(355) = {260, 292, 276, 278, 68, 228};
Volume(356) = {355};
Surface Loop(357) = {262, 294, 278, 280, 70, 230};
Volume(358) = {357};
Surface Loop(359) = {264, 296, 280, 282, 72, 232};
Volume(360) = {359};
Surface Loop(361) = {266, 298, 282, 284, 74, 234};
Volume(362) = {361};
Surface Loop(363) = {268, 300, 284, 286, 76, 236};
Volume(364) = {363};
Surface Loop(365) = {270, 302, 286, 288, 78, 238};
Volume(366) = {365};
Surface Loop(367) = {272, 304, 288, 274, 80, 240};
Volume(368) = {367};

// ------------------------------------------------------------------------- //
// Volume 3                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer3 = 0.12 + numExtraWavelength*wavelength;

Point(79) = {0., 0., lengthLayer3, 1.0};
Point(80) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer3, 1.0};
Point(81) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer3, 1.0};
Point(82) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer3, 1.0};
Point(83) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer3, 1.0};
Point(84) = {sourceRadius, 0., lengthLayer3, 1.0};
Point(85) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer3, 1.0};
Point(86) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer3, 1.0};
Point(87) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer3, 1.0};

Point(88) = {domainRadius, 0., lengthLayer3, 1.0};
Point(89) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer3, 1.0};
Point(90) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer3, 1.0};
Point(91) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer3, 1.0};
Point(92) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer3, 1.0};
Point(93) = {domainRadius, 0., lengthLayer3, 1.0};
Point(94) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer3, 1.0};
Point(95) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer3, 1.0};
Point(96) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer3, 1.0};

Point(97) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer3, 1.0};
Point(98) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer3, 1.0};
Point(99) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer3, 1.0};
Point(100) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer3, 1.0};
Point(101) = {sourceRadius / 2, 0., lengthLayer3, 1.0};
Point(102) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer3, 1.0};
Point(103) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer3, 1.0};
Point(104) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer3, 1.0};

Line(401) = {79, 97};
Line(402) = {79, 99};
Line(403) = {79, 101};
Line(404) = {79, 103};
Line(405) = {97, 98};
Line(406) = {98, 99};
Line(407) = {99, 100};
Line(408) = {100, 101};
Line(409) = {101, 102};
Line(410) = {102, 103};
Line(411) = {103, 104};
Line(412) = {104, 97};
Line(413) = {97, 80};
Line(414) = {98, 81};
Line(415) = {99, 82};
Line(416) = {100, 83};
Line(417) = {101, 84};
Line(418) = {102, 85};
Line(419) = {103, 86};
Line(420) = {104, 87};
Circle(421) = {80, 79, 81};
Circle(422) = {81, 79, 82};
Circle(423) = {82, 79, 83};
Circle(424) = {83, 79, 84};
Circle(425) = {84, 79, 85};
Circle(426) = {85, 79, 86};
Circle(427) = {86, 79, 87};
Circle(428) = {87, 79, 80};
Line(429) = {80, 89};
Line(430) = {81, 90};
Line(431) = {82, 91};
Line(432) = {83, 92};
Line(433) = {84, 93};
Line(434) = {85, 94};
Line(435) = {86, 95};
Line(436) = {87, 96};
Circle(437) = {89, 79, 90};
Circle(438) = {90, 79, 91};
Circle(439) = {91, 79, 92};
Circle(440) = {92, 79, 93};
Circle(441) = {93, 79, 94};
Circle(442) = {94, 79, 95};
Circle(443) = {95, 79, 96};
Circle(444) = {96, 79, 89};

Line(445) = {71, 97};
Line(446) = {72, 98};
Line(447) = {73, 99};
Line(448) = {74, 100};
Line(449) = {75, 101};
Line(450) = {76, 102};
Line(451) = {77, 103};
Line(452) = {78, 104};
Line(453) = {54, 80};
Line(454) = {55, 81};
Line(455) = {56, 82};
Line(456) = {57, 83};
Line(457) = {58, 84};
Line(458) = {59, 85};
Line(459) = {60, 86};
Line(460) = {61, 87};
Line(461) = {63, 89};
Line(462) = {64, 90};
Line(463) = {65, 91};
Line(464) = {66, 92};
Line(465) = {67, 93};
Line(466) = {68, 94};
Line(467) = {69, 95};
Line(468) = {70, 96};

Line Loop(401) = {401, 405, 406, -402};
Ruled Surface(402) = {401};
Line Loop(403) = {402, 407, 408, -403};
Ruled Surface(404) = {403};
Line Loop(405) = {403, 409, 410, -404};
Ruled Surface(406) = {405};
Line Loop(407) = {404, 411, 412, -401};
Ruled Surface(408) = {407};
Line Loop(409) = {413, 421, -414, -405};
Ruled Surface(410) = {409};
Line Loop(411) = {414, 422, -415, -406};
Ruled Surface(412) = {411};
Line Loop(413) = {415, 423, -416, -407};
Ruled Surface(414) = {413};
Line Loop(415) = {416, 424, -417, -408};
Ruled Surface(416) = {415};
Line Loop(417) = {417, 425, -418, -409};
Ruled Surface(418) = {417};
Line Loop(419) = {418, 426, -419, -410};
Ruled Surface(420) = {419};
Line Loop(421) = {419, 427, -420, -411};
Ruled Surface(422) = {421};
Line Loop(423) = {420, 428, -413, -412};
Ruled Surface(424) = {423};
Line Loop(425) = {429, 437, -430, -421};
Ruled Surface(426) = {425};
Line Loop(427) = {430, 438, -431, -422};
Ruled Surface(428) = {427};
Line Loop(429) = {431, 439, -432, -423};
Ruled Surface(430) = {429};
Line Loop(431) = {432, 440, -433, -424};
Ruled Surface(432) = {431};
Line Loop(433) = {433, 441, -434, -425};
Ruled Surface(434) = {433};
Line Loop(435) = {434, 442, -435, -426};
Ruled Surface(436) = {435};
Line Loop(437) = {435, 443, -436, -427};
Ruled Surface(438) = {437};
Line Loop(439) = {436, 444, -429, -428};
Ruled Surface(440) = {439};

Line Loop(441) = {205, 446, -405, -445};
Ruled Surface(442) = {441};
Line Loop(443) = {206, 447, -406, -446};
Ruled Surface(444) = {443};
Line Loop(445) = {207, 448, -407, -447};
Ruled Surface(446) = {445};
Line Loop(447) = {208, 449, -408, -448};
Ruled Surface(448) = {447};
Line Loop(449) = {209, 450, -409, -449};
Ruled Surface(450) = {449};
Line Loop(451) = {210, 451, -410, -450};
Ruled Surface(452) = {451};
Line Loop(453) = {211, 452, -411, -451};
Ruled Surface(454) = {453};
Line Loop(455) = {212, 445, -412, -452};
Ruled Surface(456) = {455};

Line Loop(457) = {221, 454, -421, -453};
Ruled Surface(458) = {457};
Line Loop(459) = {222, 455, -422, -454};
Ruled Surface(460) = {459};
Line Loop(461) = {223, 456, -423, -455};
Ruled Surface(462) = {461};
Line Loop(463) = {224, 457, -424, -456};
Ruled Surface(464) = {463};
Line Loop(465) = {225, 458, -425, -457};
Ruled Surface(466) = {465};
Line Loop(467) = {226, 459, -426, -458};
Ruled Surface(468) = {467};
Line Loop(469) = {227, 460, -427, -459};
Ruled Surface(470) = {469};
Line Loop(471) = {228, 453, -428, -460};
Ruled Surface(472) = {471};

Line Loop(473) = {229, 461, -429, -453};
Ruled Surface(474) = {473};
Line Loop(475) = {230, 462, -430, -454};
Ruled Surface(476) = {475};
Line Loop(477) = {231, 463, -431, -455};
Ruled Surface(478) = {477};
Line Loop(479) = {232, 464, -432, -456};
Ruled Surface(480) = {479};
Line Loop(481) = {233, 465, -433, -457};
Ruled Surface(482) = {481};
Line Loop(483) = {234, 466, -434, -458};
Ruled Surface(484) = {483};
Line Loop(485) = {235, 467, -435, -459};
Ruled Surface(486) = {485};
Line Loop(487) = {236, 468, -436, -460};
Ruled Surface(488) = {487};

Line Loop(489) = {237, 462, -437, -461};
Ruled Surface(490) = {489};
Line Loop(491) = {238, 463, -438, -462};
Ruled Surface(492) = {491};
Line Loop(493) = {239, 464, -439, -463};
Ruled Surface(494) = {493};
Line Loop(495) = {240, 465, -440, -464};
Ruled Surface(496) = {495};
Line Loop(497) = {241, 466, -441, -465};
Ruled Surface(498) = {497};
Line Loop(499) = {242, 467, -442, -466};
Ruled Surface(500) = {499};
Line Loop(501) = {243, 468, -443, -467};
Ruled Surface(502) = {501};
Line Loop(503) = {244, 461, -444, -468};
Ruled Surface(504) = {503};

Line(469) = {53, 79};
Line Loop(505) = {201, 445, -401, -469};
Ruled Surface(506) = {505};
Line Loop(507) = {202, 447, -402, -469};
Ruled Surface(508) = {507};
Line Loop(509) = {203, 449, -403, -469};
Ruled Surface(510) = {509};
Line Loop(511) = {204, 451, -404, -469};
Ruled Surface(512) = {511};

Line Loop(513) = {213, 453, -413, -445};
Ruled Surface(514) = {513};
Line Loop(515) = {214, 454, -414, -446};
Ruled Surface(516) = {515};
Line Loop(517) = {215, 455, -415, -447};
Ruled Surface(518) = {517};
Line Loop(519) = {216, 456, -416, -448};
Ruled Surface(520) = {519};
Line Loop(521) = {217, 457, -417, -449};
Ruled Surface(522) = {521};
Line Loop(523) = {218, 458, -418, -450};
Ruled Surface(524) = {523};
Line Loop(525) = {219, 459, -419, -451};
Ruled Surface(526) = {525};
Line Loop(527) = {220, 460, -420, -452};
Ruled Surface(528) = {527};

Surface Loop(529) = {202, 402, 442, 444, 506, 508};
Volume(530) = {529};
Surface Loop(531) = {204, 404, 446, 448, 508, 510};
Volume(532) = {531};
Surface Loop(533) = {206, 406, 450, 452, 510, 512};
Volume(534) = {533};
Surface Loop(535) = {208, 408, 454, 456, 512, 506};
Volume(536) = {535};

Surface Loop(537) = {442, 458, 514, 516, 210, 410};
Volume(538) = {537};
Surface Loop(539) = {444, 460, 516, 518, 212, 412};
Volume(540) = {539};
Surface Loop(541) = {446, 462, 518, 520, 214, 414};
Volume(542) = {541};
Surface Loop(543) = {448, 464, 520, 522, 216, 416};
Volume(544) = {543};
Surface Loop(545) = {450, 466, 522, 524, 218, 418};
Volume(546) = {545};
Surface Loop(547) = {452, 468, 524, 526, 220, 420};
Volume(548) = {547};
Surface Loop(549) = {454, 470, 526, 528, 222, 422};
Volume(550) = {549};
Surface Loop(551) = {456, 472, 528, 514, 224, 424};
Volume(552) = {551};

Surface Loop(553) = {458, 490, 474, 476, 226, 426};
Volume(554) = {553};
Surface Loop(555) = {460, 492, 476, 478, 228, 428};
Volume(556) = {555};
Surface Loop(557) = {462, 494, 478, 480, 230, 430};
Volume(558) = {557};
Surface Loop(559) = {464, 496, 480, 482, 232, 432};
Volume(560) = {559};
Surface Loop(561) = {466, 498, 482, 484, 234, 434};
Volume(562) = {561};
Surface Loop(563) = {468, 500, 484, 486, 236, 436};
Volume(564) = {563};
Surface Loop(565) = {470, 502, 486, 488, 238, 438};
Volume(566) = {565};
Surface Loop(567) = {472, 504, 488, 474, 240, 440};
Volume(568) = {567};

// ------------------------------------------------------------------------- //
// Sponge layer volume                                                       //
// ------------------------------------------------------------------------- //

Point(105) = {spongeLayerRadius, 0., 0., 1.0};
Point(106) = {spongeLayerRadius * Cos(1/4*Pi), spongeLayerRadius * Sin(1/4*Pi), 0., 1.0};
Point(107) = {spongeLayerRadius * Cos(1/2*Pi), spongeLayerRadius * Sin(1/2*Pi), 0., 1.0};
Point(108) = {spongeLayerRadius * Cos(3/4*Pi), spongeLayerRadius * Sin(3/4*Pi), 0., 1.0};
Point(109) = {spongeLayerRadius * Cos(Pi), spongeLayerRadius * Sin(Pi), 0., 1.0};
Point(110) = {spongeLayerRadius * Cos(5/4*Pi), spongeLayerRadius * Sin(5/4*Pi), 0., 1.0};
Point(111) = {spongeLayerRadius * Cos(3/2*Pi), spongeLayerRadius * Sin(3/2*Pi), 0., 1.0};
Point(112) = {spongeLayerRadius * Cos(7/4*Pi), spongeLayerRadius * Sin(7/4*Pi), 0., 1.0};

Point(113) = {spongeLayerRadius, 0., lengthLayer1, 1.0};
Point(114) = {spongeLayerRadius * Cos(1/4*Pi), spongeLayerRadius * Sin(1/4*Pi), lengthLayer1, 1.0};
Point(115) = {spongeLayerRadius * Cos(1/2*Pi), spongeLayerRadius * Sin(1/2*Pi), lengthLayer1, 1.0};
Point(116) = {spongeLayerRadius * Cos(3/4*Pi), spongeLayerRadius * Sin(3/4*Pi), lengthLayer1, 1.0};
Point(117) = {spongeLayerRadius * Cos(Pi), spongeLayerRadius * Sin(Pi), lengthLayer1, 1.0};
Point(118) = {spongeLayerRadius * Cos(5/4*Pi), spongeLayerRadius * Sin(5/4*Pi), lengthLayer1, 1.0};
Point(119) = {spongeLayerRadius * Cos(3/2*Pi), spongeLayerRadius * Sin(3/2*Pi), lengthLayer1, 1.0};
Point(120) = {spongeLayerRadius * Cos(7/4*Pi), spongeLayerRadius * Sin(7/4*Pi), lengthLayer1, 1.0};

Point(121) = {spongeLayerRadius, 0., lengthLayer2, 1.0};
Point(122) = {spongeLayerRadius * Cos(1/4*Pi), spongeLayerRadius * Sin(1/4*Pi), lengthLayer2, 1.0};
Point(123) = {spongeLayerRadius * Cos(1/2*Pi), spongeLayerRadius * Sin(1/2*Pi), lengthLayer2, 1.0};
Point(124) = {spongeLayerRadius * Cos(3/4*Pi), spongeLayerRadius * Sin(3/4*Pi), lengthLayer2, 1.0};
Point(125) = {spongeLayerRadius * Cos(Pi), spongeLayerRadius * Sin(Pi), lengthLayer2, 1.0};
Point(126) = {spongeLayerRadius * Cos(5/4*Pi), spongeLayerRadius * Sin(5/4*Pi), lengthLayer2, 1.0};
Point(127) = {spongeLayerRadius * Cos(3/2*Pi), spongeLayerRadius * Sin(3/2*Pi), lengthLayer2, 1.0};
Point(128) = {spongeLayerRadius * Cos(7/4*Pi), spongeLayerRadius * Sin(7/4*Pi), lengthLayer2, 1.0};

Point(129) = {spongeLayerRadius, 0., lengthLayer3, 1.0};
Point(130) = {spongeLayerRadius * Cos(1/4*Pi), spongeLayerRadius * Sin(1/4*Pi), lengthLayer3, 1.0};
Point(131) = {spongeLayerRadius * Cos(1/2*Pi), spongeLayerRadius * Sin(1/2*Pi), lengthLayer3, 1.0};
Point(132) = {spongeLayerRadius * Cos(3/4*Pi), spongeLayerRadius * Sin(3/4*Pi), lengthLayer3, 1.0};
Point(133) = {spongeLayerRadius * Cos(Pi), spongeLayerRadius * Sin(Pi), lengthLayer3, 1.0};
Point(134) = {spongeLayerRadius * Cos(5/4*Pi), spongeLayerRadius * Sin(5/4*Pi), lengthLayer3, 1.0};
Point(135) = {spongeLayerRadius * Cos(3/2*Pi), spongeLayerRadius * Sin(3/2*Pi), lengthLayer3, 1.0};
Point(136) = {spongeLayerRadius * Cos(7/4*Pi), spongeLayerRadius * Sin(7/4*Pi), lengthLayer3, 1.0};

Line(601) = {15, 105};
Line(602) = {16, 106};
Line(603) = {17, 107};
Line(604) = {18, 108};
Line(605) = {11, 109};
Line(606) = {12, 110};
Line(607) = {13, 111};
Line(608) = {14, 112};
Circle(609) = {105, 1, 106};
Circle(610) = {106, 1, 107};
Circle(611) = {107, 1, 108};
Circle(612) = {108, 1, 109};
Circle(613) = {109, 1, 110};
Circle(614) = {110, 1, 111};
Circle(615) = {111, 1, 112};
Circle(616) = {112, 1, 105};

Line(617) = {41, 113};
Line(618) = {42, 114};
Line(619) = {43, 115};
Line(620) = {44, 116};
Line(621) = {37, 117};
Line(622) = {38, 118};
Line(623) = {39, 119};
Line(624) = {40, 120};
Circle(625) = {113, 27, 114};
Circle(626) = {114, 27, 115};
Circle(627) = {115, 27, 116};
Circle(628) = {116, 27, 117};
Circle(629) = {117, 27, 118};
Circle(630) = {118, 27, 119};
Circle(631) = {119, 27, 120};
Circle(632) = {120, 27, 113};

Line(633) = {67, 121};
Line(634) = {68, 122};
Line(635) = {69, 123};
Line(636) = {70, 124};
Line(637) = {63, 125};
Line(638) = {64, 126};
Line(639) = {65, 127};
Line(640) = {66, 128};
Circle(641) = {121, 53, 122};
Circle(642) = {122, 53, 123};
Circle(643) = {123, 53, 124};
Circle(644) = {124, 53, 125};
Circle(645) = {125, 53, 126};
Circle(646) = {126, 53, 127};
Circle(647) = {127, 53, 128};
Circle(648) = {128, 53, 121};

Line(649) = {93, 129};
Line(650) = {94, 130};
Line(651) = {95, 131};
Line(652) = {96, 132};
Line(653) = {89, 133};
Line(654) = {90, 134};
Line(655) = {91, 135};
Line(656) = {92, 136};
Circle(657) = {129, 79, 130};
Circle(658) = {130, 79, 131};
Circle(659) = {131, 79, 132};
Circle(660) = {132, 79, 133};
Circle(661) = {133, 79, 134};
Circle(662) = {134, 79, 135};
Circle(663) = {135, 79, 136};
Circle(664) = {136, 79, 129};

Line(665) = {105, 113};
Line(666) = {106, 114};
Line(667) = {107, 115};
Line(668) = {108, 116};
Line(669) = {109, 117};
Line(670) = {110, 118};
Line(671) = {111, 119};
Line(672) = {112, 120};

Line(673) = {113, 121};
Line(674) = {114, 122};
Line(675) = {115, 123};
Line(676) = {116, 124};
Line(677) = {117, 125};
Line(678) = {118, 126};
Line(679) = {119, 127};
Line(680) = {120, 128};

Line(681) = {121, 129};
Line(682) = {122, 130};
Line(683) = {123, 131};
Line(684) = {124, 132};
Line(685) = {125, 133};
Line(686) = {126, 134};
Line(687) = {127, 135};
Line(688) = {128, 136};

Line Loop(601) = {601, 609, -602, -41};
Ruled Surface(602) = {601};
Line Loop(603) = {602, 610, -603, -42};
Ruled Surface(604) = {603};
Line Loop(605) = {603, 611, -604, -43};
Ruled Surface(606) = {605};
Line Loop(607) = {604, 612, -605, -44};
Ruled Surface(608) = {607};
Line Loop(609) = {605, 613, -606, -37};
Ruled Surface(610) = {609};
Line Loop(611) = {606, 614, -607, -38};
Ruled Surface(612) = {611};
Line Loop(613) = {607, 615, -608, -39};
Ruled Surface(614) = {613};
Line Loop(615) = {608, 616, -601, -40};
Ruled Surface(616) = {615};

Line Loop(617) = {617, 625, -618, -85};
Ruled Surface(618) = {617};
Line Loop(619) = {618, 626, -619, -86};
Ruled Surface(620) = {619};
Line Loop(621) = {619, 627, -620, -87};
Ruled Surface(622) = {621};
Line Loop(623) = {620, 628, -621, -88};
Ruled Surface(624) = {623};
Line Loop(625) = {621, 629, -622, -81};
Ruled Surface(626) = {625};
Line Loop(627) = {622, 630, -623, -82};
Ruled Surface(628) = {627};
Line Loop(629) = {623, 631, -624, -83};
Ruled Surface(630) = {629};
Line Loop(631) = {624, 632, -617, -84};
Ruled Surface(632) = {631};

Line Loop(633) = {633, 641, -634, -241};
Ruled Surface(634) = {633};
Line Loop(635) = {634, 642, -635, -242};
Ruled Surface(636) = {635};
Line Loop(637) = {635, 643, -636, -243};
Ruled Surface(638) = {637};
Line Loop(639) = {636, 644, -637, -244};
Ruled Surface(640) = {639};
Line Loop(641) = {637, 645, -638, -237};
Ruled Surface(642) = {641};
Line Loop(643) = {638, 646, -639, -238};
Ruled Surface(644) = {643};
Line Loop(645) = {639, 647, -640, -239};
Ruled Surface(646) = {645};
Line Loop(647) = {640, 648, -633, -240};
Ruled Surface(648) = {647};

Line Loop(649) = {649, 657, -650, -441};
Ruled Surface(650) = {649};
Line Loop(651) = {650, 658, -651, -442};
Ruled Surface(652) = {651};
Line Loop(653) = {651, 659, -652, -443};
Ruled Surface(654) = {653};
Line Loop(655) = {652, 660, -653, -444};
Ruled Surface(656) = {655};
Line Loop(657) = {653, 661, -654, -437};
Ruled Surface(658) = {657};
Line Loop(659) = {654, 662, -655, -438};
Ruled Surface(660) = {659};
Line Loop(661) = {655, 663, -656, -439};
Ruled Surface(662) = {661};
Line Loop(663) = {656, 664, -649, -440};
Ruled Surface(664) = {663};

Line Loop(665) = {-665, 609, 666, -625};
Ruled Surface(666) = {665};
Line Loop(667) = {-666, 610, 667, -626};
Ruled Surface(668) = {667};
Line Loop(669) = {-667, 611, 668, -627};
Ruled Surface(670) = {669};
Line Loop(671) = {-668, 612, 669, -628};
Ruled Surface(672) = {671};
Line Loop(673) = {-669, 613, 670, -629};
Ruled Surface(674) = {673};
Line Loop(675) = {-670, 614, 671, -630};
Ruled Surface(676) = {675};
Line Loop(677) = {-671, 615, 672, -631};
Ruled Surface(678) = {677};
Line Loop(679) = {-672, 616, 665, -632};
Ruled Surface(680) = {679};

Line Loop(681) = {-673, 625, 674, -641};
Ruled Surface(682) = {681};
Line Loop(683) = {-674, 626, 675, -642};
Ruled Surface(684) = {683};
Line Loop(685) = {-675, 627, 676, -643};
Ruled Surface(686) = {685};
Line Loop(687) = {-676, 628, 677, -644};
Ruled Surface(688) = {687};
Line Loop(689) = {-677, 629, 678, -645};
Ruled Surface(690) = {689};
Line Loop(691) = {-678, 630, 679, -646};
Ruled Surface(692) = {691};
Line Loop(693) = {-679, 631, 680, -647};
Ruled Surface(694) = {693};
Line Loop(695) = {-680, 632, 673, -648};
Ruled Surface(696) = {695};

Line Loop(697) = {-681, 641, 682, -657};
Ruled Surface(698) = {697};
Line Loop(699) = {-682, 642, 683, -658};
Ruled Surface(700) = {699};
Line Loop(701) = {-683, 643, 684, -659};
Ruled Surface(702) = {701};
Line Loop(703) = {-684, 644, 685, -660};
Ruled Surface(704) = {703};
Line Loop(705) = {-685, 645, 686, -661};
Ruled Surface(706) = {705};
Line Loop(707) = {-686, 646, 687, -662};
Ruled Surface(708) = {707};
Line Loop(709) = {-687, 647, 688, -663};
Ruled Surface(710) = {709};
Line Loop(711) = {-688, 648, 681, -664};
Ruled Surface(712) = {711};

Line Loop(713) = {601, 665, -617, -109};
Ruled Surface(714) = {713};
Line Loop(715) = {602, 666, -618, -110};
Ruled Surface(716) = {715};
Line Loop(717) = {603, 667, -619, -111};
Ruled Surface(718) = {717};
Line Loop(719) = {604, 668, -620, -112};
Ruled Surface(720) = {719};
Line Loop(721) = {605, 669, -621, -105};
Ruled Surface(722) = {721};
Line Loop(723) = {606, 670, -622, -106};
Ruled Surface(724) = {723};
Line Loop(725) = {607, 671, -623, -107};
Ruled Surface(726) = {725};
Line Loop(727) = {608, 672, -624, -108};
Ruled Surface(728) = {727};

Line Loop(729) = {617, 673, -633, -265};
Ruled Surface(730) = {729};
Line Loop(731) = {618, 674, -634, -266};
Ruled Surface(732) = {731};
Line Loop(733) = {619, 675, -635, -267};
Ruled Surface(734) = {733};
Line Loop(735) = {620, 676, -636, -268};
Ruled Surface(736) = {735};
Line Loop(737) = {621, 677, -637, -261};
Ruled Surface(738) = {737};
Line Loop(739) = {622, 678, -638, -262};
Ruled Surface(740) = {739};
Line Loop(741) = {623, 679, -639, -263};
Ruled Surface(742) = {741};
Line Loop(743) = {624, 680, -640, -264};
Ruled Surface(744) = {743};

Line Loop(745) = {633, 681, -649, -465};
Ruled Surface(746) = {745};
Line Loop(747) = {634, 682, -650, -466};
Ruled Surface(748) = {747};
Line Loop(749) = {635, 683, -651, -467};
Ruled Surface(750) = {749};
Line Loop(751) = {636, 684, -652, -468};
Ruled Surface(752) = {751};
Line Loop(753) = {637, 685, -653, -461};
Ruled Surface(754) = {753};
Line Loop(755) = {638, 686, -654, -462};
Ruled Surface(756) = {755};
Line Loop(757) = {639, 687, -655, -463};
Ruled Surface(758) = {757};
Line Loop(759) = {640, 688, -656, -464};
Ruled Surface(760) = {759};

Surface Loop(761) = {714, 716, 602, 618, 138, 666};
Volume(762) = {761};
Surface Loop(763) = {716, 718, 604, 620, 140, 668};
Volume(764) = {763};
Surface Loop(765) = {718, 720, 606, 622, 142, 670};
Volume(766) = {765};
Surface Loop(767) = {720, 722, 608, 624, 144, 672};
Volume(768) = {767};
Surface Loop(769) = {722, 724, 610, 626, 130, 674};
Volume(770) = {769};
Surface Loop(771) = {724, 726, 612, 628, 132, 676};
Volume(772) = {771};
Surface Loop(773) = {726, 728, 614, 630, 134, 678};
Volume(774) = {773};
Surface Loop(775) = {728, 714, 616, 632, 136, 680};
Volume(776) = {775};

Surface Loop(777) = {730, 732, 618, 634, 298, 682};
Volume(778) = {777};
Surface Loop(779) = {732, 734, 620, 636, 300, 684};
Volume(780) = {779};
Surface Loop(781) = {734, 736, 622, 638, 302, 686};
Volume(782) = {781};
Surface Loop(783) = {736, 738, 624, 640, 304, 688};
Volume(784) = {783};
Surface Loop(785) = {738, 740, 626, 642, 290, 690};
Volume(786) = {785};
Surface Loop(787) = {740, 742, 628, 644, 292, 692};
Volume(788) = {787};
Surface Loop(789) = {742, 744, 630, 646, 294, 694};
Volume(790) = {789};
Surface Loop(791) = {744, 730, 632, 648, 296, 696};
Volume(792) = {791};

Surface Loop(793) = {746, 748, 634, 650, 498, 698};
Volume(794) = {793};
Surface Loop(795) = {748, 750, 636, 652, 500, 700};
Volume(796) = {795};
Surface Loop(797) = {750, 752, 638, 654, 502, 702};
Volume(798) = {797};
Surface Loop(799) = {752, 754, 640, 656, 504, 704};
Volume(800) = {799};
Surface Loop(801) = {754, 756, 642, 658, 490, 706};
Volume(802) = {801};
Surface Loop(803) = {756, 758, 644, 660, 492, 708};
Volume(804) = {803};
Surface Loop(805) = {758, 760, 646, 662, 494, 710};
Volume(806) = {805};
Surface Loop(807) = {760, 746, 648, 664, 496, 712};
Volume(808) = {807};

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24};
Physical Surface(2) = {402, 404, 406, 408, 410, 412, 414, 416,
                       418, 420, 422, 424, 426, 428, 430, 432,
                       434, 436, 438, 440, 658, 660, 662, 664,
                       650, 652, 654, 656, 674, 676, 678, 680,
                       666, 668, 670, 672, 690, 692, 694, 696,
                       682, 684, 686, 688, 706, 708, 710, 712,
                       698, 700, 702, 704};
Physical Surface(3) = {26, 28, 30, 32, 34, 36, 38, 40,
                       602, 604, 606, 608, 610, 612, 614, 616};

Physical Volume(1) = {170, 172, 174, 176, 178, 180, 182, 184, 
                      186, 188, 190, 192, 194, 196, 198, 200, 
                      202, 204, 206, 208, 530, 532, 534, 536, 
                      538, 540, 542, 544, 546, 548, 550, 552, 
                      554, 556, 558, 560, 562, 564, 566, 568,
                      762, 764, 766, 768, 770, 772, 774, 776,
                      778, 780, 782, 784, 786, 788, 790, 792,
                      794, 796, 798, 800, 802, 804, 806, 808};
Physical Volume(2) = {330, 332, 334, 336, 338, 340, 342, 344, 346, 
                      348, 350, 352, 354, 356, 358, 360, 362, 364, 
                      366, 368};

// --------------- //
// Set transfinite //
// --------------- //

numWavesLayer1 = lengthLayer1 / wavelength;
numPoints1 = numElementPerWavelength * numWavesLayer1 + 1;
numWavesLayer2 = (lengthLayer2 - lengthLayer1) / wavelength;
numPoints2 = numElementPerWavelength * numWavesLayer2 + 1;
numWavesLayer3 = (lengthLayer3 - lengthLayer2) / wavelength;
numPoints3 = numElementPerWavelength * numWavesLayer3 + 1;

numPoints4 = numPoints1 * sourceRadius / lengthLayer1;
numPoints5 = numPoints1 * (domainRadius - sourceRadius) / lengthLayer1;
numPoints6 = numPoints1 * (spongeLayerRadius - domainRadius) / lengthLayer1;

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                  13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
                  23, 24, 25, 26, 27, 28, 37, 38, 39, 40,
                  41, 42, 43, 44} = numPoints4;
Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36} = numPoints5;
Transfinite Line {601, 602, 603, 604, 605, 606, 607, 608} = numPoints6;
Transfinite Line {609, 610, 611, 612, 613, 614, 615, 616} = numPoints4;

Transfinite Line {45, 46, 47, 48, 49, 50, 51, 52, 53, 54,
                  55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
                  65, 66, 67, 68, 69, 70, 71, 72, 81, 82,
                  83, 84, 85, 86, 87, 88} = numPoints4;
Transfinite Line {73, 74, 75, 76, 77, 78, 79, 80} = numPoints5;
Transfinite Line {617, 618, 619, 620, 621, 622, 623, 624} = numPoints6;
Transfinite Line {625, 626, 627, 628, 629, 630, 631, 632} = numPoints4;

Transfinite Line {201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 
                  211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 
                  221, 222, 223, 224, 225, 226, 227, 228, 237, 238, 
                  239, 240, 241, 242, 243, 244} = numPoints4;
Transfinite Line {229, 230, 231, 232, 233, 234, 235, 236} = numPoints5;
Transfinite Line {633, 634, 635, 636, 637, 638, 639, 640} = numPoints6;
Transfinite Line {641, 642, 643, 644, 645, 646, 647, 648} = numPoints4;
 
Transfinite Line {401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 
                  411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 
                  421, 422, 423, 424, 425, 426, 427, 428, 437, 438, 
                  439, 440, 441, 442, 443, 444} = numPoints4;
Transfinite Line {429, 430, 431, 432, 433, 434, 435, 436} = numPoints5;
Transfinite Line {649, 650, 651, 652, 653, 654, 655, 656} = numPoints6;
Transfinite Line {657, 658, 659, 660, 661, 662, 663, 664} = numPoints4;

Transfinite Line {89, 90, 91, 92, 93, 94, 95, 96,
                  97, 98, 99, 100, 101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112, 113,
                  665, 666, 667, 668, 669, 670, 671, 672} = numPoints1;
Transfinite Line {245, 246, 247, 248, 249, 250, 251, 252, 253,
                  254, 255, 256, 257, 258, 259, 260, 261, 262,
                  263, 264, 265, 266, 267, 268, 269,
                  673, 674, 675, 676, 677, 678, 679, 680} = numPoints2;
Transfinite Line {445, 446, 447, 448, 449, 450, 451, 452, 453,
                  454, 455, 456, 457, 458, 459, 460, 461, 462,
                  463, 464, 465, 466, 467, 468, 469,
                  681, 682, 683, 684, 685, 686, 687, 688} = numPoints3;
 
Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
