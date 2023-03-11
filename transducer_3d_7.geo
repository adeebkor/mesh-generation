// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 3D spherical transducer problem
// - structured mesh
// - the bowl shaped is extended
// - 2 different spherical medium (water, cortical bone)
//
// ----------------------------------------------------------------------------
// Copyright (C) 2023 Adeeb Arif Kor

// ---------------------------- //
// Geometry and mesh parameters //
// ---------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 2;
domainLength = 0.12 + numExtraWavelength*wavelength;
domainRadius = 0.035 + numExtraWavelength*wavelength;

numElementPerWavelength = 2.5;

sourceRadius = 0.032;
focalLength = 0.064 + 4.0e-4;

alpha = Asin(sourceRadius / focalLength);

// ------------- //
// Spherical cap //
// ------------- //

Point(1) = {0.0, 0.0, focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(2) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(3) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(4) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(5) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(6) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(7) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(8) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(9) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(10) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(11) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(12) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(13) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(14) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(15) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(16) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(17) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(18) = {0.0, 0.0, 0.6*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(19) = {0.88 * sourceRadius / 2 * Cos(0.00*Pi), 0.88 * sourceRadius / 2 * Sin(0.00*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(20) = {0.88 * sourceRadius / 2 * Cos(0.25*Pi), 0.88 * sourceRadius / 2 * Sin(0.25*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(21) = {0.88 * sourceRadius / 2 * Cos(0.50*Pi), 0.88 * sourceRadius / 2 * Sin(0.50*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(22) = {0.88 * sourceRadius / 2 * Cos(0.75*Pi), 0.88 * sourceRadius / 2 * Sin(0.75*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(23) = {0.88 * sourceRadius / 2 * Cos(1.00*Pi), 0.88 * sourceRadius / 2 * Sin(1.00*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(24) = {0.88 * sourceRadius / 2 * Cos(1.25*Pi), 0.88 * sourceRadius / 2 * Sin(1.25*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(25) = {0.88 * sourceRadius / 2 * Cos(1.50*Pi), 0.88 * sourceRadius / 2 * Sin(1.50*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};
Point(26) = {0.88 * sourceRadius / 2 * Cos(1.75*Pi), 0.88 * sourceRadius / 2 * Sin(1.75*Pi), 0.66*(focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius)), 1.0};

circRadius1 = focalLength - focalLength*Cos(alpha/2);
circRadius2 = focalLength * Sin(alpha/2);

Point(27) = {-circRadius2, 0.0, circRadius1, 1.0};
Point(29) = {0.0, -circRadius2, circRadius1, 1.0};
Point(31) = {circRadius2, 0.0, circRadius1, 1.0};
Point(33) = {0.0, circRadius2, circRadius1, 1.0};

circRadius3 = 1.22 * circRadius1;
circRadius4 = Sqrt(0.5 * (-circRadius3*circRadius3 + 2*focalLength*circRadius3));

Point(28) = {-circRadius4, -circRadius4, circRadius3, 1.0};
Point(30) = {circRadius4, -circRadius4, circRadius3, 1.0};
Point(32) = {circRadius4, circRadius4, circRadius3, 1.0};
Point(34) = {-circRadius4, circRadius4, circRadius3, 1.0};

Point(35) = {0.0, 0.0, 0.0, 1.0};
Point(36) = {0.0, 0.0, focalLength, 1.0};

Line(1) = {14, 13};
Line(2) = {14, 15};
Line(3) = {14, 6};
Line(4) = {7, 15};
Line(5) = {5, 13};
Line(6) = {13, 12};
Line(7) = {15, 16};
Line(8) = {16, 8};
Line(9) = {16, 1};
Line(10) = {1, 14};
Line(11) = {1, 12};
Line(12) = {16, 17};
Line(13) = {17, 10};
Line(14) = {10, 1};
Line(15) = {17, 9};
Line(16) = {10, 2};
Line(17) = {10, 11};
Line(18) = {11, 12};
Line(19) = {12, 4};
Line(20) = {11, 3};
Circle(21) = {6, 1, 5};
Circle(22) = {5, 1, 4};
Circle(23) = {4, 1, 3};
Circle(24) = {3, 1, 2};
Circle(25) = {2, 1, 9};
Circle(26) = {9, 1, 8};
Circle(27) = {8, 1, 7};
Circle(28) = {7, 1, 6};
Line(29) = {18, 23};
Line(30) = {18, 21};
Line(31) = {18, 25};
Line(32) = {18, 19};
Line(33) = {19, 20};
Line(34) = {20, 21};
Line(35) = {21, 22};
Line(36) = {22, 23};
Line(37) = {23, 24};
Line(38) = {24, 25};
Line(39) = {25, 26};
Line(40) = {26, 19};
Line(41) = {26, 17};
Line(42) = {25, 16};
Line(43) = {24, 15};
Line(44) = {23, 14};
Line(45) = {22, 13};
Line(46) = {21, 12};
Line(47) = {20, 11};
Line(48) = {19, 10};
Line(49) = {35, 18};
Line(50) = {25, 29};
Line(51) = {24, 28};
Line(52) = {23, 27};
Line(53) = {22, 34};
Line(54) = {21, 33};
Line(55) = {20, 32};
Line(56) = {19, 31};
Line(57) = {26, 30};
Circle(58) = {4, 36, 33};
Circle(59) = {5, 36, 34};
Circle(60) = {27, 36, 6};
Circle(61) = {28, 36, 7};
Circle(62) = {29, 36, 8};
Circle(63) = {30, 36, 9};
Circle(64) = {31, 36, 2};
Circle(65) = {32, 36, 3};
Circle(66) = {31, 36, 32};
Circle(67) = {32, 36, 33};
Circle(68) = {33, 36, 34};
Circle(69) = {34, 36, 27};
Circle(70) = {27, 36, 28};
Circle(71) = {28, 36, 29};
Circle(72) = {29, 36, 30};
Circle(73) = {30, 36, 31};
Circle(74) = {35, 36, 31};
Circle(75) = {35, 36, 33};
Circle(76) = {35, 36, 27};
Circle(77) = {35, 36, 29};

Line Loop(101) = {18, -11, -14, 17};
Ruled Surface(102) = {101};
Line Loop(103) = {6, -11, 10, 1};
Ruled Surface(104) = {103};
Line Loop(105) = {10, 2, 7, 9};
Ruled Surface(106) = {105};
Line Loop(107) = {14, -9, 12, 13};
Ruled Surface(108) = {107};
Line Loop(109) = {20, 24, -16, 17};
Ruled Surface(110) = {109};
Line Loop(111) = {16, 25, -15, 13};
Ruled Surface(112) = {111};
Line Loop(113) = {15, 26, -8, 12};
Ruled Surface(114) = {113};
Line Loop(115) = {7, 8, 27, 4};
Ruled Surface(116) = {115};
Line Loop(117) = {2, -4, 28, -3};
Ruled Surface(118) = {117};
Line Loop(119) = {3, 21, 5, -1};
Ruled Surface(120) = {119};
Line Loop(121) = {6, 19, -22, 5};
Ruled Surface(122) = {121};
Line Loop(123) = {20, -23, -19, -18};
Ruled Surface(124) = {123};
Line Loop(125) = {40, 48, -13, -41};
Ruled Surface(126) = {125};
Line Loop(127) = {41, -12, -42, 39};
Ruled Surface(128) = {127};
Line Loop(129) = {42, -7, -43, 38};
Ruled Surface(130) = {129};
Line Loop(131) = {43, -2, -44, 37};
Ruled Surface(132) = {131};
Line Loop(133) = {44, 1, -45, 36};
Ruled Surface(134) = {133};
Line Loop(135) = {6, -46, 35, 45};
Ruled Surface(136) = {135};
Line Loop(137) = {18, -46, -34, 47};
Ruled Surface(138) = {137};
Line Loop(139) = {17, -47, -33, 48};
Ruled Surface(140) = {139};
Line Loop(141) = {35, 36, -29, 30};
Ruled Surface(142) = {141};
Line Loop(143) = {29, 37, 38, -31};
Ruled Surface(144) = {143};

Line(78) = {18, 1};

Line Loop(145) = {31, 39, 40, -32};
Ruled Surface(146) = {145};
Line Loop(147) = {30, -34, -33, -32};
Ruled Surface(148) = {147};
Line Loop(149) = {30, 46, -11, -78};
Ruled Surface(150) = {149};
Line Loop(151) = {78, -9, -42, -31};
Ruled Surface(152) = {151};
Line Loop(153) = {44, -10, -78, 29};
Ruled Surface(154) = {153};
Line Loop(155) = {78, -14, -48, -32};
Ruled Surface(156) = {155};
Line Loop(157) = {52, 60, -3, -44};
Ruled Surface(158) = {157};
Line Loop(159) = {59, -53, 45, -5};
Ruled Surface(160) = {159};
Line Loop(161) = {54, -58, -19, -46};
Ruled Surface(162) = {161};
Line Loop(163) = {65, -20, -47, 55};
Ruled Surface(164) = {163};
Line Loop(165) = {64, -16, -48, 56};
Ruled Surface(166) = {165};
Line Loop(167) = {63, -15, -41, 57};
Ruled Surface(168) = {167};
Line Loop(169) = {62, -8, -42, 50};
Ruled Surface(170) = {169};
Line Loop(171) = {51, 61, 4, -43};
Ruled Surface(172) = {171};
Line Loop(173) = {50, 72, -57, -39};
Ruled Surface(174) = {173};
Line Loop(175) = {57, 73, -56, -40};
Ruled Surface(176) = {175};
Line Loop(177) = {55, -66, -56, 33};
Ruled Surface(178) = {177};
Line Loop(179) = {55, 67, -54, -34};
Ruled Surface(180) = {179};
Line Loop(181) = {68, -53, -35, 54};
Ruled Surface(182) = {181};
Line Loop(183) = {69, -52, -36, 53};
Ruled Surface(184) = {183};
Line Loop(185) = {52, 70, -51, -37};
Ruled Surface(186) = {185};
Line Loop(187) = {71, -50, -38, 51};
Ruled Surface(188) = {187};
Line Loop(189) = {70, 61, 28, -60};
Ruled Surface(190) = {189};
Line Loop(191) = {61, -27, -62, -71};
Ruled Surface(192) = {191};
Line Loop(193) = {72, 63, 26, -62};
Ruled Surface(194) = {193};
Line Loop(195) = {63, -25, -64, -73};
Ruled Surface(196) = {195};
Line Loop(197) = {64, -24, -65, -66};
Ruled Surface(198) = {197};
Line Loop(199) = {65, -23, 58, -67};
Ruled Surface(200) = {199};
Line Loop(201) = {68, -59, 22, 58};
Ruled Surface(202) = {201};
Line Loop(203) = {69, 60, 21, 59};
Ruled Surface(204) = {203};
Line Loop(205) = {49, 30, 54, -75};
Ruled Surface(206) = {205};
Line Loop(207) = {49, 29, 52, -76};
Ruled Surface(208) = {207};
Line Loop(209) = {49, 31, 50, -77};
Ruled Surface(210) = {209};
Line Loop(211) = {49, 32, 56, -74};
Ruled Surface(212) = {211};
Line Loop(213) = {77, 72, 73, -74};
Ruled Surface(214) = {213};
Line Loop(215) = {74, 66, 67, -75};
Ruled Surface(216) = {215};
Line Loop(217) = {75, 68, 69, -76};
Ruled Surface(218) = {217};
Line Loop(219) = {77, -71, -70, -76};
Ruled Surface(220) = {219};

Surface Loop(1001) = {156, 126, 128, 152, 146, 108};
Volume(1002) = {1001};
Surface Loop(1003) = {130, 152, 144, 106, 154, 132};
Volume(1004) = {1003};
Surface Loop(1005) = {150, 154, 134, 136, 142, 104};
Volume(1006) = {1005};
Surface Loop(1007) = {140, 156, 150, 138, 148, 102};
Volume(1008) = {1007};
Surface Loop(1009) = {164, 138, 162, 124, 200, 180};
Volume(1010) = {1009};
Surface Loop(1011) = {162, 136, 160, 182, 122, 202};
Volume(1012) = {1011};
Surface Loop(1013) = {160, 134, 158, 120, 204, 184};
Volume(1014) = {1013};
Surface Loop(1015) = {158, 132, 172, 118, 190, 186};
Volume(1016) = {1015};
Surface Loop(1017) = {172, 130, 170, 116, 192, 188};
Volume(1018) = {1017};
Surface Loop(1019) = {170, 114, 194, 128, 174, 168};
Volume(1020) = {1019};
Surface Loop(1021) = {126, 168, 112, 196, 166, 176};
Volume(1022) = {1021};
Surface Loop(1023) = {166, 140, 164, 110, 198, 178};
Volume(1024) = {1023};
Surface Loop(1025) = {212, 178, 180, 206, 148, 216};
Volume(1026) = {1025};
Surface Loop(1027) = {206, 208, 142, 182, 184, 218};
Volume(1028) = {1027};
Surface Loop(1029) = {208, 210, 144, 186, 188, 220};
Volume(1030) = {1029};
Surface Loop(1031) = {210, 212, 174, 146, 176, 214};
Volume(1032) = {1031};

// ===================================== //
// Set transfinite lines (spherical cap) //
// ===================================== //

numPoints1 = 2 * numElementPerWavelength * sourceRadius / 2 / wavelength;

Transfinite Line {78, 41, 42, 43, 44, 45, 46, 47, 48} = numPoints1;
Transfinite Line {58, 59, 60, 61, 62, 63, 64, 65} = numPoints1;

Transfinite Line {9, 10, 11, 14, 39, 30, 31, 32} = numPoints1;
Transfinite Line {1, 2, 7, 12, 13, 17, 18, 6} = numPoints1;
Transfinite Line {33, 34, 35, 36, 37, 38, 39, 40} = numPoints1;
Transfinite Line {21, 22, 23, 24, 25, 26, 27, 28, 29} = numPoints1;
Transfinite Line {66, 67, 68, 69, 70, 71, 72, 73} = numPoints1;
Transfinite Line {74, 75, 76, 77} = numPoints1;

Transfinite Line {49, 56, 16, 57, 15, 50, 8, 51} = numPoints1;
Transfinite Line {4, 52, 3, 53, 5, 54, 19, 55, 20} = numPoints1;


// -------- //
// Volume 1 //
// -------- //

radiusOfCurvature1 = 0.075;
focalPoint1 = 0.03 + radiusOfCurvature1;

Point(37) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1), 1.0};
Point(38) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(39) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(40) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(41) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(42) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(43) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(44) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};
Point(45) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
             1.0};

Point(46) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(47) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(48) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(49) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(50) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(51) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(52) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(53) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
             1.0};

Point(1001) = {0., 0., focalPoint1, 1.0};

Circle(79) = {37, 1001, 46};
Circle(80) = {37, 1001, 48};
Circle(81) = {37, 1001, 50};
Circle(82) = {37, 1001, 52};

Circle(83) = {46, 1001, 47};
Circle(84) = {47, 1001, 48};
Circle(85) = {48, 1001, 49};
Circle(86) = {49, 1001, 50};
Circle(87) = {50, 1001, 51};
Circle(88) = {51, 1001, 52};
Circle(89) = {52, 1001, 53};
Circle(90) = {53, 1001, 46};

Circle(91) = {46, 1001, 38};
Circle(92) = {47, 1001, 39};
Circle(93) = {48, 1001, 40};
Circle(94) = {49, 1001, 41};
Circle(95) = {50, 1001, 42};
Circle(96) = {51, 1001, 43};
Circle(97) = {52, 1001, 44};
Circle(98) = {53, 1001, 45};

Point(1002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius), 1.0};

Circle(99) = {38, 1002, 39};
Circle(100) = {39, 1002, 40};
Circle(101) = {40, 1002, 41};
Circle(102) = {41, 1002, 42};
Circle(103) = {42, 1002, 43};
Circle(104) = {43, 1002, 44};
Circle(105) = {44, 1002, 45};
Circle(106) = {45, 1002, 38};

Line(107) = {14, 46};
Line(108) = {15, 47};
Line(109) = {16, 48};
Line(110) = {17, 49};
Line(111) = {10, 50};
Line(112) = {11, 51};
Line(113) = {12, 52};
Line(114) = {13, 53};

Line(115) = {6, 38};
Line(116) = {7, 39};
Line(117) = {8, 40};
Line(118) = {9, 41};
Line(119) = {2, 42};
Line(120) = {3, 43};
Line(121) = {4, 44};
Line(122) = {5, 45};

Line Loop(301) = {81, 87, 88, -82};
Ruled Surface(302) = {301};
Line Loop(303) = {82, 89, 90, -79};
Ruled Surface(304) = {303};
Line Loop(305) = {79, 83, 84, -80};
Ruled Surface(306) = {305};
Line Loop(307) = {80, 85, 86, -81};
Ruled Surface(308) = {307};

Line Loop(309) = {95, 103, -96, -87};
Ruled Surface(310) = {309};
Line Loop(311) = {96, 104, -97, -88};
Ruled Surface(312) = {311};
Line Loop(313) = {97, 105, -98, -89};
Ruled Surface(314) = {313};
Line Loop(315) = {98, 106, -91, -90};
Ruled Surface(316) = {315};
Line Loop(317) = {91, 99, -92, -83};
Ruled Surface(318) = {317};
Line Loop(319) = {92, 100, -93, -84};
Ruled Surface(320) = {319};
Line Loop(321) = {93, 101, -94, -85};
Ruled Surface(322) = {321};
Line Loop(323) = {94, 102, -95, -86};
Ruled Surface(324) = {323};

Line Loop(325) = {-2, 107, 83, -108};
Ruled Surface(326) = {325};
Line Loop(327) = {-7, 108, 84, -109};
Ruled Surface(328) = {327};
Line Loop(329) = {-12, 109, 85, -110};
Ruled Surface(330) = {329};
Line Loop(331) = {-13, 110, 86, -111};
Ruled Surface(332) = {331};
Line Loop(333) = {-17, 111, 87, -112};
Ruled Surface(334) = {333};
Line Loop(335) = {-18, 112, 88, -113};
Ruled Surface(336) = {335};
Line Loop(337) = {6, 113, 89, -114};
Ruled Surface(338) = {337};
Line Loop(339) = {1, 114, 90, -107};
Ruled Surface(340) = {339};

Line Loop(341) = {3, 115, -91, -107};
Ruled Surface(342) = {341};
Line Loop(343) = {-4, 116, -92, -108};
Ruled Surface(344) = {343};
Line Loop(345) = {8, 117, -93, -109};
Ruled Surface(346) = {345};
Line Loop(347) = {15, 118, -94, -110};
Ruled Surface(348) = {347};
Line Loop(349) = {16, 119, -95, -111};
Ruled Surface(350) = {349};
Line Loop(351) = {20, 120, -96, -112};
Ruled Surface(352) = {351};
Line Loop(353) = {19, 121, -97, -113};
Ruled Surface(354) = {353};
Line Loop(355) = {-5, 122, -98, -114};
Ruled Surface(356) = {355};

Line Loop(357) = {-28, 116, -99, -115};
Ruled Surface(358) = {357};
Line Loop(359) = {-27, 117, -100, -116};
Ruled Surface(360) = {359};
Line Loop(361) = {-26, 118, -101, -117};
Ruled Surface(362) = {361};
Line Loop(363) = {-25, 119, -102, -118};
Ruled Surface(364) = {363};
Line Loop(365) = {-24, 120, -103, -119};
Ruled Surface(366) = {365};
Line Loop(367) = {-23, 121, -104, -120};
Ruled Surface(368) = {367};
Line Loop(369) = {-22, 122, -105, -121};
Ruled Surface(370) = {369};
Line Loop(371) = {-21, 115, -106, -122};
Ruled Surface(372) = {371};

Line(123) = {1, 37};

Line Loop(373) = {10, 107, -79, -123};
Ruled Surface(374) = {373};
Line Loop(375) = {-9, 109, -80, -123};
Ruled Surface(376) = {375};
Line Loop(377) = {-14, 111, -81, -123};
Ruled Surface(378) = {377};
Line Loop(379) = {11, 113, -82, -123};
Ruled Surface(380) = {379};

Surface Loop(2001) = {106, 306, 374, 326, 328, 376};
Volume(2002) = {2001};
Surface Loop(2003) = {108, 308, 376, 330, 332, 378};
Volume(2004) = {2003};
Surface Loop(2005) = {102, 302, 378, 334, 336, 380};
Volume(2006) = {2005};
Surface Loop(2007) = {104, 304, 380, 338, 340, 374};
Volume(2008) = {2007};

Surface Loop(2009) = {118, 318, 342, 358, 344, 326};
Volume(2010) = {2009};
Surface Loop(2011) = {116, 320, 344, 360, 346, 328};
Volume(2012) = {2011};
Surface Loop(2013) = {114, 322, 346, 362, 348, 330};
Volume(2014) = {2013};
Surface Loop(2015) = {112, 324, 348, 364, 350, 332};
Volume(2016) = {2015};
Surface Loop(2017) = {110, 310, 350, 366, 352, 334};
Volume(2018) = {2017};
Surface Loop(2019) = {124, 312, 352, 368, 354, 336};
Volume(2020) = {2019};
Surface Loop(2021) = {122, 314, 354, 370, 356, 338};
Volume(2022) = {2021};
Surface Loop(2023) = {120, 316, 356, 372, 342, 340};
Volume(2024) = {2023};

// ================================ //
// Set transfinite lines (Volume 1) //
// ================================ //

numPoints2 = numElementPerWavelength * 
             (focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius)
              - focalLength + Sqrt(focalLength*focalLength - sourceRadius*sourceRadius))
              / wavelength;

Transfinite Line {123, 107, 108, 109, 110, 111, 112, 113, 114,
                  115, 116, 117, 118, 119, 120, 121, 122} = numPoints2;

Transfinite Line {79, 80, 81, 82,
                  83, 84, 85, 86, 87, 88, 89, 90,
                  99, 100, 101, 102, 103, 104, 105, 106} = numPoints1;

Transfinite Line {91, 92, 93, 94, 95, 96, 97, 98} = numPoints1;

// ------------- //
// Extra layer 1 //
// ------------- //

Point(54) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(55) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(56) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(57) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(58) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(59) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(60) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(61) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};

Point(62) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(63) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(64) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(65) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(66) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(67) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(68) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};
Point(69) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
             1.0};

Circle(124) = {6, 36, 58};
Circle(125) = {7, 36, 59};
Circle(126) = {8, 36, 60};
Circle(127) = {9, 36, 61};
Circle(128) = {2, 36, 54};
Circle(129) = {3, 36, 55};
Circle(130) = {4, 36, 56};
Circle(131) = {5, 36, 57};

Point(70) = {0., 0., focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};

Circle(132) = {58, 70, 59};
Circle(133) = {59, 70, 60};
Circle(134) = {60, 70, 61};
Circle(135) = {61, 70, 54};
Circle(136) = {54, 70, 55};
Circle(137) = {55, 70, 56};
Circle(138) = {56, 70, 57};
Circle(139) = {57, 70, 58};

Circle(140) = {38, 1001, 62};
Circle(141) = {39, 1001, 63};
Circle(142) = {40, 1001, 64};
Circle(143) = {41, 1001, 65};
Circle(144) = {42, 1001, 66};
Circle(145) = {43, 1001, 67};
Circle(146) = {44, 1001, 68};
Circle(147) = {45, 1001, 69};

Point(71) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius), 1.0};

Circle(148) = {62, 71, 63};
Circle(149) = {63, 71, 64};
Circle(150) = {64, 71, 65};
Circle(151) = {65, 71, 66};
Circle(152) = {66, 71, 67};
Circle(153) = {67, 71, 68};
Circle(154) = {68, 71, 69};
Circle(155) = {69, 71, 62};

Line(156) = {58, 62};
Line(157) = {59, 63};
Line(158) = {60, 64};
Line(159) = {61, 65};
Line(160) = {54, 66};
Line(161) = {55, 67};
Line(162) = {56, 68};
Line(163) = {57, 69};

Line Loop(501) = {-28, 125, -132, -124};
Ruled Surface(502) = {501};
Line Loop(503) = {-27, 126, -133, -125};
Ruled Surface(504) = {503};
Line Loop(505) = {-26, 127, -134, -126};
Ruled Surface(506) = {505};
Line Loop(507) = {-25, 128, -135, -127};
Ruled Surface(508) = {507};
Line Loop(509) = {-24, 129, -136, -128};
Ruled Surface(510) = {509};
Line Loop(511) = {-23, 130, -137, -129};
Ruled Surface(512) = {511};
Line Loop(513) = {-22, 131, -138, -130};
Ruled Surface(514) = {513};
Line Loop(515) = {-21, 124, -139, -131};
Ruled Surface(516) = {515};

Line Loop(517) = {99, 141, -148, -140};
Ruled Surface(518) = {517};
Line Loop(519) = {100, 142, -149, -141};
Ruled Surface(520) = {519};
Line Loop(521) = {101, 143, -150, -142};
Ruled Surface(522) = {521};
Line Loop(523) = {102, 144, -151, -143};
Ruled Surface(524) = {523};
Line Loop(525) = {103, 145, -152, -144};
Ruled Surface(526) = {525};
Line Loop(527) = {104, 146, -153, -145};
Ruled Surface(528) = {527};
Line Loop(529) = {105, 147, -154, -146};
Ruled Surface(530) = {529};
Line Loop(531) = {106, 140, -155, -147};
Ruled Surface(532) = {531};

Line Loop(533) = {132, 157, -148, -156};
Ruled Surface(534) = {533};
Line Loop(535) = {133, 158, -149, -157};
Ruled Surface(536) = {535};
Line Loop(537) = {134, 159, -150, -158};
Ruled Surface(538) = {537};
Line Loop(539) = {135, 160, -151, -159};
Ruled Surface(540) = {539};
Line Loop(541) = {136, 161, -152, -160};
Ruled Surface(542) = {541};
Line Loop(543) = {137, 162, -153, -161};
Ruled Surface(544) = {543};
Line Loop(545) = {138, 163, -154, -162};
Ruled Surface(546) = {545};
Line Loop(547) = {139, 156, -155, -163};
Ruled Surface(548) = {547};

Line Loop(549) = {124, 156, -140, -115};
Ruled Surface(550) = {549};
Line Loop(551) = {125, 157, -141, -116};
Ruled Surface(552) = {551};
Line Loop(553) = {126, 158, -142, -117};
Ruled Surface(554) = {553};
Line Loop(555) = {127, 159, -143, -118};
Ruled Surface(556) = {555};
Line Loop(557) = {128, 160, -144, -119};
Ruled Surface(558) = {557};
Line Loop(559) = {129, 161, -145, -120};
Ruled Surface(560) = {559};
Line Loop(561) = {130, 162, -146, -121};
Ruled Surface(562) = {561};
Line Loop(563) = {131, 163, -147, -122};
Ruled Surface(564) = {563};

Surface Loop(3001) = {502, 518, 358, 534, 550, 552};
Volume(3002) = {3001};
Surface Loop(3003) = {504, 520, 360, 536, 552, 554};
Volume(3004) = {3003};
Surface Loop(3005) = {506, 522, 362, 538, 554, 556};
Volume(3006) = {3005};
Surface Loop(3007) = {508, 524, 364, 540, 556, 558};
Volume(3008) = {3007};
Surface Loop(3009) = {510, 526, 366, 542, 558, 560};
Volume(3010) = {3009};
Surface Loop(3011) = {512, 528, 368, 544, 560, 562};
Volume(3012) = {3011};
Surface Loop(3013) = {514, 530, 370, 546, 562, 564};
Volume(3014) = {3013};
Surface Loop(3015) = {516, 532, 372, 548, 564, 550};
Volume(3016) = {3015};

// ===================================== //
// Set transfinite lines (extra layer 1) //
// ===================================== //

numPoints3 = numElementPerWavelength * (domainRadius - sourceRadius) / wavelength;

Transfinite Line {124, 125, 126, 127, 128, 129, 130, 131,
                  140, 141, 142, 143, 144, 145, 146, 147} = numPoints3;
Transfinite Line {156, 157, 158, 159, 160, 161, 162, 163} = numPoints2;
Transfinite Line {132, 133, 134, 135, 136, 137, 138, 139,
                  148, 149, 150, 151, 152, 153, 154, 155} = numPoints1;


// -------- //
// Volume 2 //
// -------- //

radiusOfCurvature2 = 0.0685;

Point(72) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2), 1.0};
Point(73) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(74) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(75) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(76) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(77) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(78) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(79) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};
Point(80) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
             1.0};

