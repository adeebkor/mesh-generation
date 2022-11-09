// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 3D spherical transducer problem
// - structured mesh
// - the bowl shaped is extended
// - 5 different medium (water, skin, cortical bone, trabecular bone, brain)
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor

// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraWavelength = 2;
domainRadius = 0.035 + numExtraWavelength*wavelength;
domainLength = 0.12 + numExtraWavelength*wavelength;

numElementPerWavelength = 2.4;

sourceRadius = 0.032;
focalLength = 0.064;

alpha = Asin(sourceRadius / focalLength);

// ------------------------------------------------------------------------- //
// Spherical cap                                                             //
// ------------------------------------------------------------------------- //

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
Line(150) = {18, 1};

Line Loop(78) = {18, -11, -14, 17};
Ruled Surface(79) = {78};
Line Loop(80) = {6, -11, 10, 1};
Ruled Surface(81) = {80};
Line Loop(82) = {10, 2, 7, 9};
Ruled Surface(83) = {82};
Line Loop(84) = {14, -9, 12, 13};
Ruled Surface(85) = {84};
Line Loop(86) = {20, 24, -16, 17};
Ruled Surface(87) = {86};
Line Loop(88) = {16, 25, -15, 13};
Ruled Surface(89) = {88};
Line Loop(90) = {15, 26, -8, 12};
Ruled Surface(91) = {90};
Line Loop(92) = {7, 8, 27, 4};
Ruled Surface(93) = {92};
Line Loop(94) = {2, -4, 28, -3};
Ruled Surface(95) = {94};
Line Loop(96) = {3, 21, 5, -1};
Ruled Surface(97) = {96};
Line Loop(98) = {6, 19, -22, 5};
Ruled Surface(99) = {98};
Line Loop(100) = {20, -23, -19, -18};
Ruled Surface(101) = {100};
Line Loop(102) = {40, 48, -13, -41};
Ruled Surface(103) = {102};
Line Loop(104) = {41, -12, -42, 39};
Ruled Surface(105) = {104};
Line Loop(106) = {42, -7, -43, 38};
Ruled Surface(107) = {106};
Line Loop(108) = {43, -2, -44, 37};
Ruled Surface(109) = {108};
Line Loop(110) = {44, 1, -45, 36};
Ruled Surface(111) = {110};
Line Loop(112) = {6, -46, 35, 45};
Ruled Surface(113) = {112};
Line Loop(114) = {18, -46, -34, 47};
Ruled Surface(115) = {114};
Line Loop(116) = {17, -47, -33, 48};
Ruled Surface(117) = {116};
Line Loop(118) = {35, 36, -29, 30};
Ruled Surface(119) = {118};
Line Loop(120) = {29, 37, 38, -31};
Ruled Surface(121) = {120};

Line Loop(123) = {31, 39, 40, -32};
Ruled Surface(124) = {123};
Line Loop(125) = {30, -34, -33, -32};
Ruled Surface(126) = {125};
Line Loop(127) = {30, 46, -11, -150};
Ruled Surface(128) = {127};
Line Loop(129) = {150, -9, -42, -31};
Ruled Surface(130) = {129};
Line Loop(131) = {44, -10, -150, 29};
Ruled Surface(132) = {131};
Line Loop(133) = {150, -14, -48, -32};
Ruled Surface(134) = {133};
Line Loop(135) = {52, 60, -3, -44};
Ruled Surface(136) = {135};
Line Loop(137) = {59, -53, 45, -5};
Ruled Surface(138) = {137};
Line Loop(139) = {54, -58, -19, -46};
Ruled Surface(140) = {139};
Line Loop(141) = {65, -20, -47, 55};
Ruled Surface(142) = {141};
Line Loop(143) = {64, -16, -48, 56};
Ruled Surface(144) = {143};
Line Loop(145) = {63, -15, -41, 57};
Ruled Surface(146) = {145};
Line Loop(147) = {62, -8, -42, 50};
Ruled Surface(148) = {147};
Line Loop(149) = {51, 61, 4, -43};
Ruled Surface(150) = {149};
Line Loop(151) = {50, 72, -57, -39};
Ruled Surface(152) = {151};
Line Loop(153) = {57, 73, -56, -40};
Ruled Surface(154) = {153};
Line Loop(155) = {55, -66, -56, 33};
Ruled Surface(156) = {155};
Line Loop(157) = {55, 67, -54, -34};
Ruled Surface(158) = {157};
Line Loop(159) = {68, -53, -35, 54};
Ruled Surface(160) = {159};
Line Loop(161) = {69, -52, -36, 53};
Ruled Surface(162) = {161};
Line Loop(163) = {52, 70, -51, -37};
Ruled Surface(164) = {163};
Line Loop(165) = {71, -50, -38, 51};
Ruled Surface(166) = {165};
Line Loop(167) = {70, 61, 28, -60};
Ruled Surface(168) = {167};
Line Loop(169) = {61, -27, -62, -71};
Ruled Surface(170) = {169};
Line Loop(171) = {72, 63, 26, -62};
Ruled Surface(172) = {171};
Line Loop(173) = {63, -25, -64, -73};
Ruled Surface(174) = {173};
Line Loop(175) = {64, -24, -65, -66};
Ruled Surface(176) = {175};
Line Loop(177) = {65, -23, 58, -67};
Ruled Surface(178) = {177};
Line Loop(179) = {68, -59, 22, 58};
Ruled Surface(180) = {179};
Line Loop(181) = {69, 60, 21, 59};
Ruled Surface(182) = {181};
Line Loop(183) = {49, 30, 54, -75};
Ruled Surface(184) = {183};
Line Loop(185) = {49, 29, 52, -76};
Ruled Surface(186) = {185};
Line Loop(187) = {49, 31, 50, -77};
Ruled Surface(188) = {187};
Line Loop(189) = {49, 32, 56, -74};
Ruled Surface(190) = {189};
Line Loop(191) = {77, 72, 73, -74};
Ruled Surface(192) = {191};
Line Loop(193) = {74, 66, 67, -75};
Ruled Surface(194) = {193};
Line Loop(195) = {75, 68, 69, -76};
Ruled Surface(196) = {195};
Line Loop(197) = {77, -71, -70, -76};
Ruled Surface(198) = {197};

Surface Loop(199) = {134, 103, 105, 130, 124, 85};
Volume(200) = {199};
Surface Loop(201) = {107, 130, 121, 83, 132, 109};
Volume(202) = {201};
Surface Loop(203) = {128, 132, 111, 113, 119, 81};
Volume(204) = {203};
Surface Loop(205) = {117, 134, 128, 115, 126, 79};
Volume(206) = {205};
Surface Loop(207) = {142, 115, 140, 101, 178, 158};
Volume(208) = {207};
Surface Loop(209) = {140, 113, 138, 160, 99, 180};
Volume(210) = {209};
Surface Loop(211) = {138, 111, 136, 97, 182, 162};
Volume(212) = {211};
Surface Loop(213) = {136, 109, 150, 95, 168, 164};
Volume(214) = {213};
Surface Loop(215) = {150, 107, 148, 93, 170, 166};
Volume(216) = {215};
Surface Loop(217) = {148, 91, 172, 105, 152, 146};
Volume(218) = {217};
Surface Loop(219) = {103, 146, 89, 174, 144, 154};
Volume(220) = {219};
Surface Loop(221) = {144, 117, 142, 87, 176, 156};
Volume(222) = {221};
Surface Loop(223) = {190, 156, 158, 184, 126, 194};
Volume(224) = {223};
Surface Loop(225) = {184, 186, 119, 160, 162, 196};
Volume(226) = {225};
Surface Loop(227) = {186, 188, 121, 164, 166, 198};
Volume(228) = {227};
Surface Loop(229) = {188, 190, 152, 124, 154, 192};
Volume(230) = {229};

// ===================================== //
// Set transfinite lines (spherical cap) //
// ===================================== //

numPoints1 = 2 * numElementPerWavelength * sourceRadius / 2 / wavelength;

Transfinite Line {150, 41, 42, 43, 44, 45, 46, 47, 48} = numPoints1;
Transfinite Line {58, 59, 60, 61, 62, 63, 64, 65} = numPoints1;

Transfinite Line {9, 10, 11, 14, 39, 30, 31, 32} = numPoints1;
Transfinite Line {1, 2, 7, 12, 13, 17, 18, 6} = numPoints1;
Transfinite Line {33, 34, 35, 36, 37, 38, 39, 40} = numPoints1;
Transfinite Line {21, 22, 23, 24, 25, 26, 27, 28, 29} = numPoints1;
Transfinite Line {66, 67, 68, 69, 70, 71, 72, 73} = numPoints1;
Transfinite Line {74, 75, 76, 77} = numPoints1;

Transfinite Line {49, 56, 16, 57, 15, 50, 8, 51} = numPoints1;
Transfinite Line {4, 52, 3, 53, 5, 54, 19, 55, 20} = numPoints1;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 1)                                                        //
// ------------------------------------------------------------------------- //

lengthLayer1 = 0.026;

Point(37) = {0.0, 0.0, lengthLayer1, 1.0};
Point(38) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), lengthLayer1, 1.0};
Point(39) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), lengthLayer1, 1.0};
Point(40) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), lengthLayer1, 1.0};
Point(41) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), lengthLayer1, 1.0};
Point(42) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), lengthLayer1, 1.0};
Point(43) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), lengthLayer1, 1.0};
Point(44) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), lengthLayer1, 1.0};
Point(45) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), lengthLayer1, 1.0};
Point(46) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), lengthLayer1, 1.0};
Point(47) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), lengthLayer1, 1.0};
Point(48) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), lengthLayer1, 1.0};
Point(49) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), lengthLayer1, 1.0};
Point(50) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), lengthLayer1, 1.0};
Point(51) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), lengthLayer1, 1.0};
Point(52) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), lengthLayer1, 1.0};
Point(53) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), lengthLayer1, 1.0};

Line(78) = {50, 49};
Line(79) = {50, 51};
Line(80) = {50, 42};
Line(81) = {43, 51};
Line(82) = {41, 49};
Line(83) = {49, 48};
Line(84) = {51, 52};
Line(85) = {52, 44};
Line(86) = {52, 37};
Line(87) = {37, 50};
Line(88) = {37, 48};
Line(89) = {52, 53};
Line(90) = {53, 46};
Line(91) = {46, 37};
Line(92) = {53, 45};
Line(93) = {46, 38};
Line(94) = {46, 47};
Line(95) = {47, 48};
Line(96) = {48, 40};
Line(97) = {47, 39};
Circle(98) = {42, 37, 41};
Circle(99) = {41, 37, 40};
Circle(100) = {40, 37, 39};
Circle(101) = {39, 37, 38}; 
Circle(102) = {38, 37, 45}; 
Circle(103) = {45, 37, 44}; 
Circle(104) = {44, 37, 43}; 
Circle(105) = {43, 37, 42}; 
Line(106) = {1, 37};  
Line(107) = {14, 50}; 
Line(108) = {13, 49}; 
Line(109) = {12, 48}; 
Line(110) = {11, 47}; 
Line(111) = {10, 46}; 
Line(112) = {17, 53}; 
Line(113) = {16, 52}; 
Line(114) = {15, 51}; 
Line(115) = {6, 42}; 
Line(116) = {5, 41}; 
Line(117) = {4, 40}; 
Line(118) = {3, 39}; 
Line(119) = {2, 38}; 
Line(120) = {9, 45}; 
Line(121) = {8, 44}; 
Line(122) = {7, 43};

