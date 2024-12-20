// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 3D circular planar problem 2
// - structured mesh
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor


// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 15;
domainRadius = 0.035 + numExtraWavelength*wavelength;

numElementPerWavelength = 2.39;
sourceRadius = 0.01;

// ------------------------------------------------------------------------- //
// Volume 1                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer1 = 0.026;

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

lengthLayer2 = lengthLayer1 + 0.004;

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

lengthLayer3 = lengthLayer2 + 0.0015;

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
// Volume 4                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer4 = lengthLayer3 + 0.004;

Point(105) = {0., 0., lengthLayer4, 1.0};
Point(106) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer4, 1.0};
Point(107) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer4, 1.0};
Point(108) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer4, 1.0};
Point(109) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer4, 1.0};
Point(110) = {sourceRadius, 0., lengthLayer4, 1.0};
Point(111) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer4, 1.0};
Point(112) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer4, 1.0};
Point(113) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer4, 1.0};

Point(114) = {domainRadius, 0., lengthLayer4, 1.0};
Point(115) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer4, 1.0};
Point(116) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer4, 1.0};
Point(117) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer4, 1.0};
Point(118) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer4, 1.0};
Point(119) = {domainRadius, 0., lengthLayer4, 1.0};
Point(120) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer4, 1.0};
Point(121) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer4, 1.0};
Point(122) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer4, 1.0};

Point(123) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer4, 1.0};
Point(124) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer4, 1.0};
Point(125) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer4, 1.0};
Point(126) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer4, 1.0};
Point(127) = {sourceRadius / 2, 0., lengthLayer4, 1.0};
Point(128) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer4, 1.0};
Point(129) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer4, 1.0};
Point(130) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer4, 1.0};

Line(601) = {105, 123};
Line(602) = {105, 125};
Line(603) = {105, 127};
Line(604) = {105, 129};
Line(605) = {123, 124};
Line(606) = {124, 125};
Line(607) = {125, 126};
Line(608) = {126, 127};
Line(609) = {127, 128};
Line(610) = {128, 129};
Line(611) = {129, 130};
Line(612) = {130, 123};
Line(613) = {123, 106};
Line(614) = {124, 107};
Line(615) = {125, 108};
Line(616) = {126, 109};
Line(617) = {127, 110};
Line(618) = {128, 111};
Line(619) = {129, 112};
Line(620) = {130, 113};
Circle(621) = {106, 105, 107};
Circle(622) = {107, 105, 108};
Circle(623) = {108, 105, 109};
Circle(624) = {109, 105, 110};
Circle(625) = {110, 105, 111};
Circle(626) = {111, 105, 112};
Circle(627) = {112, 105, 113};
Circle(628) = {113, 105, 106};
Line(629) = {106, 115};
Line(630) = {107, 116};
Line(631) = {108, 117};
Line(632) = {109, 118};
Line(633) = {110, 119};
Line(634) = {111, 120};
Line(635) = {112, 121};
Line(636) = {113, 122};
Circle(637) = {115, 105, 116};
Circle(638) = {116, 105, 117};
Circle(639) = {117, 105, 118};
Circle(640) = {118, 105, 119};
Circle(641) = {119, 105, 120};
Circle(642) = {120, 105, 121};
Circle(643) = {121, 105, 122};
Circle(644) = {122, 105, 115};

Line(645) = {97, 123};
Line(646) = {98, 124};
Line(647) = {99, 125};
Line(648) = {100, 126};
Line(649) = {101, 127};
Line(650) = {102, 128};
Line(651) = {103, 129};
Line(652) = {104, 130};
Line(653) = {80, 106};
Line(654) = {81, 107};
Line(655) = {82, 108};
Line(656) = {83, 109};
Line(657) = {84, 110};
Line(658) = {85, 111};
Line(659) = {86, 112};
Line(660) = {87, 113};
Line(661) = {89, 115};
Line(662) = {90, 116};
Line(663) = {91, 117};
Line(664) = {92, 118};
Line(665) = {93, 119};
Line(666) = {94, 120};
Line(667) = {95, 121};
Line(668) = {96, 122};

Line Loop(601) = {601, 605, 606, -602};
Ruled Surface(602) = {601};
Line Loop(603) = {602, 607, 608, -603};
Ruled Surface(604) = {603};
Line Loop(605) = {603, 609, 610, -604};
Ruled Surface(606) = {605};
Line Loop(607) = {604, 611, 612, -601};
Ruled Surface(608) = {607};
Line Loop(609) = {613, 621, -614, -605};
Ruled Surface(610) = {609};
Line Loop(611) = {614, 622, -615, -606};
Ruled Surface(612) = {611};
Line Loop(613) = {615, 623, -616, -607};
Ruled Surface(614) = {613};
Line Loop(615) = {616, 624, -617, -608};
Ruled Surface(616) = {615};
Line Loop(617) = {617, 625, -618, -609};
Ruled Surface(618) = {617};
Line Loop(619) = {618, 626, -619, -610};
Ruled Surface(620) = {619};
Line Loop(621) = {619, 627, -620, -611};
Ruled Surface(622) = {621};
Line Loop(623) = {620, 628, -613, -612};
Ruled Surface(624) = {623};
Line Loop(625) = {629, 637, -630, -621};
Ruled Surface(626) = {625};
Line Loop(627) = {630, 638, -631, -622};
Ruled Surface(628) = {627};
Line Loop(629) = {631, 639, -632, -623};
Ruled Surface(630) = {629};
Line Loop(631) = {632, 640, -633, -624};
Ruled Surface(632) = {631};
Line Loop(633) = {633, 641, -634, -625};
Ruled Surface(634) = {633};
Line Loop(635) = {634, 642, -635, -626};
Ruled Surface(636) = {635};
Line Loop(637) = {635, 643, -636, -627};
Ruled Surface(638) = {637};
Line Loop(639) = {636, 644, -629, -628};
Ruled Surface(640) = {639};