Point(81) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(82) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(83) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(84) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(85) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(86) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(87) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};
Point(88) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
             1.0};

Circle(164) = {72, 1001, 81};
Circle(165) = {72, 1001, 83};
Circle(166) = {72, 1001, 85};
Circle(167) = {72, 1001, 87};

Circle(168) = {81, 1001, 82};
Circle(169) = {82, 1001, 83};
Circle(170) = {83, 1001, 84};
Circle(171) = {84, 1001, 85};
Circle(172) = {85, 1001, 86};
Circle(173) = {86, 1001, 87};
Circle(174) = {87, 1001, 88};
Circle(175) = {88, 1001, 81};

Circle(176) = {81, 1001, 73};
Circle(177) = {82, 1001, 74};
Circle(178) = {83, 1001, 75};
Circle(179) = {84, 1001, 76};
Circle(180) = {85, 1001, 77};
Circle(181) = {86, 1001, 78};
Circle(182) = {87, 1001, 79};
Circle(183) = {88, 1001, 80};

Point(1003) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius), 1.0};

Circle(184) = {73, 1003, 74};
Circle(185) = {74, 1003, 75};
Circle(186) = {75, 1003, 76};
Circle(187) = {76, 1003, 77};
Circle(188) = {77, 1003, 78};
Circle(189) = {78, 1003, 79};
Circle(190) = {79, 1003, 80};
Circle(191) = {80, 1003, 73};

