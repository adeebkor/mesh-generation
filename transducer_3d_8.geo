// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 3D spherical transducer problem
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

domainRadius = 0.035 + numExtraWavelength*wavelength;
domainLength = 0.12 + numExtraWavelength*wavelength;

numElementPerWavelength = 2.5;

sourceRadius = 0.032;
focalLength = 0.064;

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

radiusOfCurvature1 = 0.079;
focalPoint1 = 0.026 + radiusOfCurvature1;

Point(101) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1), 1.0};
Point(102) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(103) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(104) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(105) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(106) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(107) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(108) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};
Point(109) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius),
              1.0};

Point(110) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(111) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(112) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(113) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(114) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(115) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(116) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(117) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius/2*sourceRadius/2),
              1.0};

Point(1001) = {0., 0., focalPoint1, 1.0};

Circle(101) = {101, 1001, 110};
Circle(102) = {101, 1001, 112};
Circle(103) = {101, 1001, 114};
Circle(104) = {101, 1001, 116};

Circle(105) = {110, 1001, 111};
Circle(106) = {111, 1001, 112};
Circle(107) = {112, 1001, 113};
Circle(108) = {113, 1001, 114};
Circle(109) = {114, 1001, 115};
Circle(110) = {115, 1001, 116};
Circle(111) = {116, 1001, 117};
Circle(112) = {117, 1001, 110};

Circle(113) = {110, 1001, 102};
Circle(114) = {111, 1001, 103};
Circle(115) = {112, 1001, 104};
Circle(116) = {113, 1001, 105};
Circle(117) = {114, 1001, 106};
Circle(118) = {115, 1001, 107};
Circle(119) = {116, 1001, 108};
Circle(120) = {117, 1001, 109};

Point(1002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - sourceRadius*sourceRadius), 1.0};

Circle(121) = {102, 1002, 103};
Circle(122) = {103, 1002, 104};
Circle(123) = {104, 1002, 105};
Circle(124) = {105, 1002, 106};
Circle(125) = {106, 1002, 107};
Circle(126) = {107, 1002, 108};
Circle(127) = {108, 1002, 109};
Circle(128) = {109, 1002, 102};

Line(129) = {14, 110};
Line(130) = {15, 111};
Line(131) = {16, 112};
Line(132) = {17, 113};
Line(133) = {10, 114};
Line(134) = {11, 115};
Line(135) = {12, 116};
Line(136) = {13, 117};

Line(137) = {6, 102};
Line(138) = {7, 103};
Line(139) = {8, 104};
Line(140) = {9, 105};
Line(141) = {2, 106};
Line(142) = {3, 107};
Line(143) = {4, 108};
Line(144) = {5, 109};

Line Loop(301) = {103, 109, 110, -104};
Ruled Surface(302) = {301};
Line Loop(303) = {104, 111, 112, -101};
Ruled Surface(304) = {303};
Line Loop(305) = {101, 105, 106, -102};
Ruled Surface(306) = {305};
Line Loop(307) = {102, 107, 108, -103};
Ruled Surface(308) = {307};

Line Loop(309) = {117, 125, -118, -109};
Ruled Surface(310) = {309};
Line Loop(311) = {118, 126, -119, -110};
Ruled Surface(312) = {311};
Line Loop(313) = {119, 127, -120, -111};
Ruled Surface(314) = {313};
Line Loop(315) = {120, 128, -113, -112};
Ruled Surface(316) = {315};
Line Loop(317) = {113, 121, -114, -105};
Ruled Surface(318) = {317};
Line Loop(319) = {114, 122, -115, -106};
Ruled Surface(320) = {319};
Line Loop(321) = {115, 123, -116, -107};
Ruled Surface(322) = {321};
Line Loop(323) = {116, 124, -117, -108};
Ruled Surface(324) = {323};

Line Loop(325) = {-2, 129, 105, -130};
Ruled Surface(326) = {325};
Line Loop(327) = {-7, 130, 106, -131};
Ruled Surface(328) = {327};
Line Loop(329) = {-12, 131, 107, -132};
Ruled Surface(330) = {329};
Line Loop(331) = {-13, 132, 108, -133};
Ruled Surface(332) = {331};
Line Loop(333) = {-17, 133, 109, -134};
Ruled Surface(334) = {333};
Line Loop(335) = {-18, 134, 110, -135};
Ruled Surface(336) = {335};
Line Loop(337) = {6, 135, 111, -136};
Ruled Surface(338) = {337};
Line Loop(339) = {1, 136, 112, -129};
Ruled Surface(340) = {339};

Line Loop(341) = {3, 137, -113, -129};
Ruled Surface(342) = {341};
Line Loop(343) = {-4, 138, -114, -130};
Ruled Surface(344) = {343};
Line Loop(345) = {8, 139, -115, -131};
Ruled Surface(346) = {345};
Line Loop(347) = {15, 140, -116, -132};
Ruled Surface(348) = {347};
Line Loop(349) = {16, 141, -117, -133};
Ruled Surface(350) = {349};
Line Loop(351) = {20, 142, -118, -134};
Ruled Surface(352) = {351};
Line Loop(353) = {19, 143, -119, -135};
Ruled Surface(354) = {353};
Line Loop(355) = {-5, 144, -120, -136};
Ruled Surface(356) = {355};

Line Loop(357) = {-28, 138, -121, -137};
Ruled Surface(358) = {357};
Line Loop(359) = {-27, 139, -122, -138};
Ruled Surface(360) = {359};
Line Loop(361) = {-26, 140, -123, -139};
Ruled Surface(362) = {361};
Line Loop(363) = {-25, 141, -124, -140};
Ruled Surface(364) = {363};
Line Loop(365) = {-24, 142, -125, -141};
Ruled Surface(366) = {365};
Line Loop(367) = {-23, 143, -126, -142};
Ruled Surface(368) = {367};
Line Loop(369) = {-22, 144, -127, -143};
Ruled Surface(370) = {369};
Line Loop(371) = {-21, 137, -128, -144};
Ruled Surface(372) = {371};

Line(145) = {1, 101};

Line Loop(373) = {10, 129, -101, -145};
Ruled Surface(374) = {373};
Line Loop(375) = {-9, 131, -102, -145};
Ruled Surface(376) = {375};
Line Loop(377) = {-14, 133, -103, -145};
Ruled Surface(378) = {377};
Line Loop(379) = {11, 135, -104, -145};
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

Transfinite Line {129, 130, 131, 132, 133, 134, 135, 136,
                  137, 138, 139, 140, 141, 142, 143, 144,
                  145} = numPoints2;

Transfinite Line {101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112,
                  121, 122, 123, 124, 125, 126, 127, 128} = numPoints1;

Transfinite Line {113, 114, 115, 116, 117, 118, 119, 120} = numPoints1;

// ------------- //
// Extra layer 1 //
// ------------- //

Point(201) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(202) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(203) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(204) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(205) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(206) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(207) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(208) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};

Point(209) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(210) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(211) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(212) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(213) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(214) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(215) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};
Point(216) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius),
              1.0};

Circle(201) = {6, 36, 205};
Circle(202) = {7, 36, 206};
Circle(203) = {8, 36, 207};
Circle(204) = {9, 36, 208};
Circle(205) = {2, 36, 201};
Circle(206) = {3, 36, 202};
Circle(207) = {4, 36, 203};
Circle(208) = {5, 36, 204};

Point(217) = {0., 0., focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};

Circle(209) = {205, 217, 206};
Circle(210) = {206, 217, 207};
Circle(211) = {207, 217, 208};
Circle(212) = {208, 217, 201};
Circle(213) = {201, 217, 202};
Circle(214) = {202, 217, 203};
Circle(215) = {203, 217, 204};
Circle(216) = {204, 217, 205};

Circle(217) = {102, 1001, 209};
Circle(218) = {103, 1001, 210};
Circle(219) = {104, 1001, 211};
Circle(220) = {105, 1001, 212};
Circle(221) = {106, 1001, 213};
Circle(222) = {107, 1001, 214};
Circle(223) = {108, 1001, 215};
Circle(224) = {109, 1001, 216};

Point(218) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature1*radiusOfCurvature1 - domainRadius*domainRadius), 1.0};

Circle(225) = {209, 218, 210};
Circle(226) = {210, 218, 211};
Circle(227) = {211, 218, 212};
Circle(228) = {212, 218, 213};
Circle(229) = {213, 218, 214};
Circle(230) = {214, 218, 215};
Circle(231) = {215, 218, 216};
Circle(232) = {216, 218, 209};

Line(233) = {205, 209};
Line(234) = {206, 210};
Line(235) = {207, 211};
Line(236) = {208, 212};
Line(237) = {201, 213};
Line(238) = {202, 214};
Line(239) = {203, 215};
Line(240) = {204, 216};

Line Loop(401) = {-28, 202, -209, -201};
Ruled Surface(402) = {401};
Line Loop(403) = {-27, 203, -210, -202};
Ruled Surface(404) = {403};
Line Loop(405) = {-26, 204, -211, -203};
Ruled Surface(406) = {405};
Line Loop(407) = {-25, 205, -212, -204};
Ruled Surface(408) = {407};
Line Loop(409) = {-24, 206, -213, -205};
Ruled Surface(410) = {409};
Line Loop(411) = {-23, 207, -214, -206};
Ruled Surface(412) = {411};
Line Loop(413) = {-22, 208, -215, -207};
Ruled Surface(414) = {413};
Line Loop(415) = {-21, 201, -216, -208};
Ruled Surface(416) = {415};

Line Loop(417) = {121, 218, -225, -217};
Ruled Surface(418) = {417};
Line Loop(419) = {122, 219, -226, -218};
Ruled Surface(420) = {419};
Line Loop(421) = {123, 220, -227, -219};
Ruled Surface(422) = {421};
Line Loop(423) = {124, 221, -228, -220};
Ruled Surface(424) = {423};
Line Loop(425) = {125, 222, -229, -221};
Ruled Surface(426) = {425};
Line Loop(427) = {126, 223, -230, -222};
Ruled Surface(428) = {427};
Line Loop(429) = {127, 224, -231, -223};
Ruled Surface(430) = {429};
Line Loop(431) = {128, 217, -232, -224};
Ruled Surface(432) = {431};