Line Loop(641) = {405, 646, -605, -645};
Ruled Surface(642) = {641};
Line Loop(643) = {406, 647, -606, -646};
Ruled Surface(644) = {643};
Line Loop(645) = {407, 648, -607, -647};
Ruled Surface(646) = {645};
Line Loop(647) = {408, 649, -608, -648};
Ruled Surface(648) = {647};
Line Loop(649) = {409, 650, -609, -649};
Ruled Surface(650) = {649};
Line Loop(651) = {410, 651, -610, -650};
Ruled Surface(652) = {651};
Line Loop(653) = {411, 652, -611, -651};
Ruled Surface(654) = {653};
Line Loop(655) = {412, 645, -612, -652};
Ruled Surface(656) = {655};

Line Loop(657) = {421, 654, -621, -653};
Ruled Surface(658) = {657};
Line Loop(659) = {422, 655, -622, -654};
Ruled Surface(660) = {659};
Line Loop(661) = {423, 656, -623, -655};
Ruled Surface(662) = {661};
Line Loop(663) = {424, 657, -624, -656};
Ruled Surface(664) = {663};
Line Loop(665) = {425, 658, -625, -657};
Ruled Surface(666) = {665};
Line Loop(667) = {426, 659, -626, -658};
Ruled Surface(668) = {667};
Line Loop(669) = {427, 660, -627, -659};
Ruled Surface(670) = {669};
Line Loop(671) = {428, 653, -628, -660};
Ruled Surface(672) = {671};

Line Loop(673) = {429, 661, -629, -653};
Ruled Surface(674) = {673};
Line Loop(675) = {430, 662, -630, -654};
Ruled Surface(676) = {675};
Line Loop(677) = {431, 663, -631, -655};
Ruled Surface(678) = {677};
Line Loop(679) = {432, 664, -632, -656};
Ruled Surface(680) = {679};
Line Loop(681) = {433, 665, -633, -657};
Ruled Surface(682) = {681};
Line Loop(683) = {434, 666, -634, -658};
Ruled Surface(684) = {683};
Line Loop(685) = {435, 667, -635, -659};
Ruled Surface(686) = {685};
Line Loop(687) = {436, 668, -636, -660};
Ruled Surface(688) = {687};

Line Loop(689) = {437, 662, -637, -661};
Ruled Surface(690) = {689};
Line Loop(691) = {438, 663, -638, -662};
Ruled Surface(692) = {691};
Line Loop(693) = {439, 664, -639, -663};
Ruled Surface(694) = {693};
Line Loop(695) = {440, 665, -640, -664};
Ruled Surface(696) = {695};
Line Loop(697) = {441, 666, -641, -665};
Ruled Surface(698) = {697};
Line Loop(699) = {442, 667, -642, -666};
Ruled Surface(700) = {699};
Line Loop(701) = {443, 668, -643, -667};
Ruled Surface(702) = {701};
Line Loop(703) = {444, 661, -644, -668};
Ruled Surface(704) = {703};

Line(669) = {79, 105};
Line Loop(705) = {401, 645, -601, -669};
Ruled Surface(706) = {705};
Line Loop(707) = {402, 647, -602, -669};
Ruled Surface(708) = {707};
Line Loop(709) = {403, 649, -603, -669};
Ruled Surface(710) = {709};
Line Loop(711) = {404, 651, -604, -669};
Ruled Surface(712) = {711};

Line Loop(713) = {413, 653, -613, -645};
Ruled Surface(714) = {713};
Line Loop(715) = {414, 654, -614, -646};
Ruled Surface(716) = {715};
Line Loop(717) = {415, 655, -615, -647};
Ruled Surface(718) = {717};
Line Loop(719) = {416, 656, -616, -648};
Ruled Surface(720) = {719};
Line Loop(721) = {417, 657, -617, -649};
Ruled Surface(722) = {721};
Line Loop(723) = {418, 658, -618, -650};
Ruled Surface(724) = {723};
Line Loop(725) = {419, 659, -619, -651};
Ruled Surface(726) = {725};
Line Loop(727) = {420, 660, -620, -652};
Ruled Surface(728) = {727};

Surface Loop(729) = {402, 602, 642, 644, 706, 708};
Volume(730) = {729};
Surface Loop(731) = {404, 604, 646, 648, 708, 710};
Volume(732) = {731};
Surface Loop(733) = {406, 606, 650, 652, 710, 712};
Volume(734) = {733};
Surface Loop(735) = {408, 608, 654, 656, 712, 706};
Volume(736) = {735};

Surface Loop(737) = {642, 658, 714, 716, 410, 610};
Volume(738) = {737};
Surface Loop(739) = {644, 660, 716, 718, 412, 612};
Volume(740) = {739};
Surface Loop(741) = {646, 662, 718, 720, 414, 614};
Volume(742) = {741};
Surface Loop(743) = {648, 664, 720, 722, 416, 616};
Volume(744) = {743};
Surface Loop(745) = {650, 666, 722, 724, 418, 618};
Volume(746) = {745};
Surface Loop(747) = {652, 668, 724, 726, 420, 620};
Volume(748) = {747};
Surface Loop(749) = {654, 670, 726, 728, 422, 622};
Volume(750) = {749};
Surface Loop(751) = {656, 672, 728, 714, 424, 624};
Volume(752) = {751};