Line Loop(199) = {91, 88, -95, -94};
Ruled Surface(200) = {199};
Line Loop(201) = {87, 78, 83, -88};
Ruled Surface(202) = {201};
Line Loop(203) = {87, 79, 84, 86};
Ruled Surface(204) = {203};
Line Loop(205) = {86, -91, -90, -89};
Ruled Surface(206) = {205}; 
Line Loop(207) = {93, -101, -97, -94};
Ruled Surface(208) = {207}; 
Line Loop(209) = {90, 93, 102, -92};
Ruled Surface(210) = {209}; 
Line Loop(211) = {89, 92, 103, -85}; 
Ruled Surface(212) = {211};
Line Loop(213) = {84, 85, 104, 81};
Ruled Surface(214) = {213};
Line Loop(215) = {81, -79, 80, -105};
Ruled Surface(216) = {215};
Line Loop(217) = {98, 82, -78, 80};
Ruled Surface(218) = {217};
Line Loop(219) = {99, -96, -83, -82};
Ruled Surface(220) = {219};
Line Loop(221) = {100, -97, 95, 96};
Ruled Surface(222) = {221};
Line Loop(223) = {111, 91, -106, -14};
Ruled Surface(224) = {223};
Line Loop(225) = {106, 88, -109, -11};
Ruled Surface(226) = {225};
Line Loop(227) = {106, 87, -107, -10};
Ruled Surface(228) = {227};
Line Loop(229) = {86, -106, -9, 113};
Ruled Surface(230) = {229};
Line Loop(231) = {94, -110, -17, 111};
Ruled Surface(232) = {231};
Line Loop(233) = {95, -109, -18, 110};
Ruled Surface(234) = {233};
Line Loop(235) = {83, -109, -6, 108};
Ruled Surface(236) = {235};
Line Loop(237) = {78, -108, -1, 107};
Ruled Surface(238) = {237};
Line Loop(239) = {79, -114, -2, 107};
Ruled Surface(240) = {239};
Line Loop(241) = {84, -113, -7, 114};
Ruled Surface(242) = {241};
Line Loop(243) = {89, -112, -12, 113};
Ruled Surface(244) = {243};
Line Loop(245) = {112, 90, -111, -13};
Ruled Surface(246) = {245};
Line Loop(247) = {93, -119, -16, 111};
Ruled Surface(248) = {247};
Line Loop(249) = {97, -118, -20, 110};
Ruled Surface(250) = {249};
Line Loop(251) = {96, -117, -19, 109};
Ruled Surface(252) = {251};
Line Loop(253) = {82, -108, -5, 116};
Ruled Surface(254) = {253};
Line Loop(255) = {80, -115, -3, 107};
Ruled Surface(256) = {255};
Line Loop(257) = {81, -114, -4, 122};
Ruled Surface(258) = {257};
Line Loop(259) = {85, -121, -8, 113};
Ruled Surface(260) = {259};
Line Loop(261) = {92, -120, -15, 112};
Ruled Surface(262) = {261};
Line Loop(263) = {101, -119, -24, 118};
Ruled Surface(264) = {263};
Line Loop(265) = {100, -118, -23, 117};
Ruled Surface(266) = {265};
Line Loop(267) = {99, -117, -22, 116};
Ruled Surface(268) = {267};
Line Loop(269) = {98, -116, -21, 115};
Ruled Surface(270) = {269};
Line Loop(271) = {102, -120, -25, 119};
Ruled Surface(272) = {271};
Line Loop(273) = {103, -121, -26, 120};
Ruled Surface(274) = {273};
Line Loop(275) = {104, -122, -27, 121};
Ruled Surface(276) = {275};
Line Loop(277) = {105, -115, -28, 122};
Ruled Surface(278) = {277};

Surface Loop(279) = {200, 79, 232, 226, 234, 224};
Volume(280) = {279}; 
Surface Loop(281) = {202, 81, 226, 236, 238, 228};
Volume(282) = {281}; 
Surface Loop(283) = {204, 83, 228, 242, 240, 230};
Volume(284) = {283}; 
Surface Loop(285) = {206, 85, 224, 244, 246, 230};
Volume(286) = {285}; 
Surface Loop(287) = {208, 87, 232, 264, 248, 250};
Volume(288) = {287}; 
Surface Loop(289) = {222, 101, 250, 252, 234, 266};
Volume(290) = {289}; 
Surface Loop(291) = {220, 99, 236, 268, 252, 254};
Volume(292) = {291}; 
Surface Loop(293) = {218, 97, 254, 256, 270, 238};
Volume(294) = {293}; 
Surface Loop(295) = {216, 95, 256, 258, 240, 278};
Volume(296) = {295}; 
Surface Loop(297) = {214, 93, 258, 260, 242, 276};
Volume(298) = {297}; 
Surface Loop(299) = {212, 91, 260, 262, 244, 274};
Volume(300) = {299}; 
Surface Loop(301) = {210, 89, 262, 248, 246, 272};
Volume(302) = {301};

// ================================== //
// Set transfinite lines (cylinder 1) //
// ================================== //

numPoints2 = numElementPerWavelength * (lengthLayer1 - (focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius))) / wavelength;

Transfinite Line {86, 87, 88, 91, 83, 78, 79, 84, 89, 90, 94, 95} = numPoints1;
Transfinite Line {98, 99, 100, 101, 102, 103, 104, 105} = numPoints1;
Transfinite Line {80, 81, 85, 92, 93, 97, 96, 82} = numPoints1;
Transfinite Line {106, 107, 108, 109, 110, 111, 112, 113} = numPoints2;
Transfinite Line {114, 115, 116, 117, 118, 119, 120, 121, 122} = numPoints2;

// ------------------------------------------------------------------------- //
// Extra layer 1                                                             //
// ------------------------------------------------------------------------- //

Point(54) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(55) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(56) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(57) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(58) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(59) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(60) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(61) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};
Point(62) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), lengthLayer1, 1.0};
Point(63) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), lengthLayer1, 1.0};
Point(64) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), lengthLayer1, 1.0};
Point(65) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), lengthLayer1, 1.0};
Point(66) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), lengthLayer1, 1.0};
Point(67) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), lengthLayer1, 1.0};
Point(68) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), lengthLayer1, 1.0};
Point(69) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), lengthLayer1, 1.0};
Point(70) = {0, 0, focalLength - Sqrt(focalLength*focalLength - domainRadius*domainRadius), 1.0};

Circle(223) = {2, 36, 54};
Circle(224) = {3, 36, 55};
Circle(225) = {4, 36, 56};
Circle(226) = {5, 36, 57};
Circle(227) = {6, 36, 58};
Circle(228) = {7, 36, 59};
Circle(229) = {8, 36, 60};
Circle(230) = {9, 36, 61};
Circle(231) = {54, 70, 55};
Circle(232) = {55, 70, 56};
Circle(233) = {56, 70, 57};
Circle(234) = {57, 70, 58};
Circle(235) = {58, 70, 59};
Circle(236) = {59, 70, 60};
Circle(237) = {60, 70, 61};
Circle(238) = {61, 70, 54};
Line(239) = {38, 62};
Line(240) = {39, 63};
Line(241) = {40, 64};
Line(242) = {41, 65};
Line(243) = {42, 66};
Line(244) = {43, 67};
Line(245) = {44, 68};
Line(246) = {45, 69};
Circle(247) = {62, 37, 63};
Circle(248) = {63, 37, 64};
Circle(249) = {64, 37, 65};
Circle(250) = {65, 37, 66};
Circle(251) = {66, 37, 67};
Circle(252) = {67, 37, 68};
Circle(253) = {68, 37, 69};
Circle(254) = {69, 37, 62};
Line(255) = {54, 62};
Line(256) = {55, 63};
Line(257) = {56, 64};
Line(258) = {57, 65};
Line(259) = {58, 66};
Line(260) = {59, 67};
Line(261) = {60, 68};
Line(262) = {61, 69};

Line Loop(301) = {223, 231, -224, 24};
Ruled Surface(302) = {301};
Line Loop(303) = {224, 232, -225, 23};
Ruled Surface(304) = {303};
Line Loop(305) = {225, 233, -226, 22};
Ruled Surface(306) = {305};
Line Loop(307) = {226, 234, -227, 21};
Ruled Surface(308) = {307};
Line Loop(309) = {227, 235, -228, 28};
Ruled Surface(310) = {309};
Line Loop(311) = {228, 236, -229, 27};
Ruled Surface(312) = {311};
Line Loop(313) = {229, 237, -230, 26};
Ruled Surface(314) = {313};
Line Loop(315) = {230, 238, -223, 25};
Ruled Surface(316) = {315};

Line Loop(317) = {231, 256, -247, -255};
Ruled Surface(318) = {317};
Line Loop(319) = {232, 257, -248, -256};
Ruled Surface(320) = {319};
Line Loop(321) = {233, 258, -249, -257};
Ruled Surface(322) = {321};
Line Loop(323) = {234, 259, -250, -258};
Ruled Surface(324) = {323};
Line Loop(325) = {235, 260, -251, -259};
Ruled Surface(326) = {325};
Line Loop(327) = {236, 261, -252, -260};
Ruled Surface(328) = {327};
Line Loop(329) = {237, 262, -253, -261};
Ruled Surface(330) = {329};
Line Loop(331) = {238, 255, -254, -262};
Ruled Surface(332) = {331};

Line Loop(333) = {239, 247, -240, 101};
Ruled Surface(334) = {333};
Line Loop(335) = {240, 248, -241, 100};
Ruled Surface(336) = {335};
Line Loop(337) = {241, 249, -242, 99};
Ruled Surface(338) = {337};
Line Loop(339) = {242, 250, -243, 98};
Ruled Surface(340) = {339};
Line Loop(341) = {243, 251, -244, 105};
Ruled Surface(342) = {341};
Line Loop(343) = {244, 252, -245, 104};
Ruled Surface(344) = {343};
Line Loop(345) = {245, 253, -246, 103};
Ruled Surface(346) = {345};
Line Loop(347) = {246, 254, -239, 102};
Ruled Surface(348) = {347};

Line Loop(349) = {223, 255, -239, -119};
Ruled Surface(350) = {349};
Line Loop(351) = {224, 256, -240, -118};
Ruled Surface(352) = {351};
Line Loop(353) = {225, 257, -241, -117};
Ruled Surface(354) = {353};
Line Loop(355) = {226, 258, -242, -116};
Ruled Surface(356) = {355};
Line Loop(357) = {227, 259, -243, -115};
Ruled Surface(358) = {357};
Line Loop(359) = {228, 260, -244, -122};
Ruled Surface(360) = {359};
Line Loop(361) = {229, 261, -245, -121};
Ruled Surface(362) = {361};
Line Loop(363) = {230, 262, -246, -120};
Ruled Surface(364) = {363};

Surface Loop(401) = {302, 318, 334, 264, 350, 352};
Volume(402) = {401};
Surface Loop(403) = {304, 320, 336, 266, 352, 354};
Volume(404) = {403};
Surface Loop(405) = {306, 322, 338, 268, 354, 356};
Volume(406) = {405};
Surface Loop(407) = {308, 324, 340, 270, 356, 358};
Volume(408) = {407};
Surface Loop(409) = {310, 326, 342, 278, 358, 360};
Volume(410) = {409};
Surface Loop(411) = {312, 328, 344, 276, 360, 362};
Volume(412) = {411};
Surface Loop(413) = {314, 330, 346, 274, 362, 364};
Volume(414) = {413};
Surface Loop(415) = {316, 332, 348, 272, 364, 350};
Volume(416) = {415};

// ===================================== //
// Set transfinite lines (extra layer 1) //
// ===================================== //

numPoints3 = numElementPerWavelength * (domainRadius - sourceRadius) / wavelength;

Transfinite Line {223, 224, 225, 226, 227, 228, 229, 230,
                  239, 240, 241, 242, 243, 244, 245, 246} = numPoints3;
Transfinite Line {231, 232, 233, 234, 235, 236, 237, 238,
                  247, 248, 249, 250, 251, 252, 253, 254} = numPoints1;
Transfinite Line {255, 256, 257, 258, 259, 260, 261, 262} = numPoints2;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 2)                                                        //
// ------------------------------------------------------------------------- //

lengthLayer2 = lengthLayer1 + 0.004;