Line Loop(433) = {209, 234, -225, -233};
Ruled Surface(434) = {433};
Line Loop(435) = {210, 235, -226, -234};
Ruled Surface(436) = {435};
Line Loop(437) = {211, 236, -227, -235};
Ruled Surface(438) = {437};
Line Loop(439) = {212, 237, -228, -236};
Ruled Surface(440) = {439};
Line Loop(441) = {213, 238, -229, -237};
Ruled Surface(442) = {441};
Line Loop(443) = {214, 239, -230, -238};
Ruled Surface(444) = {443};
Line Loop(445) = {215, 240, -231, -239};
Ruled Surface(446) = {445};
Line Loop(447) = {216, 233, -232, -240};
Ruled Surface(448) = {447};

Line Loop(449) = {201, 233, -217, -137};
Ruled Surface(450) = {449};
Line Loop(451) = {202, 234, -218, -138};
Ruled Surface(452) = {451};
Line Loop(453) = {203, 235, -219, -139};
Ruled Surface(454) = {453};
Line Loop(455) = {204, 236, -220, -140};
Ruled Surface(456) = {455};
Line Loop(457) = {205, 237, -221, -141};
Ruled Surface(458) = {457};
Line Loop(459) = {206, 238, -222, -142};
Ruled Surface(460) = {459};
Line Loop(461) = {207, 239, -223, -143};
Ruled Surface(462) = {461};
Line Loop(463) = {208, 240, -224, -144};
Ruled Surface(464) = {463};

Surface Loop(3001) = {402, 418, 358, 434, 450, 452};
Volume(3002) = {3001};
Surface Loop(3003) = {404, 420, 360, 436, 452, 454};
Volume(3004) = {3003};
Surface Loop(3005) = {406, 422, 362, 438, 454, 456};
Volume(3006) = {3005};
Surface Loop(3007) = {408, 424, 364, 440, 456, 458};
Volume(3008) = {3007};
Surface Loop(3009) = {410, 426, 366, 442, 458, 460};
Volume(3010) = {3009};
Surface Loop(3011) = {412, 428, 368, 444, 460, 462};
Volume(3012) = {3011};
Surface Loop(3013) = {414, 430, 370, 446, 462, 464};
Volume(3014) = {3013};
Surface Loop(3015) = {416, 432, 372, 448, 464, 450};
Volume(3016) = {3015};

// ===================================== //
// Set transfinite lines (extra layer 1) //
// ===================================== //

numPoints3 = numElementPerWavelength * (domainRadius - sourceRadius) / wavelength;

Transfinite Line {201, 202, 203, 204, 205, 206, 207, 208,
                  217, 218, 219, 220, 221, 222, 223, 224} = numPoints3;
Transfinite Line {233, 234, 235, 236, 237, 238, 239, 240} = numPoints2;
Transfinite Line {209, 210, 211, 212, 213, 214, 215, 216,
                  225, 226, 227, 228, 229, 230, 231, 232} = numPoints1;


// -------- //
// Volume 2 //
// -------- //

radiusOfCurvature2 = 0.075;

Point(301) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2), 1.0};
Point(302) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(303) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(304) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(305) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(306) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(307) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(308) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};
Point(309) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius),
              1.0};

Point(310) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(311) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(312) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(313) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(314) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(315) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(316) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(317) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius/2*sourceRadius/2),
              1.0};

Circle(301) = {301, 1001, 310};
Circle(302) = {301, 1001, 312};
Circle(303) = {301, 1001, 314};
Circle(304) = {301, 1001, 316};

Circle(305) = {310, 1001, 311};
Circle(306) = {311, 1001, 312};
Circle(307) = {312, 1001, 313};
Circle(308) = {313, 1001, 314};
Circle(309) = {314, 1001, 315};
Circle(310) = {315, 1001, 316};
Circle(311) = {316, 1001, 317};
Circle(312) = {317, 1001, 310};

Circle(313) = {310, 1001, 302};
Circle(314) = {311, 1001, 303};
Circle(315) = {312, 1001, 304};
Circle(316) = {313, 1001, 305};
Circle(317) = {314, 1001, 306};
Circle(318) = {315, 1001, 307};
Circle(319) = {316, 1001, 308};
Circle(320) = {317, 1001, 309};

Point(3002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - sourceRadius*sourceRadius), 1.0};

Circle(321) = {302, 3002, 303};
Circle(322) = {303, 3002, 304};
Circle(323) = {304, 3002, 305};
Circle(324) = {305, 3002, 306};
Circle(325) = {306, 3002, 307};
Circle(326) = {307, 3002, 308};
Circle(327) = {308, 3002, 309};
Circle(328) = {309, 3002, 302};

Line(329) = {110, 310};
Line(330) = {111, 311};
Line(331) = {112, 312};
Line(332) = {113, 313};
Line(333) = {114, 314};
Line(334) = {115, 315};
Line(335) = {116, 316};
Line(336) = {117, 317};

Line(337) = {102, 302};
Line(338) = {103, 303};
Line(339) = {104, 304};
Line(340) = {105, 305};
Line(341) = {106, 306};
Line(342) = {107, 307};
Line(343) = {108, 308};
Line(344) = {109, 309};

Line Loop(501) = {303, 309, 310, -304};
Ruled Surface(502) = {501};
Line Loop(503) = {304, 311, 312, -301};
Ruled Surface(504) = {503};
Line Loop(505) = {301, 305, 306, -302};
Ruled Surface(506) = {505};
Line Loop(507) = {302, 307, 308, -303};
Ruled Surface(508) = {507};

Line Loop(509) = {317, 325, -318, -309};
Ruled Surface(510) = {509};
Line Loop(511) = {318, 326, -319, -310};
Ruled Surface(512) = {511};
Line Loop(513) = {319, 327, -320, -311};
Ruled Surface(514) = {513};
Line Loop(515) = {320, 328, -313, -312};
Ruled Surface(516) = {515};
Line Loop(517) = {313, 321, -314, -305};
Ruled Surface(518) = {517};
Line Loop(519) = {314, 322, -315, -306};
Ruled Surface(520) = {519};
Line Loop(521) = {315, 323, -316, -307};
Ruled Surface(522) = {521};
Line Loop(523) = {316, 324, -317, -308};
Ruled Surface(524) = {523};

Line Loop(525) = {-105, 329, 305, -330};
Ruled Surface(526) = {525};
Line Loop(527) = {-106, 330, 306, -331};
Ruled Surface(528) = {527};
Line Loop(529) = {-107, 331, 307, -332};
Ruled Surface(530) = {529};
Line Loop(531) = {-108, 332, 308, -333};
Ruled Surface(532) = {531};
Line Loop(533) = {-109, 333, 309, -334};
Ruled Surface(534) = {533};
Line Loop(535) = {-110, 334, 310, -335};
Ruled Surface(536) = {535};
Line Loop(537) = {-111, 335, 311, -336};
Ruled Surface(538) = {537};
Line Loop(539) = {-112, 336, 312, -329};
Ruled Surface(540) = {539};

Line Loop(541) = {113, 337, -313, -329};
Ruled Surface(542) = {541};
Line Loop(543) = {114, 338, -314, -330};
Ruled Surface(544) = {543};
Line Loop(545) = {115, 339, -315, -331};
Ruled Surface(546) = {545};
Line Loop(547) = {116, 340, -316, -332};
Ruled Surface(548) = {547};
Line Loop(549) = {117, 341, -317, -333};
Ruled Surface(550) = {549};
Line Loop(551) = {118, 342, -318, -334};
Ruled Surface(552) = {551};
Line Loop(553) = {119, 343, -319, -335};
Ruled Surface(554) = {553};
Line Loop(555) = {120, 344, -320, -336};
Ruled Surface(556) = {555};

Line Loop(557) = {121, 338, -321, -337};
Ruled Surface(558) = {557};
Line Loop(559) = {122, 339, -322, -338};
Ruled Surface(560) = {559};
Line Loop(561) = {123, 340, -323, -339};
Ruled Surface(562) = {561};
Line Loop(563) = {124, 341, -324, -340};
Ruled Surface(564) = {563};
Line Loop(565) = {125, 342, -325, -341};
Ruled Surface(566) = {565};
Line Loop(567) = {126, 343, -326, -342};
Ruled Surface(568) = {567};
Line Loop(569) = {127, 344, -327, -343};
Ruled Surface(570) = {569};
Line Loop(571) = {128, 337, -328, -344};
Ruled Surface(572) = {571};

Line(345) = {101, 301};

Line Loop(573) = {101, 329, -301, -345};
Ruled Surface(574) = {573};
Line Loop(575) = {102, 331, -302, -345};
Ruled Surface(576) = {575};
Line Loop(577) = {103, 333, -303, -345};
Ruled Surface(578) = {577};
Line Loop(579) = {104, 335, -304, -345};
Ruled Surface(580) = {579};

Surface Loop(4001) = {306, 506, 574, 526, 528, 576};
Volume(4002) = {4001};
Surface Loop(4003) = {308, 508, 576, 530, 532, 578};
Volume(4004) = {4003};
Surface Loop(4005) = {302, 502, 578, 534, 536, 580};
Volume(4006) = {4005};
Surface Loop(4007) = {304, 504, 580, 538, 540, 574};
Volume(4008) = {4007};

Surface Loop(4009) = {318, 518, 542, 558, 544, 526};
Volume(4010) = {4009};
Surface Loop(4011) = {320, 520, 544, 560, 546, 528};
Volume(4012) = {4011};
Surface Loop(4013) = {322, 522, 546, 562, 548, 530};
Volume(4014) = {4013};
Surface Loop(4015) = {324, 524, 548, 564, 550, 532};
Volume(4016) = {4015};
Surface Loop(4017) = {310, 510, 550, 566, 552, 534};
Volume(4018) = {4017};
Surface Loop(4019) = {312, 512, 552, 568, 554, 536};
Volume(4020) = {4019};
Surface Loop(4021) = {314, 514, 554, 570, 556, 538};
Volume(4022) = {4021};
Surface Loop(4023) = {316, 516, 556, 572, 542, 540};
Volume(4024) = {4023};

// ================================ //
// Set transfinite lines (Volume 2) //
// ================================ //

numPoints4 = numElementPerWavelength * 0.004 / wavelength;

Transfinite Line {329, 330, 331, 332, 333, 334, 335, 336,
                  337, 338, 339, 340, 341, 342, 343, 344,
                  345} = numPoints4;