Line(192) = {46, 81};
Line(193) = {47, 82};
Line(194) = {48, 83};
Line(195) = {49, 84};
Line(196) = {50, 85};
Line(197) = {51, 86};
Line(198) = {52, 87};
Line(199) = {53, 88};

Line(200) = {38, 73};
Line(201) = {39, 74};
Line(202) = {40, 75};
Line(203) = {41, 76};
Line(204) = {42, 77};
Line(205) = {43, 78};
Line(206) = {44, 79};
Line(207) = {45, 80};

Line Loop(701) = {166, 172, 173, -167};
Ruled Surface(702) = {701};
Line Loop(703) = {167, 174, 175, -164};
Ruled Surface(704) = {703};
Line Loop(705) = {164, 168, 169, -165};
Ruled Surface(706) = {705};
Line Loop(707) = {165, 170, 171, -166};
Ruled Surface(708) = {707};

Line Loop(709) = {180, 188, -181, -172};
Ruled Surface(710) = {709};
Line Loop(711) = {181, 189, -182, -173};
Ruled Surface(712) = {711};
Line Loop(713) = {182, 190, -183, -174};
Ruled Surface(714) = {713};
Line Loop(715) = {183, 191, -176, -175};
Ruled Surface(716) = {715};
Line Loop(717) = {176, 184, -177, -168};
Ruled Surface(718) = {717};
Line Loop(719) = {177, 185, -178, -169};
Ruled Surface(720) = {719};
Line Loop(721) = {178, 186, -179, -170};
Ruled Surface(722) = {721};
Line Loop(723) = {179, 187, -180, -171};
Ruled Surface(724) = {723};