Point(71) = {0.0, 0.0, lengthLayer2, 1.0};
Point(72) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), lengthLayer2, 1.0};
Point(73) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), lengthLayer2, 1.0};
Point(74) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), lengthLayer2, 1.0};
Point(75) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), lengthLayer2, 1.0};
Point(76) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), lengthLayer2, 1.0};
Point(77) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), lengthLayer2, 1.0};
Point(78) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), lengthLayer2, 1.0};
Point(79) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), lengthLayer2, 1.0};
Point(80) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), lengthLayer2, 1.0};
Point(81) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), lengthLayer2, 1.0};
Point(82) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), lengthLayer2, 1.0};
Point(83) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), lengthLayer2, 1.0};
Point(84) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), lengthLayer2, 1.0};
Point(85) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), lengthLayer2, 1.0};
Point(86) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), lengthLayer2, 1.0};
Point(87) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), lengthLayer2, 1.0};

Line(301) = {84, 83};
Line(302) = {84, 85};
Line(303) = {84, 76};
Line(304) = {77, 85};
Line(305) = {75, 83};
Line(306) = {83, 82};
Line(307) = {85, 86};
Line(308) = {86, 78};
Line(309) = {86, 71};
Line(310) = {71, 84};
Line(311) = {71, 82};
Line(312) = {86, 87};
Line(313) = {87, 80};
Line(314) = {80, 71};
Line(315) = {87, 79};
Line(316) = {80, 72};
Line(317) = {80, 81};
Line(318) = {81, 82};
Line(319) = {82, 74};
Line(320) = {81, 73};
Circle(321) = {76, 71, 75};
Circle(322) = {75, 71, 74};
Circle(323) = {74, 71, 73};
Circle(324) = {73, 71, 72}; 
Circle(325) = {72, 71, 79}; 
Circle(326) = {79, 71, 78}; 
Circle(327) = {78, 71, 77}; 
Circle(328) = {77, 71, 76}; 
Line(329) = {37, 71};  
Line(330) = {50, 84}; 
Line(331) = {49, 83}; 
Line(332) = {48, 82}; 
Line(333) = {47, 81}; 
Line(334) = {46, 80}; 
Line(335) = {53, 87}; 
Line(336) = {52, 86}; 
Line(337) = {51, 85}; 
Line(338) = {42, 76}; 
Line(339) = {41, 75}; 
Line(340) = {40, 74}; 
Line(341) = {39, 73}; 
Line(342) = {38, 72}; 
Line(343) = {45, 79}; 
Line(344) = {44, 78}; 
Line(345) = {43, 77};

Line Loop(1001) = {314, 311, -318, -317};
Ruled Surface(1002) = {1001};
Line Loop(1003) = {310, 301, 306, -311};
Ruled Surface(1004) = {1003};
Line Loop(1005) = {310, 302, 307, 309};
Ruled Surface(1006) = {1005};
Line Loop(1007) = {309, -314, -313, -312};
Ruled Surface(1008) = {1007}; 
Line Loop(1009) = {316, -324, -320, -317};
Ruled Surface(1010) = {1009}; 
Line Loop(1011) = {313, 316, 325, -315};
Ruled Surface(1012) = {1011}; 
Line Loop(1013) = {312, 315, 326, -308}; 
Ruled Surface(1014) = {1013};
Line Loop(1015) = {307, 308, 327, 304};
Ruled Surface(1016) = {1015};
Line Loop(1017) = {304, -302, 303, -328};
Ruled Surface(1018) = {1017};
Line Loop(1019) = {321, 305, -301, 303};
Ruled Surface(1020) = {1019};
Line Loop(1021) = {322, -319, -306, -305};
Ruled Surface(1022) = {1021};
Line Loop(1023) = {323, -320, 318, 319};
Ruled Surface(1024) = {1023};
Line Loop(1025) = {334, 314, -329, -91};
Ruled Surface(1026) = {1025};
Line Loop(1027) = {329, 311, -332, -88};
Ruled Surface(1028) = {1027};
Line Loop(1029) = {329, 310, -330, -87};
Ruled Surface(1030) = {1029};
Line Loop(1031) = {309, -329, -86, 336};
Ruled Surface(1032) = {1031};
Line Loop(1033) = {317, -333, -94, 334};
Ruled Surface(1034) = {1033};
Line Loop(1035) = {318, -332, -95, 333};
Ruled Surface(1036) = {1035};
Line Loop(1037) = {306, -332, -83, 331};
Ruled Surface(1038) = {1037};
Line Loop(1039) = {301, -331, -78, 330};
Ruled Surface(1040) = {1039};
Line Loop(1041) = {302, -337, -79, 330};
Ruled Surface(1042) = {1041};
Line Loop(1043) = {307, -336, -84, 337};
Ruled Surface(1044) = {1043};
Line Loop(1045) = {312, -335, -89, 336};
Ruled Surface(1046) = {1045};
Line Loop(1047) = {335, 313, -334, -90};
Ruled Surface(1048) = {1047};
Line Loop(1049) = {316, -342, -93, 334};
Ruled Surface(1050) = {1049};
Line Loop(1051) = {320, -341, -97, 333};
Ruled Surface(1052) = {1051};
Line Loop(1053) = {319, -340, -96, 332};
Ruled Surface(1054) = {1053};
Line Loop(1055) = {305, -331, -82, 339};
Ruled Surface(1056) = {1055};
Line Loop(1057) = {303, -338, -80, 330};
Ruled Surface(1058) = {1057};
Line Loop(1059) = {304, -337, -81, 345};
Ruled Surface(1060) = {1059};
Line Loop(1061) = {308, -344, -85, 336};
Ruled Surface(1062) = {1061};
Line Loop(1063) = {315, -343, -92, 335};
Ruled Surface(1064) = {1063};
Line Loop(1065) = {324, -342, -101, 341};
Ruled Surface(1066) = {1065};
Line Loop(1067) = {323, -341, -100, 340};
Ruled Surface(1068) = {1067};
Line Loop(1069) = {322, -340, -99, 339};
Ruled Surface(1070) = {1069};
Line Loop(1071) = {321, -339, -98, 338};
Ruled Surface(1072) = {1071};
Line Loop(1073) = {325, -343, -102, 342};
Ruled Surface(1074) = {1073};
Line Loop(1075) = {326, -344, -103, 343};
Ruled Surface(1076) = {1075};
Line Loop(1077) = {327, -345, -104, 344};
Ruled Surface(1078) = {1077};
Line Loop(1079) = {328, -338, -105, 345};
Ruled Surface(1080) = {1079};

Surface Loop(2001) = {1002, 200, 1034, 1028, 1036, 1026};
Volume(2002) = {2001}; 
Surface Loop(2003) = {1004, 202, 1028, 1038, 1040, 1030};
Volume(2004) = {2003}; 
Surface Loop(2005) = {1006, 204, 1030, 1044, 1042, 1032};
Volume(2006) = {2005}; 
Surface Loop(2007) = {1008, 206, 1026, 1046, 1048, 1032};
Volume(2008) = {2007}; 
Surface Loop(2009) = {1010, 208, 1034, 1066, 1050, 1052};
Volume(2010) = {2009}; 
Surface Loop(2011) = {1024, 222, 1052, 1054, 1036, 1068};
Volume(2012) = {2011}; 
Surface Loop(2013) = {1022, 220, 1038, 1070, 1054, 1056};
Volume(2014) = {2013}; 
Surface Loop(2015) = {1020, 218, 1056, 1058, 1072, 1040};
Volume(2016) = {2015}; 
Surface Loop(2017) = {1018, 216, 1058, 1060, 1042, 1080};
Volume(2018) = {2017}; 
Surface Loop(2019) = {1016, 214, 1060, 1062, 1044, 1078};
Volume(2020) = {2019}; 
Surface Loop(2021) = {1014, 212, 1062, 1064, 1046, 1076};
Volume(2022) = {2021}; 
Surface Loop(2023) = {1012, 210, 1064, 1050, 1048, 1074};
Volume(2024) = {2023};

// ================================== //
// Set transfinite lines (cylinder 2) //
// ================================== //

numPoints4 = numElementPerWavelength * (lengthLayer2 - lengthLayer1) / wavelength;

Transfinite Line {309, 310, 311, 314, 306, 301, 302, 307, 312, 313, 317, 318} = numPoints1;
Transfinite Line {321, 322, 323, 324, 325, 326, 327, 328} = numPoints1;
Transfinite Line {303, 304, 308, 315, 316, 320, 319, 305} = numPoints1;
Transfinite Line {329, 330, 331, 332, 333, 334, 335, 336} = numPoints4;
Transfinite Line {337, 338, 339, 340, 341, 342, 343, 344, 345} = numPoints4;


// ------------------------------------------------------------------------- //
// Extra layer 2                                                             //
// ------------------------------------------------------------------------- //

Point(88) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), lengthLayer2, 1.0};
Point(89) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), lengthLayer2, 1.0};
Point(90) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), lengthLayer2, 1.0};
Point(91) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), lengthLayer2, 1.0};
Point(92) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), lengthLayer2, 1.0};
Point(93) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), lengthLayer2, 1.0};
Point(94) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), lengthLayer2, 1.0};
Point(95) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), lengthLayer2, 1.0};

Line(401) = {72, 88};
Line(402) = {73, 89};
Line(403) = {74, 90};
Line(404) = {75, 91};
Line(405) = {76, 92};
Line(406) = {77, 93};
Line(407) = {78, 94};
Line(408) = {79, 95};
Circle(409) = {88, 71, 89};
Circle(410) = {89, 71, 90};
Circle(411) = {90, 71, 91};
Circle(412) = {91, 71, 92};
Circle(413) = {92, 71, 93};
Circle(414) = {93, 71, 94};
Circle(415) = {94, 71, 95};
Circle(416) = {95, 71, 88};
Line(417) = {62, 88};
Line(418) = {63, 89};
Line(419) = {64, 90};
Line(420) = {65, 91};
Line(421) = {66, 92};
Line(422) = {67, 93};
Line(423) = {68, 94};
Line(424) = {69, 95};

Line Loop(3001) = {247, 418, -409, -417};
Ruled Surface(3002) = {3001};
Line Loop(3003) = {248, 419, -410, -418};
Ruled Surface(3004) = {3003};
Line Loop(3005) = {249, 420, -411, -419};
Ruled Surface(3006) = {3005};
Line Loop(3007) = {250, 421, -412, -420};
Ruled Surface(3008) = {3007};
Line Loop(3009) = {251, 422, -413, -421};
Ruled Surface(3010) = {3009};
Line Loop(3011) = {252, 423, -414, -422};
Ruled Surface(3012) = {3011};
Line Loop(3013) = {253, 424, -415, -423};
Ruled Surface(3014) = {3013};
Line Loop(3015) = {254, 417, -416, -424};
Ruled Surface(3016) = {3015};

Line Loop(3017) = {401, 409, -402, 324};
Ruled Surface(3018) = {3017};
Line Loop(3019) = {402, 410, -403, 323};
Ruled Surface(3020) = {3019};
Line Loop(3021) = {403, 411, -404, 322};
Ruled Surface(3022) = {3021};
Line Loop(3023) = {404, 412, -405, 321};
Ruled Surface(3024) = {3023};
Line Loop(3025) = {405, 413, -406, 328};
Ruled Surface(3026) = {3025};
Line Loop(3027) = {406, 414, -407, 327};
Ruled Surface(3028) = {3027};
Line Loop(3029) = {407, 415, -408, 326};
Ruled Surface(3030) = {3029};
Line Loop(3031) = {408, 416, -401, 325};
Ruled Surface(3032) = {3031};

Line Loop(3033) = {239, 417, -401, -342};
Ruled Surface(3034) = {3033};
Line Loop(3035) = {240, 418, -402, -341};
Ruled Surface(3036) = {3035};
Line Loop(3037) = {241, 419, -403, -340};
Ruled Surface(3038) = {3037};
Line Loop(3039) = {242, 420, -404, -339};
Ruled Surface(3040) = {3039};
Line Loop(3041) = {243, 421, -405, -338};
Ruled Surface(3042) = {3041};
Line Loop(3043) = {244, 422, -406, -345};
Ruled Surface(3044) = {3043};
Line Loop(3045) = {245, 423, -407, -344};
Ruled Surface(3046) = {3045};
Line Loop(3047) = {246, 424, -408, -343};
Ruled Surface(3048) = {3047};