Transfinite Line {301, 302, 303, 304,
                  305, 306, 307, 308, 309, 310, 311, 312,
                  321, 322, 323, 324, 325, 326, 327, 328} = numPoints1;

Transfinite Line {313, 314, 315, 316, 317, 318, 319, 320} = numPoints1;

// ------------- //
// Extra layer 2 //
// ------------- //

Point(409) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(410) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(411) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(412) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(413) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(414) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(415) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};
Point(416) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius),
              1.0};

Circle(417) = {302, 1001, 409};
Circle(418) = {303, 1001, 410};
Circle(419) = {304, 1001, 411};
Circle(420) = {305, 1001, 412};
Circle(421) = {306, 1001, 413};
Circle(422) = {307, 1001, 414};
Circle(423) = {308, 1001, 415};
Circle(424) = {309, 1001, 416};

Point(418) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature2*radiusOfCurvature2 - domainRadius*domainRadius), 1.0};

Circle(425) = {409, 418, 410};
Circle(426) = {410, 418, 411};
Circle(427) = {411, 418, 412};
Circle(428) = {412, 418, 413};
Circle(429) = {413, 418, 414};
Circle(430) = {414, 418, 415};
Circle(431) = {415, 418, 416};
Circle(432) = {416, 418, 409};

Line(433) = {209, 409};
Line(434) = {210, 410};
Line(435) = {211, 411};
Line(436) = {212, 412};
Line(437) = {213, 413};
Line(438) = {214, 414};
Line(439) = {215, 415};
Line(440) = {216, 416};

Line Loop(617) = {321, 418, -425, -417};
Ruled Surface(618) = {617};
Line Loop(619) = {322, 419, -426, -418};
Ruled Surface(620) = {619};
Line Loop(621) = {323, 420, -427, -419};
Ruled Surface(622) = {621};
Line Loop(623) = {324, 421, -428, -420};
Ruled Surface(624) = {623};
Line Loop(625) = {325, 422, -429, -421};
Ruled Surface(626) = {625};
Line Loop(627) = {326, 423, -430, -422};
Ruled Surface(628) = {627};
Line Loop(629) = {327, 424, -431, -423};
Ruled Surface(630) = {629};
Line Loop(631) = {328, 417, -432, -424};
Ruled Surface(632) = {631};

Line Loop(633) = {225, 434, -425, -433};
Ruled Surface(634) = {633};
Line Loop(635) = {226, 435, -426, -434};
Ruled Surface(636) = {635};
Line Loop(637) = {227, 436, -427, -435};
Ruled Surface(638) = {637};
Line Loop(639) = {228, 437, -428, -436};
Ruled Surface(640) = {639};
Line Loop(641) = {229, 438, -429, -437};
Ruled Surface(642) = {641};
Line Loop(643) = {230, 439, -430, -438};
Ruled Surface(644) = {643};
Line Loop(645) = {231, 440, -431, -439};
Ruled Surface(646) = {645};
Line Loop(647) = {232, 433, -432, -440};
Ruled Surface(648) = {647};

Line Loop(649) = {217, 433, -417, -337};
Ruled Surface(650) = {649};
Line Loop(651) = {218, 434, -418, -338};
Ruled Surface(652) = {651};
Line Loop(653) = {219, 435, -419, -339};
Ruled Surface(654) = {653};
Line Loop(655) = {220, 436, -420, -340};
Ruled Surface(656) = {655};
Line Loop(657) = {221, 437, -421, -341};
Ruled Surface(658) = {657};
Line Loop(659) = {222, 438, -422, -342};
Ruled Surface(660) = {659};
Line Loop(661) = {223, 439, -423, -343};
Ruled Surface(662) = {661};
Line Loop(663) = {224, 440, -424, -344};
Ruled Surface(664) = {663};

Surface Loop(5001) = {418, 618, 558, 634, 650, 652};
Volume(5002) = {5001};
Surface Loop(5003) = {420, 620, 560, 636, 652, 654};
Volume(5004) = {5003};
Surface Loop(5005) = {422, 622, 562, 638, 654, 656};
Volume(5006) = {5005};
Surface Loop(5007) = {424, 624, 564, 640, 656, 658};
Volume(5008) = {5007};
Surface Loop(5009) = {426, 626, 566, 642, 658, 660};
Volume(5010) = {5009};
Surface Loop(5011) = {428, 628, 568, 644, 660, 662};
Volume(5012) = {5011};
Surface Loop(5013) = {430, 630, 570, 646, 662, 664};
Volume(5014) = {5013};
Surface Loop(5015) = {432, 632, 572, 648, 664, 650};
Volume(5016) = {5015};

// ===================================== //
// Set transfinite lines (extra layer 2) //
// ===================================== //

Transfinite Line {417, 418, 419, 420, 421, 422, 423, 424} = numPoints3;
Transfinite Line {433, 434, 435, 436, 437, 438, 439, 440} = numPoints4;
Transfinite Line {425, 426, 427, 428, 429, 430, 431, 432} = numPoints1;

// -------- //
// Volume 3 //
// -------- //

radiusOfCurvature3 = 0.0735;

Point(501) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3), 1.0};
Point(502) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(503) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(504) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(505) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(506) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(507) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(508) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};
Point(509) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius),
              1.0};

Point(510) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(511) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(512) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(513) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(514) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(515) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(516) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(517) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius/2*sourceRadius/2),
              1.0};

Circle(501) = {501, 1001, 510};
Circle(502) = {501, 1001, 512};
Circle(503) = {501, 1001, 514};
Circle(504) = {501, 1001, 516};

Circle(505) = {510, 1001, 511};
Circle(506) = {511, 1001, 512};
Circle(507) = {512, 1001, 513};
Circle(508) = {513, 1001, 514};
Circle(509) = {514, 1001, 515};
Circle(510) = {515, 1001, 516};
Circle(511) = {516, 1001, 517};
Circle(512) = {517, 1001, 510};

Circle(513) = {510, 1001, 502};
Circle(514) = {511, 1001, 503};
Circle(515) = {512, 1001, 504};
Circle(516) = {513, 1001, 505};
Circle(517) = {514, 1001, 506};
Circle(518) = {515, 1001, 507};
Circle(519) = {516, 1001, 508};
Circle(520) = {517, 1001, 509};

Point(5002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - sourceRadius*sourceRadius), 1.0};

Circle(521) = {502, 5002, 503};
Circle(522) = {503, 5002, 504};
Circle(523) = {504, 5002, 505};
Circle(524) = {505, 5002, 506};
Circle(525) = {506, 5002, 507};
Circle(526) = {507, 5002, 508};
Circle(527) = {508, 5002, 509};
Circle(528) = {509, 5002, 502};

Line(529) = {310, 510};
Line(530) = {311, 511};
Line(531) = {312, 512};
Line(532) = {313, 513};
Line(533) = {314, 514};
Line(534) = {315, 515};
Line(535) = {316, 516};
Line(536) = {317, 517};

Line(537) = {302, 502};
Line(538) = {303, 503};
Line(539) = {304, 504};
Line(540) = {305, 505};
Line(541) = {306, 506};
Line(542) = {307, 507};
Line(543) = {308, 508};
Line(544) = {309, 509};

Line Loop(701) = {503, 509, 510, -504};
Ruled Surface(702) = {701};
Line Loop(703) = {504, 511, 512, -501};
Ruled Surface(704) = {703};
Line Loop(705) = {501, 505, 506, -502};
Ruled Surface(706) = {705};
Line Loop(707) = {502, 507, 508, -503};
Ruled Surface(708) = {707};

Line Loop(709) = {517, 525, -518, -509};
Ruled Surface(710) = {709};
Line Loop(711) = {518, 526, -519, -510};
Ruled Surface(712) = {711};
Line Loop(713) = {519, 527, -520, -511};
Ruled Surface(714) = {713};
Line Loop(715) = {520, 528, -513, -512};
Ruled Surface(716) = {715};
Line Loop(717) = {513, 521, -514, -505};
Ruled Surface(718) = {717};
Line Loop(719) = {514, 522, -515, -506};
Ruled Surface(720) = {719};
Line Loop(721) = {515, 523, -516, -507};
Ruled Surface(722) = {721};
Line Loop(723) = {516, 524, -517, -508};
Ruled Surface(724) = {723};

Line Loop(725) = {-305, 529, 505, -530};
Ruled Surface(726) = {725};
Line Loop(727) = {-306, 530, 506, -531};
Ruled Surface(728) = {727};
Line Loop(729) = {-307, 531, 507, -532};
Ruled Surface(730) = {729};
Line Loop(731) = {-308, 532, 508, -533};
Ruled Surface(732) = {731};
Line Loop(733) = {-309, 533, 509, -534};
Ruled Surface(734) = {733};
Line Loop(735) = {-310, 534, 510, -535};
Ruled Surface(736) = {735};
Line Loop(737) = {-311, 535, 511, -536};
Ruled Surface(738) = {737};
Line Loop(739) = {-312, 536, 512, -529};
Ruled Surface(740) = {739};

Line Loop(741) = {313, 537, -513, -529};
Ruled Surface(742) = {741};
Line Loop(743) = {314, 538, -514, -530};
Ruled Surface(744) = {743};
Line Loop(745) = {315, 539, -515, -531};
Ruled Surface(746) = {745};
Line Loop(747) = {316, 540, -516, -532};
Ruled Surface(748) = {747};
Line Loop(749) = {317, 541, -517, -533};
Ruled Surface(750) = {749};
Line Loop(751) = {318, 542, -518, -534};
Ruled Surface(752) = {751};
Line Loop(753) = {319, 543, -519, -535};
Ruled Surface(754) = {753};
Line Loop(755) = {320, 544, -520, -536};
Ruled Surface(756) = {755};

Line Loop(757) = {321, 538, -521, -537};
Ruled Surface(758) = {757};
Line Loop(759) = {322, 539, -522, -538};
Ruled Surface(760) = {759};
Line Loop(761) = {323, 540, -523, -539};
Ruled Surface(762) = {761};
Line Loop(763) = {324, 541, -524, -540};
Ruled Surface(764) = {763};
Line Loop(765) = {325, 542, -525, -541};
Ruled Surface(766) = {765};
Line Loop(767) = {326, 543, -526, -542};
Ruled Surface(768) = {767};
Line Loop(769) = {327, 544, -527, -543};
Ruled Surface(770) = {769};
Line Loop(771) = {328, 537, -528, -544};
Ruled Surface(772) = {771};