Line Loop(725) = {-83, 192, 168, -193};
Ruled Surface(726) = {725};
Line Loop(727) = {-84, 193, 169, -194};
Ruled Surface(728) = {727};
Line Loop(729) = {-85, 194, 170, -195};
Ruled Surface(730) = {729};
Line Loop(731) = {-86, 195, 171, -196};
Ruled Surface(732) = {731};
Line Loop(733) = {-87, 196, 172, -197};
Ruled Surface(734) = {733};
Line Loop(735) = {-88, 197, 173, -198};
Ruled Surface(736) = {735};
Line Loop(737) = {-89, 198, 174, -199};
Ruled Surface(738) = {737};
Line Loop(739) = {-90, 199, 175, -192};
Ruled Surface(740) = {739};

Line Loop(741) = {91, 200, -176, -192};
Ruled Surface(742) = {741};
Line Loop(743) = {92, 201, -177, -193};
Ruled Surface(744) = {743};
Line Loop(745) = {93, 202, -178, -194};
Ruled Surface(746) = {745};
Line Loop(747) = {94, 203, -179, -195};
Ruled Surface(748) = {747};
Line Loop(749) = {95, 204, -180, -196};
Ruled Surface(750) = {749};
Line Loop(751) = {96, 205, -181, -197};
Ruled Surface(752) = {751};
Line Loop(753) = {97, 206, -182, -198};
Ruled Surface(754) = {753};
Line Loop(755) = {98, 207, -183, -199};
Ruled Surface(756) = {755};