Surface Loop(4001) = {334, 3002, 1066, 3018, 3034, 3036};
Volume(4002) = {4001};
Surface Loop(4003) = {336, 3004, 1068, 3020, 3036, 3038};
Volume(4004) = {4003};
Surface Loop(4005) = {338, 3006, 1070, 3022, 3038, 3040};
Volume(4006) = {4005};
Surface Loop(4007) = {340, 3008, 1072, 3024, 3040, 3042};
Volume(4008) = {4007};
Surface Loop(4009) = {342, 3010, 1080, 3026, 3042, 3044};
Volume(4010) = {4009};
Surface Loop(4011) = {344, 3012, 1078, 3028, 3044, 3046};
Volume(4012) = {4011};
Surface Loop(4013) = {346, 3014, 1076, 3030, 3046, 3048};
Volume(4014) = {4013};
Surface Loop(4015) = {348, 3016, 1074, 3032, 3048, 3034};
Volume(4016) = {4015};

// ===================================== //
// Set transfinite lines (extra layer 2) //
// ===================================== //

Transfinite Line {401, 402, 403, 404, 405, 406, 407, 408} = numPoints3;
Transfinite Line {409, 410, 411, 412, 413, 414, 415, 416} = numPoints1;
Transfinite Line {417, 418, 419, 420, 421, 422, 423, 424} = numPoints4;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 3)                                                        //
// ------------------------------------------------------------------------- //

lengthLayer3 = lengthLayer2 + 0.0015;

Point(96) = {0.0, 0.0, lengthLayer3, 1.0};
Point(97) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), lengthLayer3, 1.0};
Point(98) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), lengthLayer3, 1.0};
Point(99) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), lengthLayer3, 1.0};
Point(100) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), lengthLayer3, 1.0};
Point(101) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), lengthLayer3, 1.0};
Point(102) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), lengthLayer3, 1.0};
Point(103) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), lengthLayer3, 1.0};
Point(104) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), lengthLayer3, 1.0};
Point(105) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), lengthLayer3, 1.0};
Point(106) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), lengthLayer3, 1.0};
Point(107) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), lengthLayer3, 1.0};
Point(108) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), lengthLayer3, 1.0};
Point(109) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), lengthLayer3, 1.0};
Point(110) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), lengthLayer3, 1.0};
Point(111) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), lengthLayer3, 1.0};
Point(112) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), lengthLayer3, 1.0};

Line(501) = {109, 108};
Line(502) = {109, 110};
Line(503) = {109, 101};
Line(504) = {102, 110};
Line(505) = {100, 108};
Line(506) = {108, 107};
Line(507) = {110, 111};
Line(508) = {111, 103};
Line(509) = {111, 96};
Line(510) = {96, 109};
Line(511) = {96, 107};
Line(512) = {111, 112};
Line(513) = {112, 105};
Line(514) = {105, 96};
Line(515) = {112, 104};
Line(516) = {105, 97};
Line(517) = {105, 106};
Line(518) = {106, 107};
Line(519) = {107, 99};
Line(520) = {106, 98};
Circle(521) = {101, 96, 100};
Circle(522) = {100, 96, 99};
Circle(523) = {99, 96, 98};
Circle(524) = {98, 96, 97}; 
Circle(525) = {97, 96, 104}; 
Circle(526) = {104, 96, 103}; 
Circle(527) = {103, 96, 102}; 
Circle(528) = {102, 96, 101}; 
Line(529) = {71, 96};  
Line(530) = {84, 109}; 
Line(531) = {83, 108}; 
Line(532) = {82, 107}; 
Line(533) = {81, 106}; 
Line(534) = {80, 105}; 
Line(535) = {87, 112}; 
Line(536) = {86, 111}; 
Line(537) = {85, 110}; 
Line(538) = {76, 101}; 
Line(539) = {75, 100}; 
Line(540) = {74, 99}; 
Line(541) = {73, 98}; 
Line(542) = {72, 97}; 
Line(543) = {79, 104}; 
Line(544) = {78, 103}; 
Line(545) = {77, 102};

Line Loop(5001) = {514, 511, -518, -517};
Ruled Surface(5002) = {5001};
Line Loop(5003) = {510, 501, 506, -511};
Ruled Surface(5004) = {5003};
Line Loop(5005) = {510, 502, 507, 509};
Ruled Surface(5006) = {5005};
Line Loop(5007) = {509, -514, -513, -512};
Ruled Surface(5008) = {5007}; 
Line Loop(5009) = {516, -524, -520, -517};
Ruled Surface(5010) = {5009}; 
Line Loop(5011) = {513, 516, 525, -515};
Ruled Surface(5012) = {5011}; 
Line Loop(5013) = {512, 515, 526, -508}; 
Ruled Surface(5014) = {5013};
Line Loop(5015) = {507, 508, 527, 504};
Ruled Surface(5016) = {5015};
Line Loop(5017) = {504, -502, 503, -528};
Ruled Surface(5018) = {5017};
Line Loop(5019) = {521, 505, -501, 503};
Ruled Surface(5020) = {5019};
Line Loop(5021) = {522, -519, -506, -505};
Ruled Surface(5022) = {5021};
Line Loop(5023) = {523, -520, 518, 519};
Ruled Surface(5024) = {5023};
Line Loop(5025) = {534, 514, -529, -314};
Ruled Surface(5026) = {5025};
Line Loop(5027) = {529, 511, -532, -311};
Ruled Surface(5028) = {5027};
Line Loop(5029) = {529, 510, -530, -310};
Ruled Surface(5030) = {5029};
Line Loop(5031) = {509, -529, -309, 536};
Ruled Surface(5032) = {5031};
Line Loop(5033) = {517, -533, -317, 534};
Ruled Surface(5034) = {5033};
Line Loop(5035) = {518, -532, -318, 533};
Ruled Surface(5036) = {5035};
Line Loop(5037) = {506, -532, -306, 531};
Ruled Surface(5038) = {5037};
Line Loop(5039) = {501, -531, -301, 530};
Ruled Surface(5040) = {5039};
Line Loop(5041) = {502, -537, -302, 530};
Ruled Surface(5042) = {5041};
Line Loop(5043) = {507, -536, -307, 537};
Ruled Surface(5044) = {5043};
Line Loop(5045) = {512, -535, -312, 536};
Ruled Surface(5046) = {5045};
Line Loop(5047) = {535, 513, -534, -313};
Ruled Surface(5048) = {5047};
Line Loop(5049) = {516, -542, -316, 534};
Ruled Surface(5050) = {5049};
Line Loop(5051) = {520, -541, -320, 533};
Ruled Surface(5052) = {5051};
Line Loop(5053) = {519, -540, -319, 532};
Ruled Surface(5054) = {5053};
Line Loop(5055) = {505, -531, -305, 539};
Ruled Surface(5056) = {5055};
Line Loop(5057) = {503, -538, -303, 530};
Ruled Surface(5058) = {5057};
Line Loop(5059) = {504, -537, -304, 545};
Ruled Surface(5060) = {5059};
Line Loop(5061) = {508, -544, -308, 536};
Ruled Surface(5062) = {5061};
Line Loop(5063) = {515, -543, -315, 535};
Ruled Surface(5064) = {5063};
Line Loop(5065) = {524, -542, -324, 541};
Ruled Surface(5066) = {5065};
Line Loop(5067) = {523, -541, -323, 540};
Ruled Surface(5068) = {5067};
Line Loop(5069) = {522, -540, -322, 539};
Ruled Surface(5070) = {5069};
Line Loop(5071) = {521, -539, -321, 538};
Ruled Surface(5072) = {5071};
Line Loop(5073) = {525, -543, -325, 542};
Ruled Surface(5074) = {5073};
Line Loop(5075) = {526, -544, -326, 543};
Ruled Surface(5076) = {5075};
Line Loop(5077) = {527, -545, -327, 544};
Ruled Surface(5078) = {5077};
Line Loop(5079) = {528, -538, -328, 545};
Ruled Surface(5080) = {5079};

Surface Loop(6001) = {5002, 1002, 5034, 5028, 5036, 5026};
Volume(6002) = {6001}; 
Surface Loop(6003) = {5004, 1004, 5028, 5038, 5040, 5030};
Volume(6004) = {6003}; 
Surface Loop(6005) = {5006, 1006, 5030, 5044, 5042, 5032};
Volume(6006) = {6005}; 
Surface Loop(6007) = {5008, 1008, 5026, 5046, 5048, 5032};
Volume(6008) = {6007}; 
Surface Loop(6009) = {5010, 1010, 5034, 5066, 5050, 5052};
Volume(6010) = {6009}; 
Surface Loop(6011) = {5024, 1024, 5052, 5054, 5036, 5068};
Volume(6012) = {6011}; 
Surface Loop(6013) = {5022, 1022, 5038, 5070, 5054, 5056};
Volume(6014) = {6013}; 
Surface Loop(6015) = {5020, 1020, 5056, 5058, 5072, 5040};
Volume(6016) = {6015}; 
Surface Loop(6017) = {5018, 1018, 5058, 5060, 5042, 5080};
Volume(6018) = {6017}; 
Surface Loop(6019) = {5016, 1016, 5060, 5062, 5044, 5078};
Volume(6020) = {6019}; 
Surface Loop(6021) = {5014, 1014, 5062, 5064, 5046, 5076};
Volume(6022) = {6021}; 
Surface Loop(6023) = {5012, 1012, 5064, 5050, 5048, 5074};
Volume(6024) = {6023};

// ================================== //
// Set transfinite lines (cylinder 3) //
// ================================== //

numPoints5 = numElementPerWavelength * (lengthLayer3 - lengthLayer2) / wavelength;

Transfinite Line {509, 510, 511, 514, 506, 501, 502, 507, 512, 513, 517, 518} = numPoints1;
Transfinite Line {521, 522, 523, 524, 525, 526, 527, 528} = numPoints1;
Transfinite Line {503, 504, 508, 515, 516, 520, 519, 505} = numPoints1;
Transfinite Line {529, 530, 531, 532, 533, 534, 535, 536} = numPoints5;
Transfinite Line {537, 538, 539, 540, 541, 542, 543, 544, 545} = numPoints5;

// ------------------------------------------------------------------------- //
// Extra layer 3                                                             //
// ------------------------------------------------------------------------- //

Point(113) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), lengthLayer3, 1.0};
Point(114) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), lengthLayer3, 1.0};
Point(115) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), lengthLayer3, 1.0};
Point(116) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), lengthLayer3, 1.0};
Point(117) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), lengthLayer3, 1.0};
Point(118) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), lengthLayer3, 1.0};
Point(119) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), lengthLayer3, 1.0};
Point(120) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), lengthLayer3, 1.0};

Line(601) = {97, 113};
Line(602) = {98, 114};
Line(603) = {99, 115};
Line(604) = {100, 116};
Line(605) = {101, 117};
Line(606) = {102, 118};
Line(607) = {103, 119};
Line(608) = {104, 120};
Circle(609) = {113, 96, 114};
Circle(610) = {114, 96, 115};
Circle(611) = {115, 96, 116};
Circle(612) = {116, 96, 117};
Circle(613) = {117, 96, 118};
Circle(614) = {118, 96, 119};
Circle(615) = {119, 96, 120};
Circle(616) = {120, 96, 113};
Line(617) = {88, 113};
Line(618) = {89, 114};
Line(619) = {90, 115};
Line(620) = {91, 116};
Line(621) = {92, 117};
Line(622) = {93, 118};
Line(623) = {94, 119};
Line(624) = {95, 120};