Line(545) = {301, 501};

Line Loop(773) = {301, 529, -501, -545};
Ruled Surface(774) = {773};
Line Loop(775) = {302, 531, -502, -545};
Ruled Surface(776) = {775};
Line Loop(777) = {303, 533, -503, -545};
Ruled Surface(778) = {777};
Line Loop(779) = {304, 535, -504, -545};
Ruled Surface(780) = {779};

Surface Loop(6001) = {506, 706, 774, 726, 728, 776};
Volume(6002) = {6001};
Surface Loop(6003) = {508, 708, 776, 730, 732, 778};
Volume(6004) = {6003};
Surface Loop(6005) = {502, 702, 778, 734, 736, 780};
Volume(6006) = {6005};
Surface Loop(6007) = {504, 704, 780, 738, 740, 774};
Volume(6008) = {6007};

Surface Loop(6009) = {518, 718, 742, 758, 744, 726};
Volume(6010) = {6009};
Surface Loop(6011) = {520, 720, 744, 760, 746, 728};
Volume(6012) = {6011};
Surface Loop(6013) = {522, 722, 746, 762, 748, 730};
Volume(6014) = {6013};
Surface Loop(6015) = {524, 724, 748, 764, 750, 732};
Volume(6016) = {6015};
Surface Loop(6017) = {510, 710, 750, 766, 752, 734};
Volume(6018) = {6017};
Surface Loop(6019) = {512, 712, 752, 768, 754, 736};
Volume(6020) = {6019};
Surface Loop(6021) = {514, 714, 754, 770, 756, 738};
Volume(6022) = {6021};
Surface Loop(6023) = {516, 716, 756, 772, 742, 740};
Volume(6024) = {6023};

// ================================ //
// Set transfinite lines (Volume 3) //
// ================================ //

numPoints5 = numElementPerWavelength * 0.0015 / wavelength;

Transfinite Line {529, 530, 531, 532, 533, 534, 535, 536,
                  537, 538, 539, 540, 541, 542, 543, 544,
                  545} = numPoints5;

Transfinite Line {501, 502, 503, 504,
                  505, 506, 507, 508, 509, 510, 511, 512,
                  521, 522, 523, 524, 525, 526, 527, 528} = numPoints1;

Transfinite Line {513, 514, 515, 516, 517, 518, 519, 520} = numPoints1;

// ------------- //
// Extra layer 3 //
// ------------- //

Point(609) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(610) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(611) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(612) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(613) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(614) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(615) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};
Point(616) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius),
              1.0};

Circle(617) = {502, 1001, 609};
Circle(618) = {503, 1001, 610};
Circle(619) = {504, 1001, 611};
Circle(620) = {505, 1001, 612};
Circle(621) = {506, 1001, 613};
Circle(622) = {507, 1001, 614};
Circle(623) = {508, 1001, 615};
Circle(624) = {509, 1001, 616};

Point(618) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature3*radiusOfCurvature3 - domainRadius*domainRadius), 1.0};

Circle(625) = {609, 618, 610};
Circle(626) = {610, 618, 611};
Circle(627) = {611, 618, 612};
Circle(628) = {612, 618, 613};
Circle(629) = {613, 618, 614};
Circle(630) = {614, 618, 615};
Circle(631) = {615, 618, 616};
Circle(632) = {616, 618, 609};

Line(633) = {409, 609};
Line(634) = {410, 610};
Line(635) = {411, 611};
Line(636) = {412, 612};
Line(637) = {413, 613};
Line(638) = {414, 614};
Line(639) = {415, 615};
Line(640) = {416, 616};

Line Loop(817) = {521, 618, -625, -617};
Ruled Surface(818) = {817};
Line Loop(819) = {522, 619, -626, -618};
Ruled Surface(820) = {819};
Line Loop(821) = {523, 620, -627, -619};
Ruled Surface(822) = {821};
Line Loop(823) = {524, 621, -628, -620};
Ruled Surface(824) = {823};
Line Loop(825) = {525, 622, -629, -621};
Ruled Surface(826) = {825};
Line Loop(827) = {526, 623, -630, -622};
Ruled Surface(828) = {827};
Line Loop(829) = {527, 624, -631, -623};
Ruled Surface(830) = {829};
Line Loop(831) = {528, 617, -632, -624};
Ruled Surface(832) = {831};

Line Loop(833) = {425, 634, -625, -633};
Ruled Surface(834) = {833};
Line Loop(835) = {426, 635, -626, -634};
Ruled Surface(836) = {835};
Line Loop(837) = {427, 636, -627, -635};
Ruled Surface(838) = {837};
Line Loop(839) = {428, 637, -628, -636};
Ruled Surface(840) = {839};
Line Loop(841) = {429, 638, -629, -637};
Ruled Surface(842) = {841};
Line Loop(843) = {430, 639, -630, -638};
Ruled Surface(844) = {843};
Line Loop(845) = {431, 640, -631, -639};
Ruled Surface(846) = {845};
Line Loop(847) = {432, 633, -632, -640};
Ruled Surface(848) = {847};

Line Loop(849) = {417, 633, -617, -537};
Ruled Surface(850) = {849};
Line Loop(851) = {418, 634, -618, -538};
Ruled Surface(852) = {851};
Line Loop(853) = {419, 635, -619, -539};
Ruled Surface(854) = {853};
Line Loop(855) = {420, 636, -620, -540};
Ruled Surface(856) = {855};
Line Loop(857) = {421, 637, -621, -541};
Ruled Surface(858) = {857};
Line Loop(859) = {422, 638, -622, -542};
Ruled Surface(860) = {859};
Line Loop(861) = {423, 639, -623, -543};
Ruled Surface(862) = {861};
Line Loop(863) = {424, 640, -624, -544};
Ruled Surface(864) = {863};

Surface Loop(7001) = {618, 818, 758, 834, 850, 852};
Volume(7002) = {7001};
Surface Loop(7003) = {620, 820, 760, 836, 852, 854};
Volume(7004) = {7003};
Surface Loop(7005) = {622, 822, 762, 838, 854, 856};
Volume(7006) = {7005};
Surface Loop(7007) = {624, 824, 764, 840, 856, 858};
Volume(7008) = {7007};
Surface Loop(7009) = {626, 826, 766, 842, 858, 860};
Volume(7010) = {7009};
Surface Loop(7011) = {628, 828, 768, 844, 860, 862};
Volume(7012) = {7011};
Surface Loop(7013) = {630, 830, 770, 846, 862, 864};
Volume(7014) = {7013};
Surface Loop(7015) = {632, 832, 772, 848, 864, 850};
Volume(7016) = {7015};

// ===================================== //
// Set transfinite lines (extra layer 3) //
// ===================================== //

Transfinite Line {617, 618, 619, 620, 621, 622, 623, 624} = numPoints3;
Transfinite Line {633, 634, 635, 636, 637, 638, 639, 640} = numPoints5;
Transfinite Line {625, 626, 627, 628, 629, 630, 631, 632} = numPoints1;

// -------- //
// Volume 4 //
// -------- //

radiusOfCurvature4 = 0.0695;

Point(701) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4), 1.0};
Point(702) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(703) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(704) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(705) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(706) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(707) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(708) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};
Point(709) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius),
              1.0};

Point(710) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(711) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(712) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(713) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(714) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(715) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(716) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(717) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius/2*sourceRadius/2),
              1.0};

Circle(701) = {701, 1001, 710};
Circle(702) = {701, 1001, 712};
Circle(703) = {701, 1001, 714};
Circle(704) = {701, 1001, 716};

Circle(705) = {710, 1001, 711};
Circle(706) = {711, 1001, 712};
Circle(707) = {712, 1001, 713};
Circle(708) = {713, 1001, 714};
Circle(709) = {714, 1001, 715};
Circle(710) = {715, 1001, 716};
Circle(711) = {716, 1001, 717};
Circle(712) = {717, 1001, 710};

Circle(713) = {710, 1001, 702};
Circle(714) = {711, 1001, 703};
Circle(715) = {712, 1001, 704};
Circle(716) = {713, 1001, 705};
Circle(717) = {714, 1001, 706};
Circle(718) = {715, 1001, 707};
Circle(719) = {716, 1001, 708};
Circle(720) = {717, 1001, 709};

Point(7002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - sourceRadius*sourceRadius), 1.0};

Circle(721) = {702, 7002, 703};
Circle(722) = {703, 7002, 704};
Circle(723) = {704, 7002, 705};
Circle(724) = {705, 7002, 706};
Circle(725) = {706, 7002, 707};
Circle(726) = {707, 7002, 708};
Circle(727) = {708, 7002, 709};
Circle(728) = {709, 7002, 702};

Line(729) = {510, 710};
Line(730) = {511, 711};
Line(731) = {512, 712};
Line(732) = {513, 713};
Line(733) = {514, 714};
Line(734) = {515, 715};
Line(735) = {516, 716};
Line(736) = {517, 717};

Line(737) = {502, 702};
Line(738) = {503, 703};
Line(739) = {504, 704};
Line(740) = {505, 705};
Line(741) = {506, 706};
Line(742) = {507, 707};
Line(743) = {508, 708};
Line(744) = {509, 709};

Line Loop(901) = {703, 709, 710, -704};
Ruled Surface(902) = {901};
Line Loop(903) = {704, 711, 712, -701};
Ruled Surface(904) = {903};
Line Loop(905) = {701, 705, 706, -702};
Ruled Surface(906) = {905};
Line Loop(907) = {702, 707, 708, -703};
Ruled Surface(908) = {907};

Line Loop(909) = {717, 725, -718, -709};
Ruled Surface(910) = {909};
Line Loop(911) = {718, 726, -719, -710};
Ruled Surface(912) = {911};
Line Loop(913) = {719, 727, -720, -711};
Ruled Surface(914) = {913};
Line Loop(915) = {720, 728, -713, -712};
Ruled Surface(916) = {915};
Line Loop(917) = {713, 721, -714, -705};
Ruled Surface(918) = {917};
Line Loop(919) = {714, 722, -715, -706};
Ruled Surface(920) = {919};
Line Loop(921) = {715, 723, -716, -707};
Ruled Surface(922) = {921};
Line Loop(923) = {716, 724, -717, -708};
Ruled Surface(924) = {923};