Line Loop(757) = {99, 201, -184, -200};
Ruled Surface(758) = {757};
Line Loop(759) = {100, 202, -185, -201};
Ruled Surface(760) = {759};
Line Loop(761) = {101, 203, -186, -202};
Ruled Surface(762) = {761};
Line Loop(763) = {102, 204, -187, -203};
Ruled Surface(764) = {763};
Line Loop(765) = {103, 205, -188, -204};
Ruled Surface(766) = {765};
Line Loop(767) = {104, 206, -189, -205};
Ruled Surface(768) = {767};
Line Loop(769) = {105, 207, -190, -206};
Ruled Surface(770) = {769};
Line Loop(771) = {106, 200, -191, -207};
Ruled Surface(772) = {771};

Line(208) = {37, 72};

Line Loop(773) = {79, 192, -164, -208};
Ruled Surface(774) = {773};
Line Loop(775) = {80, 194, -165, -208};
Ruled Surface(776) = {775};
Line Loop(777) = {81, 196, -166, -208};
Ruled Surface(778) = {777};
Line Loop(779) = {82, 198, -167, -208};
Ruled Surface(780) = {779};

Surface Loop(4001) = {306, 706, 774, 726, 728, 776};
Volume(4002) = {4001};
Surface Loop(4003) = {308, 708, 776, 730, 732, 778};
Volume(4004) = {4003};
Surface Loop(4005) = {302, 702, 778, 734, 736, 780};
Volume(4006) = {4005};
Surface Loop(4007) = {304, 704, 780, 738, 740, 774};
Volume(4008) = {4007};