Line Loop(7001) = {409, 618, -609, -617};
Ruled Surface(7002) = {7001};
Line Loop(7003) = {410, 619, -610, -618};
Ruled Surface(7004) = {7003};
Line Loop(7005) = {411, 620, -611, -619};
Ruled Surface(7006) = {7005};
Line Loop(7007) = {412, 621, -612, -620};
Ruled Surface(7008) = {7007};
Line Loop(7009) = {413, 622, -613, -621};
Ruled Surface(7010) = {7009};
Line Loop(7011) = {414, 623, -614, -622};
Ruled Surface(7012) = {7011};
Line Loop(7013) = {415, 624, -615, -623};
Ruled Surface(7014) = {7013};
Line Loop(7015) = {416, 617, -616, -624};
Ruled Surface(7016) = {7015};

Line Loop(7017) = {601, 609, -602, 524};
Ruled Surface(7018) = {7017};
Line Loop(7019) = {602, 610, -603, 523};
Ruled Surface(7020) = {7019};
Line Loop(7021) = {603, 611, -604, 522};
Ruled Surface(7022) = {7021};
Line Loop(7023) = {604, 612, -605, 521};
Ruled Surface(7024) = {7023};
Line Loop(7025) = {605, 613, -606, 528};
Ruled Surface(7026) = {7025};
Line Loop(7027) = {606, 614, -607, 527};
Ruled Surface(7028) = {7027};
Line Loop(7029) = {607, 615, -608, 526};
Ruled Surface(7030) = {7029};
Line Loop(7031) = {608, 616, -601, 525};
Ruled Surface(7032) = {7031};

Line Loop(7033) = {401, 617, -601, -542};
Ruled Surface(7034) = {7033};
Line Loop(7035) = {402, 618, -602, -541};
Ruled Surface(7036) = {7035};
Line Loop(7037) = {403, 619, -603, -540};
Ruled Surface(7038) = {7037};
Line Loop(7039) = {404, 620, -604, -539};
Ruled Surface(7040) = {7039};
Line Loop(7041) = {405, 621, -605, -538};
Ruled Surface(7042) = {7041};
Line Loop(7043) = {406, 622, -606, -545};
Ruled Surface(7044) = {7043};
Line Loop(7045) = {407, 623, -607, -544};
Ruled Surface(7046) = {7045};
Line Loop(7047) = {408, 624, -608, -543};
Ruled Surface(7048) = {7047};

Surface Loop(8001) = {3018, 7002, 5066, 7018, 7034, 7036};
Volume(8002) = {8001};
Surface Loop(8003) = {3020, 7004, 5068, 7020, 7036, 7038};
Volume(8004) = {8003};
Surface Loop(8005) = {3022, 7006, 5070, 7022, 7038, 7040};
Volume(8006) = {8005};
Surface Loop(8007) = {3024, 7008, 5072, 7024, 7040, 7042};
Volume(8008) = {8007};
Surface Loop(8009) = {3026, 7010, 5080, 7026, 7042, 7044};
Volume(8010) = {8009};
Surface Loop(8011) = {3028, 7012, 5078, 7028, 7044, 7046};
Volume(8012) = {8011};
Surface Loop(8013) = {3030, 7014, 5076, 7030, 7046, 7048};
Volume(8014) = {8013};
Surface Loop(8015) = {3032, 7016, 5074, 7032, 7048, 7034};
Volume(8016) = {8015};

// ===================================== //
// Set transfinite lines (extra layer 3) //
// ===================================== //

Transfinite Line {601, 602, 603, 604, 605, 606, 607, 608} = numPoints3;
Transfinite Line {609, 610, 611, 612, 613, 614, 615, 616} = numPoints1;
Transfinite Line {617, 618, 619, 620, 621, 622, 623, 624} = numPoints5;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 4)                                                        //
// ------------------------------------------------------------------------- //

lengthLayer4 = lengthLayer3 + 0.004;

Point(121) = {0.0, 0.0, lengthLayer4, 1.0};
Point(122) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), lengthLayer4, 1.0};
Point(123) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), lengthLayer4, 1.0};
Point(124) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), lengthLayer4, 1.0};
Point(125) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), lengthLayer4, 1.0};
Point(126) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), lengthLayer4, 1.0};
Point(127) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), lengthLayer4, 1.0};
Point(128) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), lengthLayer4, 1.0};
Point(129) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), lengthLayer4, 1.0};
Point(130) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), lengthLayer4, 1.0};
Point(131) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), lengthLayer4, 1.0};
Point(132) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), lengthLayer4, 1.0};
Point(133) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), lengthLayer4, 1.0};
Point(134) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), lengthLayer4, 1.0};
Point(135) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), lengthLayer4, 1.0};
Point(136) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), lengthLayer4, 1.0};
Point(137) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), lengthLayer4, 1.0};

Line(701) = {134, 133};
Line(702) = {134, 135};
Line(703) = {134, 126};
Line(704) = {127, 135};
Line(705) = {125, 133};
Line(706) = {133, 132};
Line(707) = {135, 136};
Line(708) = {136, 128};
Line(709) = {136, 121};
Line(710) = {121, 134};
Line(711) = {121, 132};
Line(712) = {136, 137};
Line(713) = {137, 130};
Line(714) = {130, 121};
Line(715) = {137, 129};
Line(716) = {130, 122};
Line(717) = {130, 131};
Line(718) = {131, 132};
Line(719) = {132, 124};
Line(720) = {131, 123};
Circle(721) = {126, 121, 125};
Circle(722) = {125, 121, 124};
Circle(723) = {124, 121, 123};
Circle(724) = {123, 121, 122}; 
Circle(725) = {122, 121, 129}; 
Circle(726) = {129, 121, 128}; 
Circle(727) = {128, 121, 127}; 
Circle(728) = {127, 121, 126}; 
Line(729) = {96, 121};  
Line(730) = {109, 134}; 
Line(731) = {108, 133}; 
Line(732) = {107, 132}; 
Line(733) = {106, 131}; 
Line(734) = {105, 130}; 
Line(735) = {112, 137}; 
Line(736) = {111, 136}; 
Line(737) = {110, 135}; 
Line(738) = {101, 126}; 
Line(739) = {100, 125}; 
Line(740) = {99, 124}; 
Line(741) = {98, 123}; 
Line(742) = {97, 122}; 
Line(743) = {104, 129}; 
Line(744) = {103, 128}; 
Line(745) = {102, 127};

Line Loop(9001) = {714, 711, -718, -717};
Ruled Surface(9002) = {9001};
Line Loop(9003) = {710, 701, 706, -711};
Ruled Surface(9004) = {9003};
Line Loop(9005) = {710, 702, 707, 709};
Ruled Surface(9006) = {9005};
Line Loop(9007) = {709, -714, -713, -712};
Ruled Surface(9008) = {9007}; 
Line Loop(9009) = {716, -724, -720, -717};
Ruled Surface(9010) = {9009}; 
Line Loop(9011) = {713, 716, 725, -715};
Ruled Surface(9012) = {9011}; 
Line Loop(9013) = {712, 715, 726, -708}; 
Ruled Surface(9014) = {9013};
Line Loop(9015) = {707, 708, 727, 704};
Ruled Surface(9016) = {9015};
Line Loop(9017) = {704, -702, 703, -728};
Ruled Surface(9018) = {9017};
Line Loop(9019) = {721, 705, -701, 703};
Ruled Surface(9020) = {9019};
Line Loop(9021) = {722, -719, -706, -705};
Ruled Surface(9022) = {9021};
Line Loop(9023) = {723, -720, 718, 719};
Ruled Surface(9024) = {9023};
Line Loop(9025) = {734, 714, -729, -514};
Ruled Surface(9026) = {9025};
Line Loop(9027) = {729, 711, -732, -511};
Ruled Surface(9028) = {9027};
Line Loop(9029) = {729, 710, -730, -510};
Ruled Surface(9030) = {9029};
Line Loop(9031) = {709, -729, -509, 736};
Ruled Surface(9032) = {9031};
Line Loop(9033) = {717, -733, -517, 734};
Ruled Surface(9034) = {9033};
Line Loop(9035) = {718, -732, -518, 733};
Ruled Surface(9036) = {9035};
Line Loop(9037) = {706, -732, -506, 731};
Ruled Surface(9038) = {9037};
Line Loop(9039) = {701, -731, -501, 730};
Ruled Surface(9040) = {9039};
Line Loop(9041) = {702, -737, -502, 730};
Ruled Surface(9042) = {9041};
Line Loop(9043) = {707, -736, -507, 737};
Ruled Surface(9044) = {9043};
Line Loop(9045) = {712, -735, -512, 736};
Ruled Surface(9046) = {9045};
Line Loop(9047) = {735, 713, -734, -513};
Ruled Surface(9048) = {9047};
Line Loop(9049) = {716, -742, -516, 734};
Ruled Surface(9050) = {9049};
Line Loop(9051) = {720, -741, -520, 733};
Ruled Surface(9052) = {9051};
Line Loop(9053) = {719, -740, -519, 732};
Ruled Surface(9054) = {9053};
Line Loop(9055) = {705, -731, -505, 739};
Ruled Surface(9056) = {9055};
Line Loop(9057) = {703, -738, -503, 730};
Ruled Surface(9058) = {9057};
Line Loop(9059) = {704, -737, -504, 745};
Ruled Surface(9060) = {9059};
Line Loop(9061) = {708, -744, -508, 736};
Ruled Surface(9062) = {9061};
Line Loop(9063) = {715, -743, -515, 735};
Ruled Surface(9064) = {9063};
Line Loop(9065) = {724, -742, -524, 741};
Ruled Surface(9066) = {9065};
Line Loop(9067) = {723, -741, -523, 740};
Ruled Surface(9068) = {9067};
Line Loop(9069) = {722, -740, -522, 739};
Ruled Surface(9070) = {9069};
Line Loop(9071) = {721, -739, -521, 738};
Ruled Surface(9072) = {9071};
Line Loop(9073) = {725, -743, -525, 742};
Ruled Surface(9074) = {9073};
Line Loop(9075) = {726, -744, -526, 743};
Ruled Surface(9076) = {9075};
Line Loop(9077) = {727, -745, -527, 744};
Ruled Surface(9078) = {9077};
Line Loop(9079) = {728, -738, -528, 745};
Ruled Surface(9080) = {9079};

Surface Loop(10001) = {9002, 5002, 9034, 9028, 9036, 9026};
Volume(10002) = {10001}; 
Surface Loop(10003) = {9004, 5004, 9028, 9038, 9040, 9030};
Volume(10004) = {10003}; 
Surface Loop(10005) = {9006, 5006, 9030, 9044, 9042, 9032};
Volume(10006) = {10005}; 
Surface Loop(10007) = {9008, 5008, 9026, 9046, 9048, 9032};
Volume(10008) = {10007}; 
Surface Loop(10009) = {9010, 5010, 9034, 9066, 9050, 9052};
Volume(10010) = {10009}; 
Surface Loop(10011) = {9024, 5024, 9052, 9054, 9036, 9068};
Volume(10012) = {10011}; 
Surface Loop(10013) = {9022, 5022, 9038, 9070, 9054, 9056};
Volume(10014) = {10013}; 
Surface Loop(10015) = {9020, 5020, 9056, 9058, 9072, 9040};
Volume(10016) = {10015}; 
Surface Loop(10017) = {9018, 5018, 9058, 9060, 9042, 9080};
Volume(10018) = {10017}; 
Surface Loop(10019) = {9016, 5016, 9060, 9062, 9044, 9078};
Volume(10020) = {10019}; 
Surface Loop(10021) = {9014, 5014, 9062, 9064, 9046, 9076};
Volume(10022) = {10021}; 
Surface Loop(10023) = {9012, 5012, 9064, 9050, 9048, 9074};
Volume(10024) = {10023};

// ================================== //
// Set transfinite lines (cylinder 4) //
// ================================== //

numPoints6 = numElementPerWavelength * (lengthLayer4 - lengthLayer3) / wavelength;

Transfinite Line {709, 710, 711, 714, 706, 701, 702, 707, 712, 713, 717, 718} = numPoints1;
Transfinite Line {721, 722, 723, 724, 725, 726, 727, 728} = numPoints1;
Transfinite Line {703, 704, 708, 715, 716, 720, 719, 705} = numPoints1;
Transfinite Line {729, 730, 731, 732, 733, 734, 735, 736} = numPoints6;
Transfinite Line {737, 738, 739, 740, 741, 742, 743, 744, 745} = numPoints6;