Line Loop(925) = {-505, 729, 705, -730};
Ruled Surface(926) = {925};
Line Loop(927) = {-506, 730, 706, -731};
Ruled Surface(928) = {927};
Line Loop(929) = {-507, 731, 707, -732};
Ruled Surface(930) = {929};
Line Loop(931) = {-508, 732, 708, -733};
Ruled Surface(932) = {931};
Line Loop(933) = {-509, 733, 709, -734};
Ruled Surface(934) = {933};
Line Loop(935) = {-510, 734, 710, -735};
Ruled Surface(936) = {935};
Line Loop(937) = {-511, 735, 711, -736};
Ruled Surface(938) = {937};
Line Loop(939) = {-512, 736, 712, -729};
Ruled Surface(940) = {939};

Line Loop(941) = {513, 737, -713, -729};
Ruled Surface(942) = {941};
Line Loop(943) = {514, 738, -714, -730};
Ruled Surface(944) = {943};
Line Loop(945) = {515, 739, -715, -731};
Ruled Surface(946) = {945};
Line Loop(947) = {516, 740, -716, -732};
Ruled Surface(948) = {947};
Line Loop(949) = {517, 741, -717, -733};
Ruled Surface(950) = {949};
Line Loop(951) = {518, 742, -718, -734};
Ruled Surface(952) = {951};
Line Loop(953) = {519, 743, -719, -735};
Ruled Surface(954) = {953};
Line Loop(955) = {520, 744, -720, -736};
Ruled Surface(956) = {955};

Line Loop(957) = {521, 738, -721, -737};
Ruled Surface(958) = {957};
Line Loop(959) = {522, 739, -722, -738};
Ruled Surface(960) = {959};
Line Loop(961) = {523, 740, -723, -739};
Ruled Surface(962) = {961};
Line Loop(963) = {524, 741, -724, -740};
Ruled Surface(964) = {963};
Line Loop(965) = {525, 742, -725, -741};
Ruled Surface(966) = {965};
Line Loop(967) = {526, 743, -726, -742};
Ruled Surface(968) = {967};
Line Loop(969) = {527, 744, -727, -743};
Ruled Surface(970) = {969};
Line Loop(971) = {528, 737, -728, -744};
Ruled Surface(972) = {971};

Line(745) = {501, 701};

Line Loop(973) = {501, 729, -701, -745};
Ruled Surface(974) = {973};
Line Loop(975) = {502, 731, -702, -745};
Ruled Surface(976) = {975};
Line Loop(977) = {503, 733, -703, -745};
Ruled Surface(978) = {977};
Line Loop(979) = {504, 735, -704, -745};
Ruled Surface(980) = {979};

Surface Loop(8001) = {706, 906, 974, 926, 928, 976};
Volume(8002) = {8001};
Surface Loop(8003) = {708, 908, 976, 930, 932, 978};
Volume(8004) = {8003};
Surface Loop(8005) = {702, 902, 978, 934, 936, 980};
Volume(8006) = {8005};
Surface Loop(8007) = {704, 904, 980, 938, 940, 974};
Volume(8008) = {8007};

Surface Loop(8009) = {718, 918, 942, 958, 944, 926};
Volume(8010) = {8009};
Surface Loop(8011) = {720, 920, 944, 960, 946, 928};
Volume(8012) = {8011};
Surface Loop(8013) = {722, 922, 946, 962, 948, 930};
Volume(8014) = {8013};
Surface Loop(8015) = {724, 924, 948, 964, 950, 932};
Volume(8016) = {8015};
Surface Loop(8017) = {710, 910, 950, 966, 952, 934};
Volume(8018) = {8017};
Surface Loop(8019) = {712, 912, 952, 968, 954, 936};
Volume(8020) = {8019};
Surface Loop(8021) = {714, 914, 954, 970, 956, 938};
Volume(8022) = {8021};
Surface Loop(8023) = {716, 916, 956, 972, 942, 940};
Volume(8024) = {8023};

// ================================ //
// Set transfinite lines (Volume 4) //
// ================================ //

numPoints6 = numElementPerWavelength * 0.004 / wavelength;

Transfinite Line {729, 730, 731, 732, 733, 734, 735, 736,
                  737, 738, 739, 740, 741, 742, 743, 744,
                  745} = numPoints6;

Transfinite Line {701, 702, 703, 704,
                  705, 706, 707, 708, 709, 710, 711, 712,
                  721, 722, 723, 724, 725, 726, 727, 728} = numPoints1;

Transfinite Line {713, 714, 715, 716, 717, 718, 719, 720} = numPoints1;

// ------------- //
// Extra layer 4 //
// ------------- //

Point(809) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(810) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(811) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(812) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(813) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(814) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(815) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};
Point(816) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius),
              1.0};

Circle(817) = {702, 1001, 809};
Circle(818) = {703, 1001, 810};
Circle(819) = {704, 1001, 811};
Circle(820) = {705, 1001, 812};
Circle(821) = {706, 1001, 813};
Circle(822) = {707, 1001, 814};
Circle(823) = {708, 1001, 815};
Circle(824) = {709, 1001, 816};

Point(818) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature4*radiusOfCurvature4 - domainRadius*domainRadius), 1.0};

Circle(825) = {809, 818, 810};
Circle(826) = {810, 818, 811};
Circle(827) = {811, 818, 812};
Circle(828) = {812, 818, 813};
Circle(829) = {813, 818, 814};
Circle(830) = {814, 818, 815};
Circle(831) = {815, 818, 816};
Circle(832) = {816, 818, 809};

Line(833) = {609, 809};
Line(834) = {610, 810};
Line(835) = {611, 811};
Line(836) = {612, 812};
Line(837) = {613, 813};
Line(838) = {614, 814};
Line(839) = {615, 815};
Line(840) = {616, 816};

Line Loop(1017) = {721, 818, -825, -817};
Ruled Surface(1018) = {1017};
Line Loop(1019) = {722, 819, -826, -818};
Ruled Surface(1020) = {1019};
Line Loop(1021) = {723, 820, -827, -819};
Ruled Surface(1022) = {1021};
Line Loop(1023) = {724, 821, -828, -820};
Ruled Surface(1024) = {1023};
Line Loop(1025) = {725, 822, -829, -821};
Ruled Surface(1026) = {1025};
Line Loop(1027) = {726, 823, -830, -822};
Ruled Surface(1028) = {1027};
Line Loop(1029) = {727, 824, -831, -823};
Ruled Surface(1030) = {1029};
Line Loop(1031) = {728, 817, -832, -824};
Ruled Surface(1032) = {1031};

Line Loop(1033) = {625, 834, -825, -833};
Ruled Surface(1034) = {1033};
Line Loop(1035) = {626, 835, -826, -834};
Ruled Surface(1036) = {1035};
Line Loop(1037) = {627, 836, -827, -835};
Ruled Surface(1038) = {1037};
Line Loop(1039) = {628, 837, -828, -836};
Ruled Surface(1040) = {1039};
Line Loop(1041) = {629, 838, -829, -837};
Ruled Surface(1042) = {1041};
Line Loop(1043) = {630, 839, -830, -838};
Ruled Surface(1044) = {1043};
Line Loop(1045) = {631, 840, -831, -839};
Ruled Surface(1046) = {1045};
Line Loop(1047) = {632, 833, -832, -840};
Ruled Surface(1048) = {1047};

Line Loop(1049) = {617, 833, -817, -737};
Ruled Surface(1050) = {1049};
Line Loop(1051) = {618, 834, -818, -738};
Ruled Surface(1052) = {1051};
Line Loop(1053) = {619, 835, -819, -739};
Ruled Surface(1054) = {1053};
Line Loop(1055) = {620, 836, -820, -740};
Ruled Surface(1056) = {1055};
Line Loop(1057) = {621, 837, -821, -741};
Ruled Surface(1058) = {1057};
Line Loop(1059) = {622, 838, -822, -742};
Ruled Surface(1060) = {1059};
Line Loop(1061) = {623, 839, -823, -743};
Ruled Surface(1062) = {1061};
Line Loop(1063) = {624, 840, -824, -744};
Ruled Surface(1064) = {1063};

Surface Loop(9001) = {818, 1018, 958, 1034, 1050, 1052};
Volume(9002) = {9001};
Surface Loop(9003) = {820, 1020, 960, 1036, 1052, 1054};
Volume(9004) = {9003};
Surface Loop(9005) = {822, 1022, 962, 1038, 1054, 1056};
Volume(9006) = {9005};
Surface Loop(9007) = {824, 1024, 964, 1040, 1056, 1058};
Volume(9008) = {9007};
Surface Loop(9009) = {826, 1026, 966, 1042, 1058, 1060};
Volume(9010) = {9009};
Surface Loop(9011) = {828, 1028, 968, 1044, 1060, 1062};
Volume(9012) = {9011};
Surface Loop(9013) = {830, 1030, 970, 1046, 1062, 1064};
Volume(9014) = {9013};
Surface Loop(9015) = {832, 1032, 972, 1048, 1064, 1050};
Volume(9016) = {9015};

// ===================================== //
// Set transfinite lines (extra layer 4) //
// ===================================== //

Transfinite Line {817, 818, 819, 820, 821, 822, 823, 824} = numPoints3;
Transfinite Line {833, 834, 835, 836, 837, 838, 839, 840} = numPoints6;
Transfinite Line {825, 826, 827, 828, 829, 830, 831, 832} = numPoints1;

// -------- //
// Volume 5 //
// -------- //

radiusOfCurvature5 = 0.0685;

Point(901) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5), 1.0};
Point(902) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(903) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(904) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(905) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(906) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(907) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(908) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};
Point(909) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius),
              1.0};

Point(910) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(911) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(912) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(913) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(914) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(915) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(916) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};
Point(917) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius/2*sourceRadius/2),
              1.0};

Circle(901) = {901, 1001, 910};
Circle(902) = {901, 1001, 912};
Circle(903) = {901, 1001, 914};
Circle(904) = {901, 1001, 916};

Circle(905) = {910, 1001, 911};
Circle(906) = {911, 1001, 912};
Circle(907) = {912, 1001, 913};
Circle(908) = {913, 1001, 914};
Circle(909) = {914, 1001, 915};
Circle(910) = {915, 1001, 916};
Circle(911) = {916, 1001, 917};
Circle(912) = {917, 1001, 910};