Surface Loop(753) = {658, 690, 674, 676, 426, 626};
Volume(754) = {753};
Surface Loop(755) = {660, 692, 676, 678, 428, 628};
Volume(756) = {755};
Surface Loop(757) = {662, 694, 678, 680, 430, 630};
Volume(758) = {757};
Surface Loop(759) = {664, 696, 680, 682, 432, 632};
Volume(760) = {759};
Surface Loop(761) = {666, 698, 682, 684, 434, 634};
Volume(762) = {761};
Surface Loop(763) = {668, 700, 684, 686, 436, 636};
Volume(764) = {763};
Surface Loop(765) = {670, 702, 686, 688, 438, 638};
Volume(766) = {765};
Surface Loop(767) = {672, 704, 688, 674, 440, 640};
Volume(768) = {767};

// ------------------------------------------------------------------------- //
// Volume 5                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer5 = lengthLayer4 + 0.001;

Point(131) = {0., 0., lengthLayer5, 1.0};
Point(132) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer5, 1.0};
Point(133) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer5, 1.0};
Point(134) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer5, 1.0};
Point(135) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer5, 1.0};
Point(136) = {sourceRadius, 0., lengthLayer5, 1.0};
Point(137) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer5, 1.0};
Point(138) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer5, 1.0};
Point(139) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer5, 1.0};

Point(140) = {domainRadius, 0., lengthLayer5, 1.0};
Point(141) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer5, 1.0};
Point(142) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer5, 1.0};
Point(143) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer5, 1.0};
Point(144) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer5, 1.0};
Point(145) = {domainRadius, 0., lengthLayer5, 1.0};
Point(146) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer5, 1.0};
Point(147) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer5, 1.0};
Point(148) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer5, 1.0};

Point(149) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer5, 1.0};
Point(150) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer5, 1.0};
Point(151) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer5, 1.0};
Point(152) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer5, 1.0};
Point(153) = {sourceRadius / 2, 0., lengthLayer5, 1.0};
Point(154) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer5, 1.0};
Point(155) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer5, 1.0};
Point(156) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer5, 1.0};

Line(801) = {131, 149};
Line(802) = {131, 151};
Line(803) = {131, 153};
Line(804) = {131, 155};
Line(805) = {149, 150};
Line(806) = {150, 151};
Line(807) = {151, 152};
Line(808) = {152, 153};
Line(809) = {153, 154};
Line(810) = {154, 155};
Line(811) = {155, 156};
Line(812) = {156, 149};
Line(813) = {149, 132};
Line(814) = {150, 133};
Line(815) = {151, 134};
Line(816) = {152, 135};
Line(817) = {153, 136};
Line(818) = {154, 137};
Line(819) = {155, 138};
Line(820) = {156, 139};
Circle(821) = {132, 131, 133};
Circle(822) = {133, 131, 134};
Circle(823) = {134, 131, 135};
Circle(824) = {135, 131, 136};
Circle(825) = {136, 131, 137};
Circle(826) = {137, 131, 138};
Circle(827) = {138, 131, 139};
Circle(828) = {139, 131, 132};
Line(829) = {132, 141};
Line(830) = {133, 142};
Line(831) = {134, 143};
Line(832) = {135, 144};
Line(833) = {136, 145};
Line(834) = {137, 146};
Line(835) = {138, 147};
Line(836) = {139, 148};
Circle(837) = {141, 131, 142};
Circle(838) = {142, 131, 143};
Circle(839) = {143, 131, 144};
Circle(840) = {144, 131, 145};
Circle(841) = {145, 131, 146};
Circle(842) = {146, 131, 147};
Circle(843) = {147, 131, 148};
Circle(844) = {148, 131, 141};

Line(845) = {123, 149};
Line(846) = {124, 150};
Line(847) = {125, 151};
Line(848) = {126, 152};
Line(849) = {127, 153};
Line(850) = {128, 154};
Line(851) = {129, 155};
Line(852) = {130, 156};
Line(853) = {106, 132};
Line(854) = {107, 133};
Line(855) = {108, 134};
Line(856) = {109, 135};
Line(857) = {110, 136};
Line(858) = {111, 137};
Line(859) = {112, 138};
Line(860) = {113, 139};
Line(861) = {115, 141};
Line(862) = {116, 142};
Line(863) = {117, 143};
Line(864) = {118, 144};
Line(865) = {119, 145};
Line(866) = {120, 146};
Line(867) = {121, 147};
Line(868) = {122, 148};