Surface Loop(4009) = {318, 718, 742, 758, 744, 726};
Volume(4010) = {4009};
Surface Loop(4011) = {320, 720, 744, 760, 746, 728};
Volume(4012) = {4011};
Surface Loop(4013) = {322, 722, 746, 762, 748, 730};
Volume(4014) = {4013};
Surface Loop(4015) = {324, 724, 748, 764, 750, 732};
Volume(4016) = {4015};
Surface Loop(4017) = {310, 710, 750, 766, 752, 734};
Volume(4018) = {4017};
Surface Loop(4019) = {312, 712, 752, 768, 754, 736};
Volume(4020) = {4019};
Surface Loop(4021) = {314, 714, 754, 770, 756, 738};
Volume(4022) = {4021};
Surface Loop(4023) = {316, 716, 756, 772, 742, 740};
Volume(4024) = {4023};

// ================================ //
// Set transfinite lines (Volume 2) //
// ================================ //

numPoints4 = numElementPerWavelength * 
             (focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2)
              - focalPoint1 + Sqrt(radiusOfCurvature1*radiusOfCurvature1))
             / wavelength;

Transfinite Line {208, 192, 193, 194, 195, 196, 197, 198, 199,
                  200, 201, 202, 203, 204, 205, 206, 207} = numPoints4;

Transfinite Line {164, 165, 166, 167,
                  168, 169, 170, 171, 172, 173, 174, 175,
                  184, 185, 186, 187, 188, 189, 190, 191} = numPoints1;

Transfinite Line {176, 177, 178, 179, 180, 181, 182, 183} = numPoints1; 


// ------------- //
// Extra layer 2 //
// ------------- //

Point(89) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(90) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(91) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(92) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(93) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(94) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(95) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};
Point(96) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
             focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
             1.0};

Circle(209) = {73, 1001, 89};
Circle(210) = {74, 1001, 90};
Circle(211) = {75, 1001, 91};
Circle(212) = {76, 1001, 92};
Circle(213) = {77, 1001, 93};
Circle(214) = {78, 1001, 94};
Circle(215) = {79, 1001, 95};
Circle(216) = {80, 1001, 96};

Point(97) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius), 1.0};

Circle(217) = {89, 97, 90};
Circle(218) = {90, 97, 91};
Circle(219) = {91, 97, 92};
Circle(220) = {92, 97, 93};
Circle(221) = {93, 97, 94};
Circle(222) = {94, 97, 95};
Circle(223) = {95, 97, 96};
Circle(224) = {96, 97, 89};

Line(225) = {62, 89};
Line(226) = {63, 90};
Line(227) = {64, 91};
Line(228) = {65, 92};
Line(229) = {66, 93};
Line(230) = {67, 94};
Line(231) = {68, 95};
Line(232) = {69, 96};

Line Loop(901) = {184, 210, -217, -209};
Ruled Surface(902) = {901};
Line Loop(903) = {185, 211, -218, -210};
Ruled Surface(904) = {903};
Line Loop(905) = {186, 212, -219, -211};
Ruled Surface(906) = {905};
Line Loop(907) = {187, 213, -220, -212};
Ruled Surface(908) = {907};
Line Loop(909) = {188, 214, -221, -213};
Ruled Surface(910) = {909};
Line Loop(911) = {189, 215, -222, -214};
Ruled Surface(912) = {911};
Line Loop(913) = {190, 216, -223, -215};
Ruled Surface(914) = {913};
Line Loop(915) = {191, 209, -224, -216};
Ruled Surface(916) = {915};

Line Loop(933) = {148, 226, -217, -225};
Ruled Surface(934) = {933};
Line Loop(935) = {149, 227, -218, -226};
Ruled Surface(936) = {935};
Line Loop(937) = {150, 228, -219, -227};
Ruled Surface(938) = {937};
Line Loop(939) = {151, 229, -220, -228};
Ruled Surface(940) = {939};
Line Loop(941) = {152, 230, -221, -229};
Ruled Surface(942) = {941};
Line Loop(943) = {153, 231, -222, -230};
Ruled Surface(944) = {943};
Line Loop(945) = {154, 232, -223, -231};
Ruled Surface(946) = {945};
Line Loop(947) = {155, 225, -224, -232};
Ruled Surface(948) = {947};

Line Loop(949) = {140, 225, -209, -200};
Ruled Surface(950) = {949};
Line Loop(951) = {141, 226, -210, -201};
Ruled Surface(952) = {951};
Line Loop(953) = {142, 227, -211, -202};
Ruled Surface(954) = {953};
Line Loop(955) = {143, 228, -212, -203};
Ruled Surface(956) = {955};
Line Loop(957) = {144, 229, -213, -204};
Ruled Surface(958) = {957};
Line Loop(959) = {145, 230, -214, -205};
Ruled Surface(960) = {959};
Line Loop(961) = {146, 231, -215, -206};
Ruled Surface(962) = {961};
Line Loop(963) = {147, 232, -216, -207};
Ruled Surface(964) = {963};

Surface Loop(5001) = {518, 902, 758, 934, 950, 952};
Volume(5002) = {5001};
Surface Loop(5003) = {520, 904, 760, 936, 952, 954};
Volume(5004) = {5003};
Surface Loop(5005) = {522, 906, 762, 938, 954, 956};
Volume(5006) = {5005};
Surface Loop(5007) = {524, 908, 764, 940, 956, 958};
Volume(5008) = {5007};
Surface Loop(5009) = {526, 910, 766, 942, 958, 960};
Volume(5010) = {5009};
Surface Loop(5011) = {528, 912, 768, 944, 960, 962};
Volume(5012) = {5011};
Surface Loop(5013) = {530, 914, 770, 946, 962, 964};
Volume(5014) = {5013};
Surface Loop(5015) = {532, 916, 772, 948, 964, 950};
Volume(5016) = {5015};

// ===================================== //
// Set transfinite lines (extra layer 2) //
// ===================================== //

Transfinite Line {209, 210, 211, 212, 213, 214, 215, 216} = numPoints3;
Transfinite Line {225, 226, 227, 228, 229, 230, 231, 232} = numPoints4;
Transfinite Line {217, 218, 219, 220, 221, 222, 223, 224} = numPoints1;

// -------- //
// Volume 3 //
// -------- //

Point(98) = {0., 0., domainLength, 1.0};
Point(99) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), domainLength, 1.0};
Point(100) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(101) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(102) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(103) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), domainLength, 1.0};
Point(104) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(105) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(106) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(107) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi), domainLength, 1.0};
Point(108) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi), domainLength, 1.0};
Point(109) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi), domainLength, 1.0};
Point(110) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi), domainLength, 1.0};
Point(111) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi), domainLength, 1.0};
Point(112) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi), domainLength, 1.0};
Point(113) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi), domainLength, 1.0};
Point(114) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi), domainLength, 1.0};