// ------------------------------------------------------------------------- //
// Extra layer 4                                                             //
// ------------------------------------------------------------------------- //

Point(138) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), lengthLayer4, 1.0};
Point(139) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), lengthLayer4, 1.0};
Point(140) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), lengthLayer4, 1.0};
Point(141) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), lengthLayer4, 1.0};
Point(142) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), lengthLayer4, 1.0};
Point(143) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), lengthLayer4, 1.0};
Point(144) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), lengthLayer4, 1.0};
Point(145) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), lengthLayer4, 1.0};

Line(801) = {122, 138};
Line(802) = {123, 139};
Line(803) = {124, 140};
Line(804) = {125, 141};
Line(805) = {126, 142};
Line(806) = {127, 143};
Line(807) = {128, 144};
Line(808) = {129, 145};
Circle(809) = {138, 121, 139};
Circle(810) = {139, 121, 140};
Circle(811) = {140, 121, 141};
Circle(812) = {141, 121, 142};
Circle(813) = {142, 121, 143};
Circle(814) = {143, 121, 144};
Circle(815) = {144, 121, 145};
Circle(816) = {145, 121, 138};
Line(817) = {113, 138};
Line(818) = {114, 139};
Line(819) = {115, 140};
Line(820) = {116, 141};
Line(821) = {117, 142};
Line(822) = {118, 143};
Line(823) = {119, 144};
Line(824) = {120, 145};

Line Loop(11001) = {609, 818, -809, -817};
Ruled Surface(11002) = {11001};
Line Loop(11003) = {610, 819, -810, -818};
Ruled Surface(11004) = {11003};
Line Loop(11005) = {611, 820, -811, -819};
Ruled Surface(11006) = {11005};
Line Loop(11007) = {612, 821, -812, -820};
Ruled Surface(11008) = {11007};
Line Loop(11009) = {613, 822, -813, -821};
Ruled Surface(11010) = {11009};
Line Loop(11011) = {614, 823, -814, -822};
Ruled Surface(11012) = {11011};
Line Loop(11013) = {615, 824, -815, -823};
Ruled Surface(11014) = {11013};
Line Loop(11015) = {616, 817, -816, -824};
Ruled Surface(11016) = {11015};

Line Loop(11017) = {801, 809, -802, 724};
Ruled Surface(11018) = {11017};
Line Loop(11019) = {802, 810, -803, 723};
Ruled Surface(11020) = {11019};
Line Loop(11021) = {803, 811, -804, 722};
Ruled Surface(11022) = {11021};
Line Loop(11023) = {804, 812, -805, 721};
Ruled Surface(11024) = {11023};
Line Loop(11025) = {805, 813, -806, 728};
Ruled Surface(11026) = {11025};
Line Loop(11027) = {806, 814, -807, 727};
Ruled Surface(11028) = {11027};
Line Loop(11029) = {807, 815, -808, 726};
Ruled Surface(11030) = {11029};
Line Loop(11031) = {808, 816, -801, 725};
Ruled Surface(11032) = {11031};

Line Loop(11033) = {601, 817, -801, -742};
Ruled Surface(11034) = {11033};
Line Loop(11035) = {602, 818, -802, -741};
Ruled Surface(11036) = {11035};
Line Loop(11037) = {603, 819, -803, -740};
Ruled Surface(11038) = {11037};
Line Loop(11039) = {604, 820, -804, -739};
Ruled Surface(11040) = {11039};
Line Loop(11041) = {605, 821, -805, -738};
Ruled Surface(11042) = {11041};
Line Loop(11043) = {606, 822, -806, -745};
Ruled Surface(11044) = {11043};
Line Loop(11045) = {607, 823, -807, -744};
Ruled Surface(11046) = {11045};
Line Loop(11047) = {608, 824, -808, -743};
Ruled Surface(11048) = {11047};

Surface Loop(12001) = {7018, 11002, 9066, 11018, 11034, 11036};
Volume(12002) = {12001};
Surface Loop(12003) = {7020, 11004, 9068, 11020, 11036, 11038};
Volume(12004) = {12003};
Surface Loop(12005) = {7022, 11006, 9070, 11022, 11038, 11040};
Volume(12006) = {12005};
Surface Loop(12007) = {7024, 11008, 9072, 11024, 11040, 11042};
Volume(12008) = {12007};
Surface Loop(12009) = {7026, 11010, 9080, 11026, 11042, 11044};
Volume(12010) = {12009};
Surface Loop(12011) = {7028, 11012, 9078, 11028, 11044, 11046};
Volume(12012) = {12011};
Surface Loop(12013) = {7030, 11014, 9076, 11030, 11046, 11048};
Volume(12014) = {12013};
Surface Loop(12015) = {7032, 11016, 9074, 11032, 11048, 11034};
Volume(12016) = {12015};

// ===================================== //
// Set transfinite lines (extra layer 4) //
// ===================================== //

Transfinite Line {801, 802, 803, 804, 805, 806, 807, 808} = numPoints3;
Transfinite Line {809, 810, 811, 812, 813, 814, 815, 816} = numPoints1;
Transfinite Line {817, 818, 819, 820, 821, 822, 823, 824} = numPoints6;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 5)                                                        //
// ------------------------------------------------------------------------- //

lengthLayer5 = lengthLayer4 + 0.001;

Point(146) = {0.0, 0.0, lengthLayer5, 1.0};
Point(147) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), lengthLayer5, 1.0};
Point(148) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), lengthLayer5, 1.0};
Point(149) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), lengthLayer5, 1.0};
Point(150) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), lengthLayer5, 1.0};
Point(151) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), lengthLayer5, 1.0};
Point(152) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), lengthLayer5, 1.0};
Point(153) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), lengthLayer5, 1.0};
Point(154) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), lengthLayer5, 1.0};
Point(155) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), lengthLayer5, 1.0};
Point(156) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), lengthLayer5, 1.0};
Point(157) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), lengthLayer5, 1.0};
Point(158) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), lengthLayer5, 1.0};
Point(159) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), lengthLayer5, 1.0};
Point(160) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), lengthLayer5, 1.0};
Point(161) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), lengthLayer5, 1.0};
Point(162) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), lengthLayer5, 1.0};

Line(901) = {159, 158};
Line(902) = {159, 160};
Line(903) = {159, 151};
Line(904) = {152, 160};
Line(905) = {150, 158};
Line(906) = {158, 157};
Line(907) = {160, 161};
Line(908) = {161, 153};
Line(909) = {161, 146};
Line(910) = {146, 159};
Line(911) = {146, 157};
Line(912) = {161, 162};
Line(913) = {162, 155};
Line(914) = {155, 146};
Line(915) = {162, 154};
Line(916) = {155, 147};
Line(917) = {155, 156};
Line(918) = {156, 157};
Line(919) = {157, 149};
Line(920) = {156, 148};
Circle(921) = {151, 146, 150};
Circle(922) = {150, 146, 149};
Circle(923) = {149, 146, 148};
Circle(924) = {148, 146, 147}; 
Circle(925) = {147, 146, 154}; 
Circle(926) = {154, 146, 153}; 
Circle(927) = {153, 146, 152}; 
Circle(928) = {152, 146, 151}; 
Line(929) = {121, 146};  
Line(930) = {134, 159}; 
Line(931) = {133, 158}; 
Line(932) = {132, 157}; 
Line(933) = {131, 156}; 
Line(934) = {130, 155}; 
Line(935) = {137, 162}; 
Line(936) = {136, 161}; 
Line(937) = {135, 160}; 
Line(938) = {126, 151}; 
Line(939) = {125, 150}; 
Line(940) = {124, 149}; 
Line(941) = {123, 148}; 
Line(942) = {122, 147}; 
Line(943) = {129, 154}; 
Line(944) = {128, 153}; 
Line(945) = {127, 152};

Line Loop(13001) = {914, 911, -918, -917};
Ruled Surface(13002) = {13001};
Line Loop(13003) = {910, 901, 906, -911};
Ruled Surface(13004) = {13003};
Line Loop(13005) = {910, 902, 907, 909};
Ruled Surface(13006) = {13005};
Line Loop(13007) = {909, -914, -913, -912};
Ruled Surface(13008) = {13007}; 
Line Loop(13009) = {916, -924, -920, -917};
Ruled Surface(13010) = {13009}; 
Line Loop(13011) = {913, 916, 925, -915};
Ruled Surface(13012) = {13011}; 
Line Loop(13013) = {912, 915, 926, -908}; 
Ruled Surface(13014) = {13013};
Line Loop(13015) = {907, 908, 927, 904};
Ruled Surface(13016) = {13015};
Line Loop(13017) = {904, -902, 903, -928};
Ruled Surface(13018) = {13017};
Line Loop(13019) = {921, 905, -901, 903};
Ruled Surface(13020) = {13019};
Line Loop(13021) = {922, -919, -906, -905};
Ruled Surface(13022) = {13021};
Line Loop(13023) = {923, -920, 918, 919};
Ruled Surface(13024) = {13023};
Line Loop(13025) = {934, 914, -929, -714};
Ruled Surface(13026) = {13025};
Line Loop(13027) = {929, 911, -932, -711};
Ruled Surface(13028) = {13027};
Line Loop(13029) = {929, 910, -930, -710};
Ruled Surface(13030) = {13029};
Line Loop(13031) = {909, -929, -709, 936};
Ruled Surface(13032) = {13031};
Line Loop(13033) = {917, -933, -717, 934};
Ruled Surface(13034) = {13033};
Line Loop(13035) = {918, -932, -718, 933};
Ruled Surface(13036) = {13035};
Line Loop(13037) = {906, -932, -706, 931};
Ruled Surface(13038) = {13037};
Line Loop(13039) = {901, -931, -701, 930};
Ruled Surface(13040) = {13039};
Line Loop(13041) = {902, -937, -702, 930};
Ruled Surface(13042) = {13041};
Line Loop(13043) = {907, -936, -707, 937};
Ruled Surface(13044) = {13043};
Line Loop(13045) = {912, -935, -712, 936};
Ruled Surface(13046) = {13045};
Line Loop(13047) = {935, 913, -934, -713};
Ruled Surface(13048) = {13047};
Line Loop(13049) = {916, -942, -716, 934};
Ruled Surface(13050) = {13049};
Line Loop(13051) = {920, -941, -720, 933};
Ruled Surface(13052) = {13051};
Line Loop(13053) = {919, -940, -719, 932};
Ruled Surface(13054) = {13053};
Line Loop(13055) = {905, -931, -705, 939};
Ruled Surface(13056) = {13055};
Line Loop(13057) = {903, -938, -703, 930};
Ruled Surface(13058) = {13057};
Line Loop(13059) = {904, -937, -704, 945};
Ruled Surface(13060) = {13059};
Line Loop(13061) = {908, -944, -708, 936};
Ruled Surface(13062) = {13061};
Line Loop(13063) = {915, -943, -715, 935};
Ruled Surface(13064) = {13063};
Line Loop(13065) = {924, -942, -724, 941};
Ruled Surface(13066) = {13065};
Line Loop(13067) = {923, -941, -723, 940};
Ruled Surface(13068) = {13067};
Line Loop(13069) = {922, -940, -722, 939};
Ruled Surface(13070) = {13069};
Line Loop(13071) = {921, -939, -721, 938};
Ruled Surface(13072) = {13071};
Line Loop(13073) = {925, -943, -725, 942};
Ruled Surface(13074) = {13073};
Line Loop(13075) = {926, -944, -726, 943};
Ruled Surface(13076) = {13075};
Line Loop(13077) = {927, -945, -727, 944};
Ruled Surface(13078) = {13077};
Line Loop(13079) = {928, -938, -728, 945};
Ruled Surface(13080) = {13079};