Line Loop(801) = {801, 805, 806, -802};
Ruled Surface(802) = {801};
Line Loop(803) = {802, 807, 808, -803};
Ruled Surface(804) = {803};
Line Loop(805) = {803, 809, 810, -804};
Ruled Surface(806) = {805};
Line Loop(807) = {804, 811, 812, -801};
Ruled Surface(808) = {807};
Line Loop(809) = {813, 821, -814, -805};
Ruled Surface(810) = {809};
Line Loop(811) = {814, 822, -815, -806};
Ruled Surface(812) = {811};
Line Loop(813) = {815, 823, -816, -807};
Ruled Surface(814) = {813};
Line Loop(815) = {816, 824, -817, -808};
Ruled Surface(816) = {815};
Line Loop(817) = {817, 825, -818, -809};
Ruled Surface(818) = {817};
Line Loop(819) = {818, 826, -819, -810};
Ruled Surface(820) = {819};
Line Loop(821) = {819, 827, -820, -811};
Ruled Surface(822) = {821};
Line Loop(823) = {820, 828, -813, -812};
Ruled Surface(824) = {823};
Line Loop(825) = {829, 837, -830, -821};
Ruled Surface(826) = {825};
Line Loop(827) = {830, 838, -831, -822};
Ruled Surface(828) = {827};
Line Loop(829) = {831, 839, -832, -823};
Ruled Surface(830) = {829};
Line Loop(831) = {832, 840, -833, -824};
Ruled Surface(832) = {831};
Line Loop(833) = {833, 841, -834, -825};
Ruled Surface(834) = {833};
Line Loop(835) = {834, 842, -835, -826};
Ruled Surface(836) = {835};
Line Loop(837) = {835, 843, -836, -827};
Ruled Surface(838) = {837};
Line Loop(839) = {836, 844, -829, -828};
Ruled Surface(840) = {839};

Line Loop(841) = {605, 846, -805, -845};
Ruled Surface(842) = {841};
Line Loop(843) = {606, 847, -806, -846};
Ruled Surface(844) = {843};
Line Loop(845) = {607, 848, -807, -847};
Ruled Surface(846) = {845};
Line Loop(847) = {608, 849, -808, -848};
Ruled Surface(848) = {847};
Line Loop(849) = {609, 850, -809, -849};
Ruled Surface(850) = {849};
Line Loop(851) = {610, 851, -810, -850};
Ruled Surface(852) = {851};
Line Loop(853) = {611, 852, -811, -851};
Ruled Surface(854) = {853};
Line Loop(855) = {612, 845, -812, -852};
Ruled Surface(856) = {855};

Line Loop(857) = {621, 854, -821, -853};
Ruled Surface(858) = {857};
Line Loop(859) = {622, 855, -822, -854};
Ruled Surface(860) = {859};
Line Loop(861) = {623, 856, -823, -855};
Ruled Surface(862) = {861};
Line Loop(863) = {624, 857, -824, -856};
Ruled Surface(864) = {863};
Line Loop(865) = {625, 858, -825, -857};
Ruled Surface(866) = {865};
Line Loop(867) = {626, 859, -826, -858};
Ruled Surface(868) = {867};
Line Loop(869) = {627, 860, -827, -859};
Ruled Surface(870) = {869};
Line Loop(871) = {628, 853, -828, -860};
Ruled Surface(872) = {871};

Line Loop(873) = {629, 861, -829, -853};
Ruled Surface(874) = {873};
Line Loop(875) = {630, 862, -830, -854};
Ruled Surface(876) = {875};
Line Loop(877) = {631, 863, -831, -855};
Ruled Surface(878) = {877};
Line Loop(879) = {632, 864, -832, -856};
Ruled Surface(880) = {879};
Line Loop(881) = {633, 865, -833, -857};
Ruled Surface(882) = {881};
Line Loop(883) = {634, 866, -834, -858};
Ruled Surface(884) = {883};
Line Loop(885) = {635, 867, -835, -859};
Ruled Surface(886) = {885};
Line Loop(887) = {636, 868, -836, -860};
Ruled Surface(888) = {887};

Line Loop(889) = {637, 862, -837, -861};
Ruled Surface(890) = {889};
Line Loop(891) = {638, 863, -838, -862};
Ruled Surface(892) = {891};
Line Loop(893) = {639, 864, -839, -863};
Ruled Surface(894) = {893};
Line Loop(895) = {640, 865, -840, -864};
Ruled Surface(896) = {895};
Line Loop(897) = {641, 866, -841, -865};
Ruled Surface(898) = {897};
Line Loop(899) = {642, 867, -842, -866};
Ruled Surface(900) = {899};
Line Loop(901) = {643, 868, -843, -867};
Ruled Surface(902) = {901};
Line Loop(903) = {644, 861, -844, -868};
Ruled Surface(904) = {903};

Line(869) = {105, 131};
Line Loop(905) = {601, 845, -801, -869};
Ruled Surface(906) = {905};
Line Loop(907) = {602, 847, -802, -869};
Ruled Surface(908) = {907};
Line Loop(909) = {603, 849, -803, -869};
Ruled Surface(910) = {909};
Line Loop(911) = {604, 851, -804, -869};
Ruled Surface(912) = {911};

Line Loop(913) = {613, 853, -813, -845};
Ruled Surface(914) = {913};
Line Loop(915) = {614, 854, -814, -846};
Ruled Surface(916) = {915};
Line Loop(917) = {615, 855, -815, -847};
Ruled Surface(918) = {917};
Line Loop(919) = {616, 856, -816, -848};
Ruled Surface(920) = {919};
Line Loop(921) = {617, 857, -817, -849};
Ruled Surface(922) = {921};
Line Loop(923) = {618, 858, -818, -850};
Ruled Surface(924) = {923};
Line Loop(925) = {619, 859, -819, -851};
Ruled Surface(926) = {925};
Line Loop(927) = {620, 860, -820, -852};
Ruled Surface(928) = {927};

Surface Loop(929) = {602, 802, 842, 844, 906, 908};
Volume(930) = {929};
Surface Loop(931) = {604, 804, 846, 848, 908, 910};
Volume(932) = {931};
Surface Loop(933) = {606, 806, 850, 852, 910, 912};
Volume(934) = {933};
Surface Loop(935) = {608, 808, 854, 856, 912, 906};
Volume(936) = {935};