Line(233) = {98, 107};
Line(234) = {98, 109};
Line(235) = {98, 111};
Line(236) = {98, 113};

Line(237) = {107, 108};
Line(238) = {108, 109};
Line(239) = {109, 110};
Line(240) = {110, 111};
Line(241) = {111, 112};
Line(242) = {112, 113};
Line(243) = {113, 114};
Line(244) = {114, 107};

Line(245) = {107, 99};
Line(246) = {108, 100};
Line(247) = {109, 101};
Line(248) = {110, 102};
Line(249) = {111, 103};
Line(250) = {112, 104};
Line(251) = {113, 105};
Line(252) = {114, 106};

Circle(253) = {99, 98, 100};
Circle(254) = {100, 98, 101};
Circle(255) = {101, 98, 102};
Circle(256) = {102, 98, 103};
Circle(257) = {103, 98, 104};
Circle(258) = {104, 98, 105};
Circle(259) = {105, 98, 106};
Circle(260) = {106, 98, 99};

Line(261) = {81, 107};
Line(262) = {82, 108};
Line(263) = {83, 109};
Line(264) = {84, 110};
Line(265) = {85, 111};
Line(266) = {86, 112};
Line(267) = {87, 113};
Line(268) = {88, 114};

Line(269) = {73, 99};
Line(270) = {74, 100};
Line(271) = {75, 101};
Line(272) = {76, 102};
Line(273) = {77, 103};
Line(274) = {78, 104};
Line(275) = {79, 105};
Line(276) = {80, 106};

Line Loop(1101) = {235, 241, 242, -236};
Ruled Surface(1102) = {1101};
Line Loop(1103) = {236, 243, 244, -233};
Ruled Surface(1104) = {1103};
Line Loop(1105) = {233, 237, 238, -234};
Ruled Surface(1106) = {1105};
Line Loop(1107) = {234, 239, 240, -235};
Ruled Surface(1108) = {1107};

Line Loop(1109) = {249, 257, -250, -241};
Ruled Surface(1110) = {1109};
Line Loop(1111) = {250, 258, -251, -242};
Ruled Surface(1112) = {1111};
Line Loop(1113) = {251, 259, -252, -243};
Ruled Surface(1114) = {1113};
Line Loop(1115) = {252, 260, -245, -244};
Ruled Surface(1116) = {1115};
Line Loop(1117) = {245, 253, -246, -237};
Ruled Surface(1118) = {1117};
Line Loop(1119) = {246, 254, -247, -238};
Ruled Surface(1120) = {1119};
Line Loop(1121) = {247, 255, -248, -239};
Ruled Surface(1122) = {1121};
Line Loop(1123) = {248, 256, -249, -240};
Ruled Surface(1124) = {1123};

Line Loop(1125) = {-168, 261, 237, -262};
Ruled Surface(1126) = {1125};
Line Loop(1127) = {-169, 262, 238, -263};
Ruled Surface(1128) = {1127};
Line Loop(1129) = {-170, 263, 239, -264};
Ruled Surface(1130) = {1129};
Line Loop(1131) = {-171, 264, 240, -265};
Ruled Surface(1132) = {1131};
Line Loop(1133) = {-172, 265, 241, -266};
Ruled Surface(1134) = {1133};
Line Loop(1135) = {-173, 266, 242, -267};
Ruled Surface(1136) = {1135};
Line Loop(1137) = {-174, 267, 243, -268};
Ruled Surface(1138) = {1137};
Line Loop(1139) = {-175, 268, 244, -261};
Ruled Surface(1140) = {1139};

Line Loop(1141) = {176, 269, -245, -261};
Ruled Surface(1142) = {1141};
Line Loop(1143) = {177, 270, -246, -262};
Ruled Surface(1144) = {1143};
Line Loop(1145) = {178, 271, -247, -263};
Ruled Surface(1146) = {1145};
Line Loop(1147) = {179, 272, -248, -264};
Ruled Surface(1148) = {1147};
Line Loop(1149) = {180, 273, -249, -265};
Ruled Surface(1150) = {1149};
Line Loop(1151) = {181, 274, -250, -266};
Ruled Surface(1152) = {1151};
Line Loop(1153) = {182, 275, -251, -267};
Ruled Surface(1154) = {1153};
Line Loop(1155) = {183, 276, -252, -268};
Ruled Surface(1156) = {1155};

Line Loop(1157) = {184, 270, -253, -269};
Ruled Surface(1158) = {1157};
Line Loop(1159) = {185, 271, -254, -270};
Ruled Surface(1160) = {1159};
Line Loop(1161) = {186, 272, -255, -271};
Ruled Surface(1162) = {1161};
Line Loop(1163) = {187, 273, -256, -272};
Ruled Surface(1164) = {1163};
Line Loop(1165) = {188, 274, -257, -273};
Ruled Surface(1166) = {1165};
Line Loop(1167) = {189, 275, -258, -274};
Ruled Surface(1168) = {1167};
Line Loop(1169) = {190, 276, -259, -275};
Ruled Surface(1170) = {1169};
Line Loop(1171) = {191, 269, -260, -276};
Ruled Surface(1172) = {1171};

Line(277) = {72, 98};

Line Loop(1173) = {164, 261, -233, -277};
Ruled Surface(1174) = {1173};
Line Loop(1175) = {165, 263, -234, -277};
Ruled Surface(1176) = {1175};
Line Loop(1177) = {166, 265, -235, -277};
Ruled Surface(1178) = {1177};
Line Loop(1179) = {167, 267, -236, -277};
Ruled Surface(1180) = {1179};

Surface Loop(6001) = {706, 1106, 1174, 1126, 1128, 1176};
Volume(6002) = {6001};
Surface Loop(6003) = {708, 1108, 1176, 1130, 1132, 1178};
Volume(6004) = {6003};
Surface Loop(6005) = {702, 1102, 1178, 1134, 1136, 1180};
Volume(6006) = {6005};
Surface Loop(6007) = {704, 1104, 1180, 1138, 1140, 1174};
Volume(6008) = {6007};

Surface Loop(6009) = {718, 1118, 1142, 1158, 1144, 1126};
Volume(6010) = {6009};
Surface Loop(6011) = {720, 1120, 1144, 1160, 1146, 1128};
Volume(6012) = {6011};
Surface Loop(6013) = {722, 1122, 1146, 1162, 1148, 1130};
Volume(6014) = {6013};
Surface Loop(6015) = {724, 1124, 1148, 1164, 1150, 1132};
Volume(6016) = {6015};
Surface Loop(6017) = {710, 1110, 1150, 1166, 1152, 1134};
Volume(6018) = {6017};
Surface Loop(6019) = {712, 1112, 1152, 1168, 1154, 1136};
Volume(6020) = {6019};
Surface Loop(6021) = {714, 1114, 1154, 1170, 1156, 1138};
Volume(6022) = {6021};
Surface Loop(6023) = {716, 1116, 1156, 1172, 1142, 1140};
Volume(6024) = {6023};

// ================================ //
// Set transfinite lines (Volume 3) //
// ================================ //