Surface Loop(14001) = {13002, 9002, 13034, 13028, 13036, 13026};
Volume(14002) = {14001}; 
Surface Loop(14003) = {13004, 9004, 13028, 13038, 13040, 13030};
Volume(14004) = {14003}; 
Surface Loop(14005) = {13006, 9006, 13030, 13044, 13042, 13032};
Volume(14006) = {14005}; 
Surface Loop(14007) = {13008, 9008, 13026, 13046, 13048, 13032};
Volume(14008) = {14007}; 
Surface Loop(14009) = {13010, 9010, 13034, 13066, 13050, 13052};
Volume(14010) = {14009}; 
Surface Loop(14011) = {13024, 9024, 13052, 13054, 13036, 13068};
Volume(14012) = {14011}; 
Surface Loop(14013) = {13022, 9022, 13038, 13070, 13054, 13056};
Volume(14014) = {14013}; 
Surface Loop(14015) = {13020, 9020, 13056, 13058, 13072, 13040};
Volume(14016) = {14015}; 
Surface Loop(14017) = {13018, 9018, 13058, 13060, 13042, 13080};
Volume(14018) = {14017}; 
Surface Loop(14019) = {13016, 9016, 13060, 13062, 13044, 13078};
Volume(14020) = {14019}; 
Surface Loop(14021) = {13014, 9014, 13062, 13064, 13046, 13076};
Volume(14022) = {14021}; 
Surface Loop(14023) = {13012, 9012, 13064, 13050, 13048, 13074};
Volume(14024) = {14023};

// ================================== //
// Set transfinite lines (cylinder 5) //
// ================================== //

numPoints7 = numElementPerWavelength * (lengthLayer5 - lengthLayer4) / wavelength;

Transfinite Line {909, 910, 911, 914, 906, 901, 902, 907, 912, 913, 917, 918} = numPoints1;
Transfinite Line {921, 922, 923, 924, 925, 926, 927, 928} = numPoints1;
Transfinite Line {903, 904, 908, 915, 916, 920, 919, 905} = numPoints1;
Transfinite Line {929, 930, 931, 932, 933, 934, 935, 936} = numPoints7;
Transfinite Line {937, 938, 939, 940, 941, 942, 943, 944, 945} = numPoints7;


// ------------------------------------------------------------------------- //
// Extra layer 5                                                             //
// ------------------------------------------------------------------------- //

Point(163) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), lengthLayer5, 1.0};
Point(164) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), lengthLayer5, 1.0};
Point(165) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), lengthLayer5, 1.0};
Point(166) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), lengthLayer5, 1.0};
Point(167) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), lengthLayer5, 1.0};
Point(168) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), lengthLayer5, 1.0};
Point(169) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), lengthLayer5, 1.0};
Point(170) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), lengthLayer5, 1.0};

Line(1001) = {147, 163};
Line(1002) = {148, 164};
Line(1003) = {149, 165};
Line(1004) = {150, 166};
Line(1005) = {151, 167};
Line(1006) = {152, 168};
Line(1007) = {153, 169};
Line(1008) = {154, 170};
Circle(1009) = {163, 146, 164};
Circle(1010) = {164, 146, 165};
Circle(1011) = {165, 146, 166};
Circle(1012) = {166, 146, 167};
Circle(1013) = {167, 146, 168};
Circle(1014) = {168, 146, 169};
Circle(1015) = {169, 146, 170};
Circle(1016) = {170, 146, 163};
Line(1017) = {138, 163};
Line(1018) = {139, 164};
Line(1019) = {140, 165};
Line(1020) = {141, 166};
Line(1021) = {142, 167};
Line(1022) = {143, 168};
Line(1023) = {144, 169};
Line(1024) = {145, 170};

Line Loop(15001) = {809, 1018, -1009, -1017};
Ruled Surface(15002) = {15001};
Line Loop(15003) = {810, 1019, -1010, -1018};
Ruled Surface(15004) = {15003};
Line Loop(15005) = {811, 1020, -1011, -1019};
Ruled Surface(15006) = {15005};
Line Loop(15007) = {812, 1021, -1012, -1020};
Ruled Surface(15008) = {15007};
Line Loop(15009) = {813, 1022, -1013, -1021};
Ruled Surface(15010) = {15009};
Line Loop(15011) = {814, 1023, -1014, -1022};
Ruled Surface(15012) = {15011};
Line Loop(15013) = {815, 1024, -1015, -1023};
Ruled Surface(15014) = {15013};
Line Loop(15015) = {816, 1017, -1016, -1024};
Ruled Surface(15016) = {15015};

Line Loop(15017) = {1001, 1009, -1002, 924};
Ruled Surface(15018) = {15017};
Line Loop(15019) = {1002, 1010, -1003, 923};
Ruled Surface(15020) = {15019};
Line Loop(15021) = {1003, 1011, -1004, 922};
Ruled Surface(15022) = {15021};
Line Loop(15023) = {1004, 1012, -1005, 921};
Ruled Surface(15024) = {15023};
Line Loop(15025) = {1005, 1013, -1006, 928};
Ruled Surface(15026) = {15025};
Line Loop(15027) = {1006, 1014, -1007, 927};
Ruled Surface(15028) = {15027};
Line Loop(15029) = {1007, 1015, -1008, 926};
Ruled Surface(15030) = {15029};
Line Loop(15031) = {1008, 1016, -1001, 925};
Ruled Surface(15032) = {15031};

Line Loop(15033) = {801, 1017, -1001, -942};
Ruled Surface(15034) = {15033};
Line Loop(15035) = {802, 1018, -1002, -941};
Ruled Surface(15036) = {15035};
Line Loop(15037) = {803, 1019, -1003, -940};
Ruled Surface(15038) = {15037};
Line Loop(15039) = {804, 1020, -1004, -939};
Ruled Surface(15040) = {15039};
Line Loop(15041) = {805, 1021, -1005, -938};
Ruled Surface(15042) = {15041};
Line Loop(15043) = {806, 1022, -1006, -945};
Ruled Surface(15044) = {15043};
Line Loop(15045) = {807, 1023, -1007, -944};
Ruled Surface(15046) = {15045};
Line Loop(15047) = {808, 1024, -1008, -943};
Ruled Surface(15048) = {15047};

Surface Loop(16001) = {11018, 15002, 13066, 15018, 15034, 15036};
Volume(16002) = {16001};
Surface Loop(16003) = {11020, 15004, 13068, 15020, 15036, 15038};
Volume(16004) = {16003};
Surface Loop(16005) = {11022, 15006, 13070, 15022, 15038, 15040};
Volume(16006) = {16005};
Surface Loop(16007) = {11024, 15008, 13072, 15024, 15040, 15042};
Volume(16008) = {16007};
Surface Loop(16009) = {11026, 15010, 13080, 15026, 15042, 15044};
Volume(16010) = {16009};
Surface Loop(16011) = {11028, 15012, 13078, 15028, 15044, 15046};
Volume(16012) = {16011};
Surface Loop(16013) = {11030, 15014, 13076, 15030, 15046, 15048};
Volume(16014) = {16013};
Surface Loop(16015) = {11032, 15016, 13074, 15032, 15048, 15034};
Volume(16016) = {16015};

// ===================================== //
// Set transfinite lines (extra layer 5) //
// ===================================== //

Transfinite Line {1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008} = numPoints3;
Transfinite Line {1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016} = numPoints1;
Transfinite Line {1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024} = numPoints7;


// ------------------------------------------------------------------------- //
// Cylinder (Layer 6)                                                        //
// ------------------------------------------------------------------------- //

Point(171) = {0.0, 0.0, domainLength, 1.0};
Point(172) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), domainLength, 1.0};
Point(173) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), domainLength, 1.0};
Point(174) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), domainLength, 1.0};
Point(175) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), domainLength, 1.0};
Point(176) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), domainLength, 1.0};
Point(177) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), domainLength, 1.0};
Point(178) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), domainLength, 1.0};
Point(179) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), domainLength, 1.0};
Point(180) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), domainLength, 1.0};
Point(181) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), domainLength, 1.0};
Point(182) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), domainLength, 1.0};
Point(183) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), domainLength, 1.0};
Point(184) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), domainLength, 1.0};
Point(185) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), domainLength, 1.0};
Point(186) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), domainLength, 1.0};
Point(187) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), domainLength, 1.0};

Line(1101) = {184, 183};
Line(1102) = {184, 185};
Line(1103) = {184, 176};
Line(1104) = {177, 185};
Line(1105) = {175, 183};
Line(1106) = {183, 182};
Line(1107) = {185, 186};
Line(1108) = {186, 178};
Line(1109) = {186, 171};
Line(1110) = {171, 184};
Line(1111) = {171, 182};
Line(1112) = {186, 187};
Line(1113) = {187, 180};
Line(1114) = {180, 171};
Line(1115) = {187, 179};
Line(1116) = {180, 172};
Line(1117) = {180, 181};
Line(1118) = {181, 182};
Line(1119) = {182, 174};
Line(1120) = {181, 173};
Circle(1121) = {176, 171, 175};
Circle(1122) = {175, 171, 174};
Circle(1123) = {174, 171, 173};
Circle(1124) = {173, 171, 172}; 
Circle(1125) = {172, 171, 179}; 
Circle(1126) = {179, 171, 178}; 
Circle(1127) = {178, 171, 177}; 
Circle(1128) = {177, 171, 176}; 
Line(1129) = {146, 171};  
Line(1130) = {159, 184}; 
Line(1131) = {158, 183}; 
Line(1132) = {157, 182}; 
Line(1133) = {156, 181}; 
Line(1134) = {155, 180}; 
Line(1135) = {162, 187}; 
Line(1136) = {161, 186}; 
Line(1137) = {160, 185}; 
Line(1138) = {151, 176}; 
Line(1139) = {150, 175}; 
Line(1140) = {149, 174}; 
Line(1141) = {148, 173}; 
Line(1142) = {147, 172}; 
Line(1143) = {154, 179}; 
Line(1144) = {153, 178}; 
Line(1145) = {152, 177};