Circle(913) = {910, 1001, 902};
Circle(914) = {911, 1001, 903};
Circle(915) = {912, 1001, 904};
Circle(916) = {913, 1001, 905};
Circle(917) = {914, 1001, 906};
Circle(918) = {915, 1001, 907};
Circle(919) = {916, 1001, 908};
Circle(920) = {917, 1001, 909};

Point(9002) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - sourceRadius*sourceRadius), 1.0};

Circle(921) = {902, 9002, 903};
Circle(922) = {903, 9002, 904};
Circle(923) = {904, 9002, 905};
Circle(924) = {905, 9002, 906};
Circle(925) = {906, 9002, 907};
Circle(926) = {907, 9002, 908};
Circle(927) = {908, 9002, 909};
Circle(928) = {909, 9002, 902};

Line(929) = {710, 910};
Line(930) = {711, 911};
Line(931) = {712, 912};
Line(932) = {713, 913};
Line(933) = {714, 914};
Line(934) = {715, 915};
Line(935) = {716, 916};
Line(936) = {717, 917};

Line(937) = {702, 902};
Line(938) = {703, 903};
Line(939) = {704, 904};
Line(940) = {705, 905};
Line(941) = {706, 906};
Line(942) = {707, 907};
Line(943) = {708, 908};
Line(944) = {709, 909};

Line Loop(1101) = {903, 909, 910, -904};
Ruled Surface(1102) = {1101};
Line Loop(1103) = {904, 911, 912, -901};
Ruled Surface(1104) = {1103};
Line Loop(1105) = {901, 905, 906, -902};
Ruled Surface(1106) = {1105};
Line Loop(1107) = {902, 907, 908, -903};
Ruled Surface(1108) = {1107};

Line Loop(1109) = {917, 925, -918, -909};
Ruled Surface(1110) = {1109};
Line Loop(1111) = {918, 926, -919, -910};
Ruled Surface(1112) = {1111};
Line Loop(1113) = {919, 927, -920, -911};
Ruled Surface(1114) = {1113};
Line Loop(1115) = {920, 928, -913, -912};
Ruled Surface(1116) = {1115};
Line Loop(1117) = {913, 921, -914, -905};
Ruled Surface(1118) = {1117};
Line Loop(1119) = {914, 922, -915, -906};
Ruled Surface(1120) = {1119};
Line Loop(1121) = {915, 923, -916, -907};
Ruled Surface(1122) = {1121};
Line Loop(1123) = {916, 924, -917, -908};
Ruled Surface(1124) = {1123};

Line Loop(1125) = {-705, 929, 905, -930};
Ruled Surface(1126) = {1125};
Line Loop(1127) = {-706, 930, 906, -931};
Ruled Surface(1128) = {1127};
Line Loop(1129) = {-707, 931, 907, -932};
Ruled Surface(1130) = {1129};
Line Loop(1131) = {-708, 932, 908, -933};
Ruled Surface(1132) = {1131};
Line Loop(1133) = {-709, 933, 909, -934};
Ruled Surface(1134) = {1133};
Line Loop(1135) = {-710, 934, 910, -935};
Ruled Surface(1136) = {1135};
Line Loop(1137) = {-711, 935, 911, -936};
Ruled Surface(1138) = {1137};
Line Loop(1139) = {-712, 936, 912, -929};
Ruled Surface(1140) = {1139};

Line Loop(1141) = {713, 937, -913, -929};
Ruled Surface(1142) = {1141};
Line Loop(1143) = {714, 938, -914, -930};
Ruled Surface(1144) = {1143};
Line Loop(1145) = {715, 939, -915, -931};
Ruled Surface(1146) = {1145};
Line Loop(1147) = {716, 940, -916, -932};
Ruled Surface(1148) = {1147};
Line Loop(1149) = {717, 941, -917, -933};
Ruled Surface(1150) = {1149};
Line Loop(1151) = {718, 942, -918, -934};
Ruled Surface(1152) = {1151};
Line Loop(1153) = {719, 943, -919, -935};
Ruled Surface(1154) = {1153};
Line Loop(1155) = {720, 944, -920, -936};
Ruled Surface(1156) = {1155};

Line Loop(1157) = {721, 938, -921, -937};
Ruled Surface(1158) = {1157};
Line Loop(1159) = {722, 939, -922, -938};
Ruled Surface(1160) = {1159};
Line Loop(1161) = {723, 940, -923, -939};
Ruled Surface(1162) = {1161};
Line Loop(1163) = {724, 941, -924, -940};
Ruled Surface(1164) = {1163};
Line Loop(1165) = {725, 942, -925, -941};
Ruled Surface(1166) = {1165};
Line Loop(1167) = {726, 943, -926, -942};
Ruled Surface(1168) = {1167};
Line Loop(1169) = {727, 944, -927, -943};
Ruled Surface(1170) = {1169};
Line Loop(1171) = {728, 937, -928, -944};
Ruled Surface(1172) = {1171};

Line(945) = {701, 901};

Line Loop(1173) = {701, 929, -901, -945};
Ruled Surface(1174) = {1173};
Line Loop(1175) = {702, 931, -902, -945};
Ruled Surface(1176) = {1175};
Line Loop(1177) = {703, 933, -903, -945};
Ruled Surface(1178) = {1177};
Line Loop(1179) = {704, 935, -904, -945};
Ruled Surface(1180) = {1179};

Surface Loop(10001) = {906, 1106, 1174, 1126, 1128, 1176};
Volume(10002) = {10001};
Surface Loop(10003) = {908, 1108, 1176, 1130, 1132, 1178};
Volume(10004) = {10003};
Surface Loop(10005) = {902, 1102, 1178, 1134, 1136, 1180};
Volume(10006) = {10005};
Surface Loop(10007) = {904, 1104, 1180, 1138, 1140, 1174};
Volume(10008) = {10007};

Surface Loop(10009) = {918, 1118, 1142, 1158, 1144, 1126};
Volume(10010) = {10009};
Surface Loop(10011) = {920, 1120, 1144, 1160, 1146, 1128};
Volume(10012) = {10011};
Surface Loop(10013) = {922, 1122, 1146, 1162, 1148, 1130};
Volume(10014) = {10013};
Surface Loop(10015) = {924, 1124, 1148, 1164, 1150, 1132};
Volume(10016) = {10015};
Surface Loop(10017) = {910, 1110, 1150, 1166, 1152, 1134};
Volume(10018) = {10017};
Surface Loop(10019) = {912, 1112, 1152, 1168, 1154, 1136};
Volume(10020) = {10019};
Surface Loop(10021) = {914, 1114, 1154, 1170, 1156, 1138};
Volume(10022) = {10021};
Surface Loop(10023) = {916, 1116, 1156, 1172, 1142, 1140};
Volume(10024) = {10023};

// ================================ //
// Set transfinite lines (Volume 5) //
// ================================ //

numPoints7 = numElementPerWavelength * 0.001 / wavelength;

Transfinite Line {929, 930, 931, 932, 933, 934, 935, 936,
                  937, 938, 939, 940, 941, 942, 943, 944,
                  945} = numPoints7;

Transfinite Line {901, 902, 903, 904,
                  905, 906, 907, 908, 909, 910, 911, 912,
                  921, 922, 923, 924, 925, 926, 927, 928} = numPoints1;

Transfinite Line {913, 914, 915, 916, 917, 918, 919, 920} = numPoints1;

// ------------- //
// Extra layer 5 //
// ------------- //

Point(1009) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1010) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1011) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1012) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1013) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1014) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1015) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};
Point(1016) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi),
              focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius),
              1.0};

Circle(1017) = {902, 1001, 1009};
Circle(1018) = {903, 1001, 1010};
Circle(1019) = {904, 1001, 1011};
Circle(1020) = {905, 1001, 1012};
Circle(1021) = {906, 1001, 1013};
Circle(1022) = {907, 1001, 1014};
Circle(1023) = {908, 1001, 1015};
Circle(1024) = {909, 1001, 1016};

Point(1018) = {0., 0., focalPoint1 - Sqrt(radiusOfCurvature5*radiusOfCurvature5 - domainRadius*domainRadius), 1.0};

Circle(1025) = {1009, 1018, 1010};
Circle(1026) = {1010, 1018, 1011};
Circle(1027) = {1011, 1018, 1012};
Circle(1028) = {1012, 1018, 1013};
Circle(1029) = {1013, 1018, 1014};
Circle(1030) = {1014, 1018, 1015};
Circle(1031) = {1015, 1018, 1016};
Circle(1032) = {1016, 1018, 1009};

Line(1033) = {809, 1009};
Line(1034) = {810, 1010};
Line(1035) = {811, 1011};
Line(1036) = {812, 1012};
Line(1037) = {813, 1013};
Line(1038) = {814, 1014};
Line(1039) = {815, 1015};
Line(1040) = {816, 1016};

Line Loop(1217) = {921, 1018, -1025, -1017};
Ruled Surface(1218) = {1217};
Line Loop(1219) = {922, 1019, -1026, -1018};
Ruled Surface(1220) = {1219};
Line Loop(1221) = {923, 1020, -1027, -1019};
Ruled Surface(1222) = {1221};
Line Loop(1223) = {924, 1021, -1028, -1020};
Ruled Surface(1224) = {1223};
Line Loop(1225) = {925, 1022, -1029, -1021};
Ruled Surface(1226) = {1225};
Line Loop(1227) = {926, 1023, -1030, -1022};
Ruled Surface(1228) = {1227};
Line Loop(1229) = {927, 1024, -1031, -1023};
Ruled Surface(1230) = {1229};
Line Loop(1231) = {928, 1017, -1032, -1024};
Ruled Surface(1232) = {1231};

Line Loop(1233) = {825, 1034, -1025, -1033};
Ruled Surface(1234) = {1233};
Line Loop(1235) = {826, 1035, -1026, -1034};
Ruled Surface(1236) = {1235};
Line Loop(1237) = {827, 1036, -1027, -1035};
Ruled Surface(1238) = {1237};
Line Loop(1239) = {828, 1037, -1028, -1036};
Ruled Surface(1240) = {1239};
Line Loop(1241) = {829, 1038, -1029, -1037};
Ruled Surface(1242) = {1241};
Line Loop(1243) = {830, 1039, -1030, -1038};
Ruled Surface(1244) = {1243};
Line Loop(1245) = {831, 1040, -1031, -1039};
Ruled Surface(1246) = {1245};
Line Loop(1247) = {832, 1033, -1032, -1040};
Ruled Surface(1248) = {1247};