numPoints5 = numElementPerWavelength * 
             (domainLength - 
              focalPoint1 + Sqrt(radiusOfCurvature2*radiusOfCurvature2))
             / wavelength;

Transfinite Line {277, 261, 262, 263, 264, 265, 266, 267, 268,
                  269, 270, 271, 272, 273, 274, 275, 276} = numPoints5;

Transfinite Line {233, 234, 235, 236,
                  237, 238, 239, 240, 241, 242, 243, 244,
                  253, 254, 255, 256, 257, 258, 259, 260} = numPoints1;

Transfinite Line {245, 246, 247, 248, 249, 250, 251, 252} = numPoints1;
                  

// ------------- //
// Extra layer 3 //
// ------------- //

Point(116) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), domainLength, 1.0};
Point(117) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(118) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(119) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(120) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), domainLength, 1.0};
Point(121) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(122) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(123) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), domainLength, 1.0};

Line(278) = {99, 116};
Line(279) = {100, 117};
Line(280) = {101, 118};
Line(281) = {102, 119};
Line(282) = {103, 120};
Line(283) = {104, 121};
Line(284) = {105, 122};
Line(285) = {106, 123};

Circle(286) = {116, 98, 117};
Circle(287) = {117, 98, 118};
Circle(288) = {118, 98, 119};
Circle(289) = {119, 98, 120};
Circle(290) = {120, 98, 121};
Circle(291) = {121, 98, 122};
Circle(292) = {122, 98, 123};
Circle(293) = {123, 98, 116};

Line(294) = {89, 116};
Line(295) = {90, 117};
Line(296) = {91, 118};
Line(297) = {92, 119};
Line(298) = {93, 120};
Line(299) = {94, 121};
Line(300) = {95, 122};
Line(301) = {96, 123};

Line Loop(1301) = {253, 279, -286, -278};
Ruled Surface(1302) = {1301};
Line Loop(1303) = {254, 280, -287, -279};
Ruled Surface(1304) = {1303};
Line Loop(1305) = {255, 281, -288, -280};
Ruled Surface(1306) = {1305};
Line Loop(1307) = {256, 282, -289, -281};
Ruled Surface(1308) = {1307};
Line Loop(1309) = {257, 283, -290, -282};
Ruled Surface(1310) = {1309};
Line Loop(1311) = {258, 284, -291, -283};
Ruled Surface(1312) = {1311};
Line Loop(1313) = {259, 285, -292, -284};
Ruled Surface(1314) = {1313};
Line Loop(1315) = {260, 278, -293, -285};
Ruled Surface(1316) = {1315};

Line Loop(1333) = {217, 295, -286, -294};
Ruled Surface(1334) = {1333};
Line Loop(1335) = {218, 296, -287, -295};
Ruled Surface(1336) = {1335};
Line Loop(1337) = {219, 297, -288, -296};
Ruled Surface(1338) = {1337};
Line Loop(1339) = {220, 298, -289, -297};
Ruled Surface(1340) = {1339};
Line Loop(1341) = {221, 299, -290, -298};
Ruled Surface(1342) = {1341};
Line Loop(1343) = {222, 300, -291, -299};
Ruled Surface(1344) = {1343};
Line Loop(1345) = {223, 301, -292, -300};
Ruled Surface(1346) = {1345};
Line Loop(1347) = {224, 294, -293, -301};
Ruled Surface(1348) = {1347};

Line Loop(1349) = {209, 294, -278, -269};
Ruled Surface(1350) = {1349};
Line Loop(1351) = {210, 295, -279, -270};
Ruled Surface(1352) = {1351};
Line Loop(1353) = {211, 296, -280, -271};
Ruled Surface(1354) = {1353};
Line Loop(1355) = {212, 297, -281, -272};
Ruled Surface(1356) = {1355};
Line Loop(1357) = {213, 298, -282, -273};
Ruled Surface(1358) = {1357};
Line Loop(1359) = {214, 299, -283, -274};
Ruled Surface(1360) = {1359};
Line Loop(1361) = {215, 300, -284, -275};
Ruled Surface(1362) = {1361};
Line Loop(1363) = {216, 301, -285, -276};
Ruled Surface(1364) = {1363};

Surface Loop(7001) = {902, 1302, 1158, 1334, 1350, 1352};
Volume(7002) = {7001};
Surface Loop(7003) = {904, 1304, 1160, 1336, 1352, 1354};
Volume(7004) = {7003};
Surface Loop(7005) = {906, 1306, 1162, 1338, 1354, 1356};
Volume(7006) = {7005};
Surface Loop(7007) = {908, 1308, 1164, 1340, 1356, 1358};
Volume(7008) = {7007};
Surface Loop(7009) = {910, 1310, 1166, 1342, 1358, 1360};
Volume(7010) = {7009};
Surface Loop(7011) = {912, 1312, 1168, 1344, 1360, 1362};
Volume(7012) = {7011};
Surface Loop(7013) = {914, 1314, 1170, 1346, 1362, 1364};
Volume(7014) = {7013};
Surface Loop(7015) = {916, 1316, 1172, 1348, 1364, 1350};
Volume(7016) = {7015};

// ===================================== //
// Set transfinite lines (extra layer 3) //
// ===================================== //

Transfinite Line {278, 279, 280, 281, 282, 283, 284, 285} = numPoints3;
Transfinite Line {294, 295, 296, 297, 298, 299, 300, 301} = numPoints5;
Transfinite Line {286, 287, 288, 289, 290, 291, 292, 293} = numPoints1;

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {214, 216, 218, 220,
                       190, 192, 194, 196, 198, 200, 202, 204};
Physical Surface(2) = {534, 536, 538, 540, 542, 544, 546, 548,
                       934, 936, 938, 940, 942, 944, 946, 948,
                       1334, 1336, 1338, 1340, 1342, 1344, 1346, 1348,
                       1102, 1104, 1106, 1108,
                       1110, 1112, 1114, 1116, 1118, 1120, 1122, 1124,
                       1302, 1304, 1306, 1308, 1310, 1312, 1314, 1316};
Physical Surface(3) = {502, 504, 506, 508, 510, 512, 514, 516};

Physical Volume(1) = {1002, 1004, 1006, 1008,
                      1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024,
                      1026, 1028, 1030, 1032,
                      2002, 2004, 2006, 2008,
                      2010, 2012, 2014, 2016, 2018, 2020, 2022, 2024,
                      3002, 3004, 3006, 3008, 3010, 3012, 3014, 3016,
                      6002, 6004, 6006, 6008,
                      6010, 6012, 6014, 6016, 6018, 6020, 6022, 6024,
                      7002, 7004, 7006, 7008, 7010, 7012, 7014, 7016};
Physical Volume(2) = {4002, 4004, 4006, 4008,
                      4010, 4012, 4014, 4016, 4018, 4020, 4022, 4024,
                      5002, 5004, 5006, 5008, 5010, 5012, 5014, 5016};

// ==================================== //
// Set transfinite surfaces and volumes //
// ==================================== //

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";