Line Loop(17001) = {1114, 1111, -1118, -1117};
Ruled Surface(17002) = {17001};
Line Loop(17003) = {1110, 1101, 1106, -1111};
Ruled Surface(17004) = {17003};
Line Loop(17005) = {1110, 1102, 1107, 1109};
Ruled Surface(17006) = {17005};
Line Loop(17007) = {1109, -1114, -1113, -1112};
Ruled Surface(17008) = {17007}; 
Line Loop(17009) = {1116, -1124, -1120, -1117};
Ruled Surface(17010) = {17009}; 
Line Loop(17011) = {1113, 1116, 1125, -1115};
Ruled Surface(17012) = {17011}; 
Line Loop(17013) = {1112, 1115, 1126, -1108}; 
Ruled Surface(17014) = {17013};
Line Loop(17015) = {1107, 1108, 1127, 1104};
Ruled Surface(17016) = {17015};
Line Loop(17017) = {1104, -1102, 1103, -1128};
Ruled Surface(17018) = {17017};
Line Loop(17019) = {1121, 1105, -1101, 1103};
Ruled Surface(17020) = {17019};
Line Loop(17021) = {1122, -1119, -1106, -1105};
Ruled Surface(17022) = {17021};
Line Loop(17023) = {1123, -1120, 1118, 1119};
Ruled Surface(17024) = {17023};
Line Loop(17025) = {1134, 1114, -1129, -914};
Ruled Surface(17026) = {17025};
Line Loop(17027) = {1129, 1111, -1132, -911};
Ruled Surface(17028) = {17027};
Line Loop(17029) = {1129, 1110, -1130, -910};
Ruled Surface(17030) = {17029};
Line Loop(17031) = {1109, -1129, -909, 1136};
Ruled Surface(17032) = {17031};
Line Loop(17033) = {1117, -1133, -917, 1134};
Ruled Surface(17034) = {17033};
Line Loop(17035) = {1118, -1132, -918, 1133};
Ruled Surface(17036) = {17035};
Line Loop(17037) = {1106, -1132, -906, 1131};
Ruled Surface(17038) = {17037};
Line Loop(17039) = {1101, -1131, -901, 1130};
Ruled Surface(17040) = {17039};
Line Loop(17041) = {1102, -1137, -902, 1130};
Ruled Surface(17042) = {17041};
Line Loop(17043) = {1107, -1136, -907, 1137};
Ruled Surface(17044) = {17043};
Line Loop(17045) = {1112, -1135, -912, 1136};
Ruled Surface(17046) = {17045};
Line Loop(17047) = {1135, 1113, -1134, -913};
Ruled Surface(17048) = {17047};
Line Loop(17049) = {1116, -1142, -916, 1134};
Ruled Surface(17050) = {17049};
Line Loop(17051) = {1120, -1141, -920, 1133};
Ruled Surface(17052) = {17051};
Line Loop(17053) = {1119, -1140, -919, 1132};
Ruled Surface(17054) = {17053};
Line Loop(17055) = {1105, -1131, -905, 1139};
Ruled Surface(17056) = {17055};
Line Loop(17057) = {1103, -1138, -903, 1130};
Ruled Surface(17058) = {17057};
Line Loop(17059) = {1104, -1137, -904, 1145};
Ruled Surface(17060) = {17059};
Line Loop(17061) = {1108, -1144, -908, 1136};
Ruled Surface(17062) = {17061};
Line Loop(17063) = {1115, -1143, -915, 1135};
Ruled Surface(17064) = {17063};
Line Loop(17065) = {1124, -1142, -924, 1141};
Ruled Surface(17066) = {17065};
Line Loop(17067) = {1123, -1141, -923, 1140};
Ruled Surface(17068) = {17067};
Line Loop(17069) = {1122, -1140, -922, 1139};
Ruled Surface(17070) = {17069};
Line Loop(17071) = {1121, -1139, -921, 1138};
Ruled Surface(17072) = {17071};
Line Loop(17073) = {1125, -1143, -925, 1142};
Ruled Surface(17074) = {17073};
Line Loop(17075) = {1126, -1144, -926, 1143};
Ruled Surface(17076) = {17075};
Line Loop(17077) = {1127, -1145, -927, 1144};
Ruled Surface(17078) = {17077};
Line Loop(17079) = {1128, -1138, -928, 1145};
Ruled Surface(17080) = {17079};

Surface Loop(18001) = {17002, 13002, 17034, 17028, 17036, 17026};
Volume(18002) = {18001}; 
Surface Loop(18003) = {17004, 13004, 17028, 17038, 17040, 17030};
Volume(18004) = {18003}; 
Surface Loop(18005) = {17006, 13006, 17030, 17044, 17042, 17032};
Volume(18006) = {18005}; 
Surface Loop(18007) = {17008, 13008, 17026, 17046, 17048, 17032};
Volume(18008) = {18007}; 
Surface Loop(18009) = {17010, 13010, 17034, 17066, 17050, 17052};
Volume(18010) = {18009}; 
Surface Loop(18011) = {17024, 13024, 17052, 17054, 17036, 17068};
Volume(18012) = {18011}; 
Surface Loop(18013) = {17022, 13022, 17038, 17070, 17054, 17056};
Volume(18014) = {18013}; 
Surface Loop(18015) = {17020, 13020, 17056, 17058, 17072, 17040};
Volume(18016) = {18015}; 
Surface Loop(18017) = {17018, 13018, 17058, 17060, 17042, 17080};
Volume(18018) = {18017}; 
Surface Loop(18019) = {17016, 13016, 17060, 17062, 17044, 17078};
Volume(18020) = {18019}; 
Surface Loop(18021) = {17014, 13014, 17062, 17064, 17046, 17076};
Volume(18022) = {18021}; 
Surface Loop(18023) = {17012, 13012, 17064, 17050, 17048, 17074};
Volume(18024) = {18023};

// ================================== //
// Set transfinite lines (cylinder 6) //
// ================================== //

numPoints8 = numElementPerWavelength * (domainLength - lengthLayer5) / wavelength;

Transfinite Line {1109, 1110, 1111, 1114, 1106, 1101, 1102, 1107, 1112, 1113, 1117, 1118} = numPoints1;
Transfinite Line {1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128} = numPoints1;
Transfinite Line {1103, 1104, 1108, 1115, 1116, 1120, 1119, 1105} = numPoints1;
Transfinite Line {1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136} = numPoints8;
Transfinite Line {1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145} = numPoints8;


// ------------------------------------------------------------------------- //
// Extra layer 5                                                             //
// ------------------------------------------------------------------------- //

Point(188) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), domainLength, 1.0};
Point(189) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), domainLength, 1.0};
Point(190) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), domainLength, 1.0};
Point(191) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), domainLength, 1.0};
Point(192) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), domainLength, 1.0};
Point(193) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), domainLength, 1.0};
Point(194) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), domainLength, 1.0};
Point(195) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), domainLength, 1.0};

Line(1201) = {172, 188};
Line(1202) = {173, 189};
Line(1203) = {174, 190};
Line(1204) = {175, 191};
Line(1205) = {176, 192};
Line(1206) = {177, 193};
Line(1207) = {178, 194};
Line(1208) = {179, 195};
Circle(1209) = {188, 171, 189};
Circle(1210) = {189, 171, 190};
Circle(1211) = {190, 171, 191};
Circle(1212) = {191, 171, 192};
Circle(1213) = {192, 171, 193};
Circle(1214) = {193, 171, 194};
Circle(1215) = {194, 171, 195};
Circle(1216) = {195, 171, 188};
Line(1217) = {163, 188};
Line(1218) = {164, 189};
Line(1219) = {165, 190};
Line(1220) = {166, 191};
Line(1221) = {167, 192};
Line(1222) = {168, 193};
Line(1223) = {169, 194};
Line(1224) = {170, 195};

Line Loop(19001) = {1009, 1218, -1209, -1217};
Ruled Surface(19002) = {19001};
Line Loop(19003) = {1010, 1219, -1210, -1218};
Ruled Surface(19004) = {19003};
Line Loop(19005) = {1011, 1220, -1211, -1219};
Ruled Surface(19006) = {19005};
Line Loop(19007) = {1012, 1221, -1212, -1220};
Ruled Surface(19008) = {19007};
Line Loop(19009) = {1013, 1222, -1213, -1221};
Ruled Surface(19010) = {19009};
Line Loop(19011) = {1014, 1223, -1214, -1222};
Ruled Surface(19012) = {19011};
Line Loop(19013) = {1015, 1224, -1215, -1223};
Ruled Surface(19014) = {19013};
Line Loop(19015) = {1016, 1217, -1216, -1224};
Ruled Surface(19016) = {19015};

Line Loop(19017) = {1201, 1209, -1202, 1124};
Ruled Surface(19018) = {19017};
Line Loop(19019) = {1202, 1210, -1203, 1123};
Ruled Surface(19020) = {19019};
Line Loop(19021) = {1203, 1211, -1204, 1122};
Ruled Surface(19022) = {19021};
Line Loop(19023) = {1204, 1212, -1205, 1121};
Ruled Surface(19024) = {19023};
Line Loop(19025) = {1205, 1213, -1206, 1128};
Ruled Surface(19026) = {19025};
Line Loop(19027) = {1206, 1214, -1207, 1127};
Ruled Surface(19028) = {19027};
Line Loop(19029) = {1207, 1215, -1208, 1126};
Ruled Surface(19030) = {19029};
Line Loop(19031) = {1208, 1216, -1201, 1125};
Ruled Surface(19032) = {19031};

Line Loop(19033) = {1001, 1217, -1201, -1142};
Ruled Surface(19034) = {19033};
Line Loop(19035) = {1002, 1218, -1202, -1141};
Ruled Surface(19036) = {19035};
Line Loop(19037) = {1003, 1219, -1203, -1140};
Ruled Surface(19038) = {19037};
Line Loop(19039) = {1004, 1220, -1204, -1139};
Ruled Surface(19040) = {19039};
Line Loop(19041) = {1005, 1221, -1205, -1138};
Ruled Surface(19042) = {19041};
Line Loop(19043) = {1006, 1222, -1206, -1145};
Ruled Surface(19044) = {19043};
Line Loop(19045) = {1007, 1223, -1207, -1144};
Ruled Surface(19046) = {19045};
Line Loop(19047) = {1008, 1224, -1208, -1143};
Ruled Surface(19048) = {19047};

Surface Loop(20001) = {15018, 19002, 17066, 19018, 19034, 19036};
Volume(20002) = {20001};
Surface Loop(20003) = {15020, 19004, 17068, 19020, 19036, 19038};
Volume(20004) = {20003};
Surface Loop(20005) = {15022, 19006, 17070, 19022, 19038, 19040};
Volume(20006) = {20005};
Surface Loop(20007) = {15024, 19008, 17072, 19024, 19040, 19042};
Volume(20008) = {20007};
Surface Loop(20009) = {15026, 19010, 17080, 19026, 19042, 19044};
Volume(20010) = {20009};
Surface Loop(20011) = {15028, 19012, 17078, 19028, 19044, 19046};
Volume(20012) = {20011};
Surface Loop(20013) = {15030, 19014, 17076, 19030, 19046, 19048};
Volume(20014) = {20013};
Surface Loop(20015) = {15032, 19016, 17074, 19032, 19048, 19034};
Volume(20016) = {20015};

// ===================================== //
// Set transfinite lines (extra layer 6) //
// ===================================== //

Transfinite Line {1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208} = numPoints3;
Transfinite Line {1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216} = numPoints1;
Transfinite Line {1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224} = numPoints8;


// ------------------------------------------------------------------------- //
// Tag curves, surfaces, and volumes                                         //
// ------------------------------------------------------------------------- //

Physical Surface(1) = {192, 194, 196, 198, 168, 170, 172, 174,
                       176, 178, 180, 182};
Physical Surface(2) = {318, 320, 322, 324, 326, 328, 330, 332,
                       3002, 3004, 3006, 3008, 3010, 3012, 3014, 3016,
                       7002, 7004, 7006, 7008, 7010, 7012, 7014, 7016,
                       11002, 11004, 11006, 11008, 11010, 11012, 11014, 11016,
                       15002, 15004, 15006, 15008, 15010, 15012, 15014, 15016,
                       19002, 19004, 19006, 19008, 19010, 19012, 19014, 19016,
                       19018, 19020, 19022, 19024, 19026, 19028, 19030, 19032,
                       17002, 17004, 17006, 17008, 17010, 17012, 17014, 17016,
                       17018, 17020, 17022, 17024};
Physical Surface(3) = {302, 304, 306, 308, 310, 312, 314, 316};

Physical Volume(1) = {200, 202, 204, 206, 208, 210, 212, 214, 216, 218, 220,
                      222, 224, 226, 228, 230, 280, 282, 284, 286, 288,
                      290, 292, 294, 296, 298, 300, 302, 402, 404, 406,
                      408, 410, 412, 414, 416};
Physical Volume(2) = {2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 
                      2018, 2020, 2022, 2024, 4002, 4004, 4006, 4008,
                      4010, 4012, 4014, 4016};
Physical Volume(3) = {6002, 6004, 6006, 6008, 6010, 6012, 6014, 6016, 
                      6018, 6020, 6022, 6024, 8002, 8004, 8006, 8008,
                      8010, 8012, 8014, 8016};
Physical Volume(4) = {10002, 10004, 10006, 10008, 10010, 10012, 10014, 10016, 
                      10018, 10020, 10022, 10024, 12002, 12004, 12006, 12008,
                      12010, 12012, 12014, 12016};
Physical Volume(5) = {14002, 14004, 14006, 14008, 14010, 14012, 14014, 14016, 
                      14018, 14020, 14022, 14024, 16002, 16004, 16006, 16008,
                      16010, 16012, 16014, 16016};
Physical Volume(6) = {18002, 18004, 18006, 18008, 18010, 18012, 18014, 18016, 
                      18018, 18020, 18022, 18024, 20002, 20004, 20006, 20008,
                      20010, 20012, 20014, 20016};

// ==================================== //
// Set transfinite surfaces and volumes //
// ==================================== //

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