Surface Loop(937) = {842, 858, 914, 916, 610, 810};
Volume(938) = {937};
Surface Loop(939) = {844, 860, 916, 918, 612, 812};
Volume(940) = {939};
Surface Loop(941) = {846, 862, 918, 920, 614, 814};
Volume(942) = {941};
Surface Loop(943) = {848, 864, 920, 922, 616, 816};
Volume(944) = {943};
Surface Loop(945) = {850, 866, 922, 924, 618, 818};
Volume(946) = {945};
Surface Loop(947) = {852, 868, 924, 926, 620, 820};
Volume(948) = {947};
Surface Loop(949) = {854, 870, 926, 928, 622, 822};
Volume(950) = {949};
Surface Loop(951) = {856, 872, 928, 914, 624, 824};
Volume(952) = {951};

Surface Loop(953) = {858, 890, 874, 876, 626, 826};
Volume(954) = {953};
Surface Loop(955) = {860, 892, 876, 878, 628, 828};
Volume(956) = {955};
Surface Loop(957) = {862, 894, 878, 880, 630, 830};
Volume(958) = {957};
Surface Loop(959) = {864, 896, 880, 882, 632, 832};
Volume(960) = {959};
Surface Loop(961) = {866, 898, 882, 884, 634, 834};
Volume(962) = {961};
Surface Loop(963) = {868, 900, 884, 886, 636, 836};
Volume(964) = {963};
Surface Loop(965) = {870, 902, 886, 888, 638, 838};
Volume(966) = {965};
Surface Loop(967) = {872, 904, 888, 874, 640, 840};
Volume(968) = {967};

// ------------------------------------------------------------------------- //
// Volume 6                                                                  //
// ------------------------------------------------------------------------- //

lengthLayer6 = 0.12 + numExtraWavelength*wavelength;

Point(157) = {0., 0., lengthLayer6, 1.0};
Point(158) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), lengthLayer6, 1.0};
Point(159) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), lengthLayer6, 1.0};
Point(160) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), lengthLayer6, 1.0};
Point(161) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), lengthLayer6, 1.0};
Point(162) = {sourceRadius, 0., lengthLayer6, 1.0};
Point(163) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), lengthLayer6, 1.0};
Point(164) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), lengthLayer6, 1.0};
Point(165) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), lengthLayer6, 1.0};

Point(166) = {domainRadius, 0., lengthLayer6, 1.0};
Point(167) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), lengthLayer6, 1.0};
Point(168) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), lengthLayer6, 1.0};
Point(169) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), lengthLayer6, 1.0};
Point(170) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), lengthLayer6, 1.0};
Point(171) = {domainRadius, 0., lengthLayer6, 1.0};
Point(172) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), lengthLayer6, 1.0};
Point(173) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), lengthLayer6, 1.0};
Point(174) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), lengthLayer6, 1.0};

Point(175) = {sourceRadius / 2 * Cos(Pi), sourceRadius / 2 * Sin(Pi), lengthLayer6, 1.0};
Point(176) = {sourceRadius / 2 * Cos(5/4*Pi), sourceRadius / 2 * Sin(5/4*Pi), lengthLayer6, 1.0};
Point(177) = {sourceRadius / 2 * Cos(3/2*Pi), sourceRadius / 2 * Sin(3/2*Pi), lengthLayer6, 1.0};
Point(178) = {sourceRadius / 2 * Cos(7/4*Pi), sourceRadius / 2 * Sin(7/4*Pi), lengthLayer6, 1.0};
Point(179) = {sourceRadius / 2, 0., lengthLayer6, 1.0};
Point(180) = {sourceRadius / 2 * Cos(1/4*Pi), sourceRadius / 2 * Sin(1/4*Pi), lengthLayer6, 1.0};
Point(181) = {sourceRadius / 2 * Cos(1/2*Pi), sourceRadius / 2 * Sin(1/2*Pi), lengthLayer6, 1.0};
Point(182) = {sourceRadius / 2 * Cos(3/4*Pi), sourceRadius / 2 * Sin(3/4*Pi), lengthLayer6, 1.0};

Line(1001) = {157, 175};
Line(1002) = {157, 177};
Line(1003) = {157, 179};
Line(1004) = {157, 181};
Line(1005) = {175, 176};
Line(1006) = {176, 177};
Line(1007) = {177, 178};
Line(1008) = {178, 179};
Line(1009) = {179, 180};
Line(1010) = {180, 181};
Line(1011) = {181, 182};
Line(1012) = {182, 175};
Line(1013) = {175, 158};
Line(1014) = {176, 159};
Line(1015) = {177, 160};
Line(1016) = {178, 161};
Line(1017) = {179, 162};
Line(1018) = {180, 163};
Line(1019) = {181, 164};
Line(1020) = {182, 165};
Circle(1021) = {158, 157, 159};
Circle(1022) = {159, 157, 160};
Circle(1023) = {160, 157, 161};
Circle(1024) = {161, 157, 162};
Circle(1025) = {162, 157, 163};
Circle(1026) = {163, 157, 164};
Circle(1027) = {164, 157, 165};
Circle(1028) = {165, 157, 158};
Line(1029) = {158, 167};
Line(1030) = {159, 168};
Line(1031) = {160, 169};
Line(1032) = {161, 170};
Line(1033) = {162, 171};
Line(1034) = {163, 172};
Line(1035) = {164, 173};
Line(1036) = {165, 174};
Circle(1037) = {167, 157, 168};
Circle(1038) = {168, 157, 169};
Circle(1039) = {169, 157, 170};
Circle(1040) = {170, 157, 171};
Circle(1041) = {171, 157, 172};
Circle(1042) = {172, 157, 173};
Circle(1043) = {173, 157, 174};
Circle(1044) = {174, 157, 167};