Line Loop(1249) = {817, 1033, -1017, -937};
Ruled Surface(1250) = {1249};
Line Loop(1251) = {818, 1034, -1018, -938};
Ruled Surface(1252) = {1251};
Line Loop(1253) = {819, 1035, -1019, -939};
Ruled Surface(1254) = {1253};
Line Loop(1255) = {820, 1036, -1020, -940};
Ruled Surface(1256) = {1255};
Line Loop(1257) = {821, 1037, -1021, -941};
Ruled Surface(1258) = {1257};
Line Loop(1259) = {822, 1038, -1022, -942};
Ruled Surface(1260) = {1259};
Line Loop(1261) = {823, 1039, -1023, -943};
Ruled Surface(1262) = {1261};
Line Loop(1263) = {824, 1040, -1024, -944};
Ruled Surface(1264) = {1263};

Surface Loop(11001) = {1018, 1218, 1158, 1234, 1250, 1252};
Volume(11002) = {11001};
Surface Loop(11003) = {1020, 1220, 1160, 1236, 1252, 1254};
Volume(11004) = {11003};
Surface Loop(11005) = {1022, 1222, 1162, 1238, 1254, 1256};
Volume(11006) = {11005};
Surface Loop(11007) = {1024, 1224, 1164, 1240, 1256, 1258};
Volume(11008) = {11007};
Surface Loop(11009) = {1026, 1226, 1166, 1242, 1258, 1260};
Volume(11010) = {11009};
Surface Loop(11011) = {1028, 1228, 1168, 1244, 1260, 1262};
Volume(11012) = {11011};
Surface Loop(11013) = {1030, 1230, 1170, 1246, 1262, 1264};
Volume(11014) = {11013};
Surface Loop(11015) = {1032, 1232, 1172, 1248, 1264, 1250};
Volume(11016) = {11015};

// ===================================== //
// Set transfinite lines (extra layer 5) //
// ===================================== //

Transfinite Line {1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024} = numPoints3;
Transfinite Line {1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040} = numPoints7;
Transfinite Line {1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032} = numPoints1;

// -------- //
// Volume 6 //
// -------- //