Line(1045) = {149, 175};
Line(1046) = {150, 176};
Line(1047) = {151, 177};
Line(1048) = {152, 178};
Line(1049) = {153, 179};
Line(1050) = {154, 180};
Line(1051) = {155, 181};
Line(1052) = {156, 182};
Line(1053) = {132, 158};
Line(1054) = {133, 159};
Line(1055) = {134, 160};
Line(1056) = {135, 161};
Line(1057) = {136, 162};
Line(1058) = {137, 163};
Line(1059) = {138, 164};
Line(1060) = {139, 165};
Line(1061) = {141, 167};
Line(1062) = {142, 168};
Line(1063) = {143, 169};
Line(1064) = {144, 170};
Line(1065) = {145, 171};
Line(1066) = {146, 172};
Line(1067) = {147, 173};
Line(1068) = {148, 174};

Line Loop(1001) = {1001, 1005, 1006, -1002};
Ruled Surface(1002) = {1001};
Line Loop(1003) = {1002, 1007, 1008, -1003};
Ruled Surface(1004) = {1003};
Line Loop(1005) = {1003, 1009, 1010, -1004};
Ruled Surface(1006) = {1005};
Line Loop(1007) = {1004, 1011, 1012, -1001};
Ruled Surface(1008) = {1007};
Line Loop(1009) = {1013, 1021, -1014, -1005};
Ruled Surface(1010) = {1009};
Line Loop(1011) = {1014, 1022, -1015, -1006};
Ruled Surface(1012) = {1011};
Line Loop(1013) = {1015, 1023, -1016, -1007};
Ruled Surface(1014) = {1013};
Line Loop(1015) = {1016, 1024, -1017, -1008};
Ruled Surface(1016) = {1015};
Line Loop(1017) = {1017, 1025, -1018, -1009};
Ruled Surface(1018) = {1017};
Line Loop(1019) = {1018, 1026, -1019, -1010};
Ruled Surface(1020) = {1019};
Line Loop(1021) = {1019, 1027, -1020, -1011};
Ruled Surface(1022) = {1021};
Line Loop(1023) = {1020, 1028, -1013, -1012};
Ruled Surface(1024) = {1023};
Line Loop(1025) = {1029, 1037, -1030, -1021};
Ruled Surface(1026) = {1025};
Line Loop(1027) = {1030, 1038, -1031, -1022};
Ruled Surface(1028) = {1027};
Line Loop(1029) = {1031, 1039, -1032, -1023};
Ruled Surface(1030) = {1029};
Line Loop(1031) = {1032, 1040, -1033, -1024};
Ruled Surface(1032) = {1031};
Line Loop(1033) = {1033, 1041, -1034, -1025};
Ruled Surface(1034) = {1033};
Line Loop(1035) = {1034, 1042, -1035, -1026};
Ruled Surface(1036) = {1035};
Line Loop(1037) = {1035, 1043, -1036, -1027};
Ruled Surface(1038) = {1037};
Line Loop(1039) = {1036, 1044, -1029, -1028};
Ruled Surface(1040) = {1039};

Line Loop(1041) = {805, 1046, -1005, -1045};
Ruled Surface(1042) = {1041};
Line Loop(1043) = {806, 1047, -1006, -1046};
Ruled Surface(1044) = {1043};
Line Loop(1045) = {807, 1048, -1007, -1047};
Ruled Surface(1046) = {1045};
Line Loop(1047) = {808, 1049, -1008, -1048};
Ruled Surface(1048) = {1047};
Line Loop(1049) = {809, 1050, -1009, -1049};
Ruled Surface(1050) = {1049};
Line Loop(1051) = {810, 1051, -1010, -1050};
Ruled Surface(1052) = {1051};
Line Loop(1053) = {811, 1052, -1011, -1051};
Ruled Surface(1054) = {1053};
Line Loop(1055) = {812, 1045, -1012, -1052};
Ruled Surface(1056) = {1055};

Line Loop(1057) = {821, 1054, -1021, -1053};
Ruled Surface(1058) = {1057};
Line Loop(1059) = {822, 1055, -1022, -1054};
Ruled Surface(1060) = {1059};
Line Loop(1061) = {823, 1056, -1023, -1055};
Ruled Surface(1062) = {1061};
Line Loop(1063) = {824, 1057, -1024, -1056};
Ruled Surface(1064) = {1063};
Line Loop(1065) = {825, 1058, -1025, -1057};
Ruled Surface(1066) = {1065};
Line Loop(1067) = {826, 1059, -1026, -1058};
Ruled Surface(1068) = {1067};
Line Loop(1069) = {827, 1060, -1027, -1059};
Ruled Surface(1070) = {1069};
Line Loop(1071) = {828, 1053, -1028, -1060};
Ruled Surface(1072) = {1071};

Line Loop(1073) = {829, 1061, -1029, -1053};
Ruled Surface(1074) = {1073};
Line Loop(1075) = {830, 1062, -1030, -1054};
Ruled Surface(1076) = {1075};
Line Loop(1077) = {831, 1063, -1031, -1055};
Ruled Surface(1078) = {1077};
Line Loop(1079) = {832, 1064, -1032, -1056};
Ruled Surface(1080) = {1079};
Line Loop(1081) = {833, 1065, -1033, -1057};
Ruled Surface(1082) = {1081};
Line Loop(1083) = {834, 1066, -1034, -1058};
Ruled Surface(1084) = {1083};
Line Loop(1085) = {835, 1067, -1035, -1059};
Ruled Surface(1086) = {1085};
Line Loop(1087) = {836, 1068, -1036, -1060};
Ruled Surface(1088) = {1087};

Line Loop(1089) = {837, 1062, -1037, -1061};
Ruled Surface(1090) = {1089};
Line Loop(1091) = {838, 1063, -1038, -1062};
Ruled Surface(1092) = {1091};
Line Loop(1093) = {839, 1064, -1039, -1063};
Ruled Surface(1094) = {1093};
Line Loop(1095) = {840, 1065, -1040, -1064};
Ruled Surface(1096) = {1095};
Line Loop(1097) = {841, 1066, -1041, -1065};
Ruled Surface(1098) = {1097};
Line Loop(1099) = {842, 1067, -1042, -1066};
Ruled Surface(1100) = {1099};
Line Loop(1101) = {843, 1068, -1043, -1067};
Ruled Surface(1102) = {1101};
Line Loop(1103) = {844, 1061, -1044, -1068};
Ruled Surface(1104) = {1103};

Line(1069) = {131, 157};
Line Loop(1105) = {801, 1045, -1001, -1069};
Ruled Surface(1106) = {1105};
Line Loop(1107) = {802, 1047, -1002, -1069};
Ruled Surface(1108) = {1107};
Line Loop(1109) = {803, 1049, -1003, -1069};
Ruled Surface(1110) = {1109};
Line Loop(1111) = {804, 1051, -1004, -1069};
Ruled Surface(1112) = {1111};

Line Loop(1113) = {813, 1053, -1013, -1045};
Ruled Surface(1114) = {1113};
Line Loop(1115) = {814, 1054, -1014, -1046};
Ruled Surface(1116) = {1115};
Line Loop(1117) = {815, 1055, -1015, -1047};
Ruled Surface(1118) = {1117};
Line Loop(1119) = {816, 1056, -1016, -1048};
Ruled Surface(1120) = {1119};
Line Loop(1121) = {817, 1057, -1017, -1049};
Ruled Surface(1122) = {1121};
Line Loop(1123) = {818, 1058, -1018, -1050};
Ruled Surface(1124) = {1123};
Line Loop(1125) = {819, 1059, -1019, -1051};
Ruled Surface(1126) = {1125};
Line Loop(1127) = {820, 1060, -1020, -1052};
Ruled Surface(1128) = {1127};

Surface Loop(1129) = {802, 1002, 1042, 1044, 1106, 1108};
Volume(1130) = {1129};
Surface Loop(1131) = {804, 1004, 1046, 1048, 1108, 1110};
Volume(1132) = {1131};
Surface Loop(1133) = {806, 1006, 1050, 1052, 1110, 1112};
Volume(1134) = {1133};
Surface Loop(1135) = {808, 1008, 1054, 1056, 1112, 1106};
Volume(1136) = {1135};

Surface Loop(1137) = {1042, 1058, 1114, 1116, 810, 1010};
Volume(1138) = {1137};
Surface Loop(1139) = {1044, 1060, 1116, 1118, 812, 1012};
Volume(1140) = {1139};
Surface Loop(1141) = {1046, 1062, 1118, 1120, 814, 1014};
Volume(1142) = {1141};
Surface Loop(1143) = {1048, 1064, 1120, 1122, 816, 1016};
Volume(1144) = {1143};
Surface Loop(1145) = {1050, 1066, 1122, 1124, 818, 1018};
Volume(1146) = {1145};
Surface Loop(1147) = {1052, 1068, 1124, 1126, 820, 1020};
Volume(1148) = {1147};
Surface Loop(1149) = {1054, 1070, 1126, 1128, 822, 1022};
Volume(1150) = {1149};
Surface Loop(1151) = {1056, 1072, 1128, 1114, 824, 1024};
Volume(1152) = {1151};

Surface Loop(1153) = {1058, 1090, 1074, 1076, 826, 1026};
Volume(1154) = {1153};
Surface Loop(1155) = {1060, 1092, 1076, 1078, 828, 1028};
Volume(1156) = {1155};
Surface Loop(1157) = {1062, 1094, 1078, 1080, 830, 1030};
Volume(1158) = {1157};
Surface Loop(1159) = {1064, 1096, 1080, 1082, 832, 1032};
Volume(1160) = {1159};
Surface Loop(1161) = {1066, 1098, 1082, 1084, 834, 1034};
Volume(1162) = {1161};
Surface Loop(1163) = {1068, 1100, 1084, 1086, 836, 1036};
Volume(1164) = {1163};
Surface Loop(1165) = {1070, 1102, 1086, 1088, 838, 1038};
Volume(1166) = {1165};
Surface Loop(1167) = {1072, 1104, 1088, 1074, 840, 1040};
Volume(1168) = {1167};

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24};
Physical Surface(2) = {130, 132, 134, 136, 138, 140, 142, 144,
                       290, 292, 294, 296, 298, 300, 302, 304,
                       490, 492, 494, 496, 498, 500, 502, 504,
                       690, 692, 694, 696, 698, 700, 702, 704,
                       890, 892, 894, 896, 898, 900, 902, 904,
                       1090, 1092, 1094, 1096, 1098, 1100, 1102, 1104,
                       1002, 1004, 1006, 1008,
                       1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024,
                       1026, 1028, 1030, 1032, 1034, 1036, 1038, 1040};
Physical Surface(3) = {26, 28, 30, 32, 34, 36, 38, 40};