Point(1101) = {0., 0., domainLength, 1.0};
Point(1102) = {sourceRadius * Cos(Pi), sourceRadius * Sin(Pi), domainLength, 1.0};
Point(1103) = {sourceRadius * Cos(5/4*Pi), sourceRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(1104) = {sourceRadius * Cos(3/2*Pi), sourceRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(1105) = {sourceRadius * Cos(7/4*Pi), sourceRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(1106) = {sourceRadius * Cos(2*Pi), sourceRadius * Sin(2*Pi), domainLength, 1.0};
Point(1107) = {sourceRadius * Cos(1/4*Pi), sourceRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(1108) = {sourceRadius * Cos(1/2*Pi), sourceRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(1109) = {sourceRadius * Cos(3/4*Pi), sourceRadius * Sin(3/4*Pi), domainLength, 1.0};

Point(1110) = {sourceRadius/2 * Cos(Pi), sourceRadius/2 * Sin(Pi), domainLength, 1.0};
Point(1111) = {sourceRadius/2 * Cos(5/4*Pi), sourceRadius/2 * Sin(5/4*Pi), domainLength, 1.0};
Point(1112) = {sourceRadius/2 * Cos(3/2*Pi), sourceRadius/2 * Sin(3/2*Pi), domainLength, 1.0};
Point(1113) = {sourceRadius/2 * Cos(7/4*Pi), sourceRadius/2 * Sin(7/4*Pi), domainLength, 1.0};
Point(1114) = {sourceRadius/2 * Cos(2*Pi), sourceRadius/2 * Sin(2*Pi), domainLength, 1.0};
Point(1115) = {sourceRadius/2 * Cos(1/4*Pi), sourceRadius/2 * Sin(1/4*Pi), domainLength, 1.0};
Point(1116) = {sourceRadius/2 * Cos(1/2*Pi), sourceRadius/2 * Sin(1/2*Pi), domainLength, 1.0};
Point(1117) = {sourceRadius/2 * Cos(3/4*Pi), sourceRadius/2 * Sin(3/4*Pi), domainLength, 1.0};

Line(1101) = {1101, 1110};
Line(1102) = {1101, 1112};
Line(1103) = {1101, 1114};
Line(1104) = {1101, 1116};

Line(1105) = {1110, 1111};
Line(1106) = {1111, 1112};
Line(1107) = {1112, 1113};
Line(1108) = {1113, 1114};
Line(1109) = {1114, 1115};
Line(1110) = {1115, 1116};
Line(1111) = {1116, 1117};
Line(1112) = {1117, 1110};

Line(1113) = {1110, 1102};
Line(1114) = {1111, 1103};
Line(1115) = {1112, 1104};
Line(1116) = {1113, 1105};
Line(1117) = {1114, 1106};
Line(1118) = {1115, 1107};
Line(1119) = {1116, 1108};
Line(1120) = {1117, 1109};

Circle(1121) = {1102, 1101, 1103};
Circle(1122) = {1103, 1101, 1104};
Circle(1123) = {1104, 1101, 1105};
Circle(1124) = {1105, 1101, 1106};
Circle(1125) = {1106, 1101, 1107};
Circle(1126) = {1107, 1101, 1108};
Circle(1127) = {1108, 1101, 1109};
Circle(1128) = {1109, 1101, 1102};

Line(1129) = {910, 1110};
Line(1130) = {911, 1111};
Line(1131) = {912, 1112};
Line(1132) = {913, 1113};
Line(1133) = {914, 1114};
Line(1134) = {915, 1115};
Line(1135) = {916, 1116};
Line(1136) = {917, 1117};

Line(1137) = {902, 1102};
Line(1138) = {903, 1103};
Line(1139) = {904, 1104};
Line(1140) = {905, 1105};
Line(1141) = {906, 1106};
Line(1142) = {907, 1107};
Line(1143) = {908, 1108};
Line(1144) = {909, 1109};

Line Loop(1301) = {1103, 1109, 1110, -1104};
Ruled Surface(1302) = {1301};
Line Loop(1303) = {1104, 1111, 1112, -1101};
Ruled Surface(1304) = {1303};
Line Loop(1305) = {1101, 1105, 1106, -1102};
Ruled Surface(1306) = {1305};
Line Loop(1307) = {1102, 1107, 1108, -1103};
Ruled Surface(1308) = {1307};

Line Loop(1309) = {1117, 1125, -1118, -1109};
Ruled Surface(1310) = {1309};
Line Loop(1311) = {1118, 1126, -1119, -1110};
Ruled Surface(1312) = {1311};
Line Loop(1313) = {1119, 1127, -1120, -1111};
Ruled Surface(1314) = {1313};
Line Loop(1315) = {1120, 1128, -1113, -1112};
Ruled Surface(1316) = {1315};
Line Loop(1317) = {1113, 1121, -1114, -1105};
Ruled Surface(1318) = {1317};
Line Loop(1319) = {1114, 1122, -1115, -1106};
Ruled Surface(1320) = {1319};
Line Loop(1321) = {1115, 1123, -1116, -1107};
Ruled Surface(1322) = {1321};
Line Loop(1323) = {1116, 1124, -1117, -1108};
Ruled Surface(1324) = {1323};

Line Loop(1325) = {-905, 1129, 1105, -1130};
Ruled Surface(1326) = {1325};
Line Loop(1327) = {-906, 1130, 1106, -1131};
Ruled Surface(1328) = {1327};
Line Loop(1329) = {-907, 1131, 1107, -1132};
Ruled Surface(1330) = {1329};
Line Loop(1331) = {-908, 1132, 1108, -1133};
Ruled Surface(1332) = {1331};
Line Loop(1333) = {-909, 1133, 1109, -1134};
Ruled Surface(1334) = {1333};
Line Loop(1335) = {-910, 1134, 1110, -1135};
Ruled Surface(1336) = {1335};
Line Loop(1337) = {-911, 1135, 1111, -1136};
Ruled Surface(1338) = {1337};
Line Loop(1339) = {-912, 1136, 1112, -1129};
Ruled Surface(1340) = {1339};

Line Loop(1341) = {913, 1137, -1113, -1129};
Ruled Surface(1342) = {1341};
Line Loop(1343) = {914, 1138, -1114, -1130};
Ruled Surface(1344) = {1343};
Line Loop(1345) = {915, 1139, -1115, -1131};
Ruled Surface(1346) = {1345};
Line Loop(1347) = {916, 1140, -1116, -1132};
Ruled Surface(1348) = {1347};
Line Loop(1349) = {917, 1141, -1117, -1133};
Ruled Surface(1350) = {1349};
Line Loop(1351) = {918, 1142, -1118, -1134};
Ruled Surface(1352) = {1351};
Line Loop(1353) = {919, 1143, -1119, -1135};
Ruled Surface(1354) = {1353};
Line Loop(1355) = {920, 1144, -1120, -1136};
Ruled Surface(1356) = {1355};

Line Loop(1357) = {921, 1138, -1121, -1137};
Ruled Surface(1358) = {1357};
Line Loop(1359) = {922, 1139, -1122, -1138};
Ruled Surface(1360) = {1359};
Line Loop(1361) = {923, 1140, -1123, -1139};
Ruled Surface(1362) = {1361};
Line Loop(1363) = {924, 1141, -1124, -1140};
Ruled Surface(1364) = {1363};
Line Loop(1365) = {925, 1142, -1125, -1141};
Ruled Surface(1366) = {1365};
Line Loop(1367) = {926, 1143, -1126, -1142};
Ruled Surface(1368) = {1367};
Line Loop(1369) = {927, 1144, -1127, -1143};
Ruled Surface(1370) = {1369};
Line Loop(1371) = {928, 1137, -1128, -1144};
Ruled Surface(1372) = {1371};

Line(1145) = {901, 1101};

Line Loop(1373) = {901, 1129, -1101, -1145};
Ruled Surface(1374) = {1373};
Line Loop(1375) = {902, 1131, -1102, -1145};
Ruled Surface(1376) = {1375};
Line Loop(1377) = {903, 1133, -1103, -1145};
Ruled Surface(1378) = {1377};
Line Loop(1379) = {904, 1135, -1104, -1145};
Ruled Surface(1380) = {1379};

Surface Loop(12001) = {1106, 1306, 1374, 1326, 1328, 1376};
Volume(12002) = {12001};
Surface Loop(12003) = {1108, 1308, 1376, 1330, 1332, 1378};
Volume(12004) = {12003};
Surface Loop(12005) = {1102, 1302, 1378, 1334, 1336, 1380};
Volume(12006) = {12005};
Surface Loop(12007) = {1104, 1304, 1380, 1338, 1340, 1374};
Volume(12008) = {12007};

Surface Loop(12009) = {1118, 1318, 1342, 1358, 1344, 1326};
Volume(12010) = {12009};
Surface Loop(12011) = {1120, 1320, 1344, 1360, 1346, 1328};
Volume(12012) = {12011};
Surface Loop(12013) = {1122, 1322, 1346, 1362, 1348, 1330};
Volume(12014) = {12013};
Surface Loop(12015) = {1124, 1324, 1348, 1364, 1350, 1332};
Volume(12016) = {12015};
Surface Loop(12017) = {1110, 1310, 1350, 1366, 1352, 1334};
Volume(12018) = {12017};
Surface Loop(12019) = {1112, 1312, 1352, 1368, 1354, 1336};
Volume(12020) = {12019};
Surface Loop(12021) = {1114, 1314, 1354, 1370, 1356, 1338};
Volume(12022) = {12021};
Surface Loop(12023) = {1116, 1316, 1356, 1372, 1342, 1340};
Volume(12024) = {12023};

// ================================ //
// Set transfinite lines (Volume 6) //
// ================================ //

numPoints8 = numElementPerWavelength * (domainLength - 0.0365) / wavelength;

Transfinite Line {1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136,
                  1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144,
                  1145} = numPoints8;

Transfinite Line {1101, 1102, 1103, 1104,
                  1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112,
                  1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128} = numPoints1;

Transfinite Line {1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120} = numPoints1;

// ------------- //
// Extra layer 6 //
// ------------- //

Point(1209) = {domainRadius * Cos(Pi), domainRadius * Sin(Pi), domainLength, 1.0};
Point(1210) = {domainRadius * Cos(5/4*Pi), domainRadius * Sin(5/4*Pi), domainLength, 1.0};
Point(1211) = {domainRadius * Cos(3/2*Pi), domainRadius * Sin(3/2*Pi), domainLength, 1.0};
Point(1212) = {domainRadius * Cos(7/4*Pi), domainRadius * Sin(7/4*Pi), domainLength, 1.0};
Point(1213) = {domainRadius * Cos(2*Pi), domainRadius * Sin(2*Pi), domainLength, 1.0};
Point(1214) = {domainRadius * Cos(1/4*Pi), domainRadius * Sin(1/4*Pi), domainLength, 1.0};
Point(1215) = {domainRadius * Cos(1/2*Pi), domainRadius * Sin(1/2*Pi), domainLength, 1.0};
Point(1216) = {domainRadius * Cos(3/4*Pi), domainRadius * Sin(3/4*Pi), domainLength, 1.0};

Line(1217) = {1102, 1209};
Line(1218) = {1103, 1210};
Line(1219) = {1104, 1211};
Line(1220) = {1105, 1212};
Line(1221) = {1106, 1213};
Line(1222) = {1107, 1214};
Line(1223) = {1108, 1215};
Line(1224) = {1109, 1216};

Circle(1225) = {1209, 1101, 1210};
Circle(1226) = {1210, 1101, 1211};
Circle(1227) = {1211, 1101, 1212};
Circle(1228) = {1212, 1101, 1213};
Circle(1229) = {1213, 1101, 1214};
Circle(1230) = {1214, 1101, 1215};
Circle(1231) = {1215, 1101, 1216};
Circle(1232) = {1216, 1101, 1209};

Line(1233) = {1009, 1209};
Line(1234) = {1010, 1210};
Line(1235) = {1011, 1211};
Line(1236) = {1012, 1212};
Line(1237) = {1013, 1213};
Line(1238) = {1014, 1214};
Line(1239) = {1015, 1215};
Line(1240) = {1016, 1216};

Line Loop(1417) = {1121, 1218, -1225, -1217};
Ruled Surface(1418) = {1417};
Line Loop(1419) = {1122, 1219, -1226, -1218};
Ruled Surface(1420) = {1419};
Line Loop(1421) = {1123, 1220, -1227, -1219};
Ruled Surface(1422) = {1421};
Line Loop(1423) = {1124, 1221, -1228, -1220};
Ruled Surface(1424) = {1423};
Line Loop(1425) = {1125, 1222, -1229, -1221};
Ruled Surface(1426) = {1425};
Line Loop(1427) = {1126, 1223, -1230, -1222};
Ruled Surface(1428) = {1427};
Line Loop(1429) = {1127, 1224, -1231, -1223};
Ruled Surface(1430) = {1429};
Line Loop(1431) = {1128, 1217, -1232, -1224};
Ruled Surface(1432) = {1431};

Line Loop(1433) = {1025, 1234, -1225, -1233};
Ruled Surface(1434) = {1433};
Line Loop(1435) = {1026, 1235, -1226, -1234};
Ruled Surface(1436) = {1435};
Line Loop(1437) = {1027, 1236, -1227, -1235};
Ruled Surface(1438) = {1437};
Line Loop(1439) = {1028, 1237, -1228, -1236};
Ruled Surface(1440) = {1439};
Line Loop(1441) = {1029, 1238, -1229, -1237};
Ruled Surface(1442) = {1441};
Line Loop(1443) = {1030, 1239, -1230, -1238};
Ruled Surface(1444) = {1443};
Line Loop(1445) = {1031, 1240, -1231, -1239};
Ruled Surface(1446) = {1445};
Line Loop(1447) = {1032, 1233, -1232, -1240};
Ruled Surface(1448) = {1447};

Line Loop(1449) = {1017, 1233, -1217, -1137};
Ruled Surface(1450) = {1449};
Line Loop(1451) = {1018, 1234, -1218, -1138};
Ruled Surface(1452) = {1451};
Line Loop(1453) = {1019, 1235, -1219, -1139};
Ruled Surface(1454) = {1453};
Line Loop(1455) = {1020, 1236, -1220, -1140};
Ruled Surface(1456) = {1455};
Line Loop(1457) = {1021, 1237, -1221, -1141};
Ruled Surface(1458) = {1457};
Line Loop(1459) = {1022, 1238, -1222, -1142};
Ruled Surface(1460) = {1459};
Line Loop(1461) = {1023, 1239, -1223, -1143};
Ruled Surface(1462) = {1461};
Line Loop(1463) = {1024, 1240, -1224, -1144};
Ruled Surface(1464) = {1463};

Surface Loop(13001) = {1218, 1418, 1358, 1434, 1450, 1452};
Volume(13002) = {13001};
Surface Loop(13003) = {1220, 1420, 1360, 1436, 1452, 1454};
Volume(13004) = {13003};
Surface Loop(13005) = {1222, 1422, 1362, 1438, 1454, 1456};
Volume(13006) = {13005};
Surface Loop(13007) = {1224, 1424, 1364, 1440, 1456, 1458};
Volume(13008) = {13007};
Surface Loop(13009) = {1226, 1426, 1366, 1442, 1458, 1460};
Volume(13010) = {13009};
Surface Loop(13011) = {1228, 1428, 1368, 1444, 1460, 1462};
Volume(13012) = {13011};
Surface Loop(13013) = {1230, 1430, 1370, 1446, 1462, 1464};
Volume(13014) = {13013};
Surface Loop(13015) = {1232, 1432, 1372, 1448, 1464, 1450};
Volume(13016) = {13015};

// ===================================== //
// Set transfinite lines (extra layer 5) //
// ===================================== //

Transfinite Line {1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224} = numPoints3;
Transfinite Line {1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240} = numPoints8;
Transfinite Line {1225, 1226, 1227, 1228, 1229, 1230, 1231, 1232} = numPoints1;

// ------------------------ //
// Tag surfaces and volumes //
// ------------------------ //

Physical Surface(1) = {214, 216, 218, 220,
                       190, 192, 194, 196, 198, 200, 202, 204};
Physical Surface(2) = {434, 436, 438, 440, 442, 444, 446, 448,
                       634, 636, 638, 640, 642, 644, 646, 648,
                       834, 836, 838, 840, 842, 844, 846, 848,
                       1034, 1036, 1038, 1040, 1042, 1044, 1046, 1048,
                       1234, 1236, 1238, 1240, 1242, 1244, 1246, 1248,
                       1434, 1436, 1438, 1440, 1442, 1444, 1446, 1448,
                       1302, 1304, 1306, 1308,
                       1310, 1312, 1314, 1316, 1318, 1320, 1322, 1324,
                       1418, 1420, 1422, 1424, 1426, 1428, 1430, 1432
                       };
Physical Surface(3) = {402, 404, 406, 408, 410, 412, 414, 416};

Physical Volume(1) = {1002, 1004, 1006, 1008,
                      1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024,
                      1026, 1028, 1030, 1032,
                      2002, 2004, 2006, 2008,
                      2010, 2012, 2014, 2016, 2018, 2020, 2022, 2024,
                      3002, 3004, 3006, 3008, 3010, 3012, 3014, 3016};
Physical Volume(2) = {4002, 4004, 4006, 4008,
                      4010, 4012, 4014, 4016, 4018, 4020, 4022, 4024,
                      5002, 5004, 5006, 5008, 5010, 5012, 5014, 5016};
Physical Volume(3) = {6002, 6004, 6006, 6008,
                      6010, 6012, 6014, 6016, 6018, 6020, 6022, 6024,
                      7002, 7004, 7006, 7008, 7010, 7012, 7014, 7016};
Physical Volume(4) = {8002, 8004, 8006, 8008,
                      8010, 8012, 8014, 8016, 8018, 8020, 8022, 8024,
                      9002, 9004, 9006, 9008, 9010, 9012, 9014, 9016};
Physical Volume(5) = {10002, 10004, 10006, 10008,
                      10010, 10012, 10014, 10016, 10018, 10020, 10022, 10024,
                      11002, 11004, 11006, 11008, 11010, 11012, 11014, 11016};
Physical Volume(6) = {12002, 12004, 12006, 12008,
                      12010, 12012, 12014, 12016, 12018, 12020, 12022, 12024,
                      13002, 13004, 13006, 13008, 13010, 13012, 13014, 13016};
                      
// ==================================== //
// Set transfinite surfaces and volumes //
// ==================================== //

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