Physical Volume(1) = {170, 172, 174, 176, 178, 180, 182, 184, 186,
                      188, 190, 192, 194, 196, 198, 200, 202, 204,
                      206, 208};
Physical Volume(2) = {330, 332, 334, 336, 338, 340, 342, 344, 346,
                      348, 350, 352, 354, 356, 358, 360, 362, 364,
                      366, 368};
Physical Volume(3) = {530, 532, 534, 536, 538, 540, 542, 544, 546,
                      548, 550, 552, 554, 556, 558, 560, 562, 564,
                      566, 568};
Physical Volume(4) = {730, 732, 734, 736, 738, 740, 742, 744, 746,
                      748, 750, 752, 754, 756, 758, 760, 762, 764,
                      766, 768};
Physical Volume(5) = {930, 932, 934, 936, 938, 940, 942, 944, 946,
                      948, 950, 952, 954, 956, 958, 960, 962, 964,
                      966, 968};
Physical Volume(6) = {1130, 1132, 1134, 1136, 1138, 1140, 1142, 1144, 1146,
                      1148, 1150, 1152, 1154, 1156, 1158, 1160, 1162, 1164,
                      1166, 1168};

// --------------- //
// Set transfinite //
// --------------- //

numWavesLayer1 = lengthLayer1 / wavelength;
numPoints1 = numElementPerWavelength * numWavesLayer1 + 1;
numWavesLayer2 = (lengthLayer2 - lengthLayer1) / wavelength;
numPoints2 = numElementPerWavelength * numWavesLayer2 + 1;
numWavesLayer3 = (lengthLayer3 - lengthLayer2) / wavelength;
numPoints3 = numElementPerWavelength * numWavesLayer3 + 1;
numWavesLayer4 = (lengthLayer4 - lengthLayer3) / wavelength;
numPoints4 = numElementPerWavelength * numWavesLayer4 + 1;
numWavesLayer5 = (lengthLayer5 - lengthLayer4) / wavelength;
numPoints5 = numElementPerWavelength * numWavesLayer5 + 1;
numWavesLayer6 = (lengthLayer6 - lengthLayer5) / wavelength;
numPoints6 = numElementPerWavelength * numWavesLayer6 + 1;

numPoints7 = numPoints1 * sourceRadius / lengthLayer1;
numPoints8 = numPoints1 * (domainRadius - sourceRadius) / lengthLayer1;

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                  13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
                  23, 24, 25, 26, 27, 28, 37, 38, 39, 40,
                  41, 42, 43, 44} = numPoints7;
Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36} = numPoints8;

Transfinite Line {45, 46, 47, 48, 49, 50, 51, 52, 53, 54,
                  55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
                  65, 66, 67, 68, 69, 70, 71, 72, 81, 82,
                  83, 84, 85, 86, 87, 88} = numPoints7;
Transfinite Line {73, 74, 75, 76, 77, 78, 79, 80} = numPoints8;

Transfinite Line {201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 
                  211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 
                  221, 222, 223, 224, 225, 226, 227, 228, 237, 238, 
                  239, 240, 241, 242, 243, 244} = numPoints7;
Transfinite Line {229, 230, 231, 232, 233, 234, 235, 236} = numPoints8;

Transfinite Line {401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 
                  411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 
                  421, 422, 423, 424, 425, 426, 427, 428, 437, 438, 
                  439, 440, 441, 442, 443, 444} = numPoints7;
Transfinite Line {429, 430, 431, 432, 433, 434, 435, 436} = numPoints8;

Transfinite Line {601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 
                  611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 
                  621, 622, 623, 624, 625, 626, 627, 628, 637, 638, 
                  639, 640, 641, 642, 643, 644} = numPoints7;
Transfinite Line {629, 630, 631, 632, 633, 634, 635, 636} = numPoints8;

Transfinite Line {801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 
                  811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 
                  821, 822, 823, 824, 825, 826, 827, 828, 837, 838, 
                  839, 840, 841, 842, 843, 844} = numPoints7;
Transfinite Line {829, 830, 831, 832, 833, 834, 835, 836} = numPoints8;

Transfinite Line {1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 
                  1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 
                  1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1037, 1038, 
                  1039, 1040, 1041, 1042, 1043, 1044} = numPoints7;
Transfinite Line {1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036} = numPoints8;

Transfinite Line {89, 90, 91, 92, 93, 94, 95, 96,
                  97, 98, 99, 100, 101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112, 113} = numPoints1;
Transfinite Line {245, 246, 247, 248, 249, 250, 251, 252, 253,
                  254, 255, 256, 257, 258, 259, 260, 261, 262,
                  263, 264, 265, 266, 267, 268, 269} = numPoints2;
Transfinite Line {445, 446, 447, 448, 449, 450, 451, 452, 453,
                  454, 455, 456, 457, 458, 459, 460, 461, 462,
                  463, 464, 465, 466, 467, 468, 469} = numPoints3;
Transfinite Line {645, 646, 647, 648, 649, 650, 651, 652, 653,
                  654, 655, 656, 657, 658, 659, 660, 661, 662,
                  663, 664, 665, 666, 667, 668, 669} = numPoints4;
Transfinite Line {845, 846, 847, 848, 849, 850, 851, 852, 853,
                  854, 855, 856, 857, 858, 859, 860, 861, 862,
                  863, 864, 865, 866, 867, 868, 869} = numPoints5;
Transfinite Line {1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053,
                  1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062,
                  1063, 1064, 1065, 1066, 1067, 1068, 1069} = numPoints6;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
