// ------------------------------------------------------------------------- //
//
// Gmsh GEO file
//
// Homogenous domain for 3D transducer problem
// 
// * The transducer is within the domain (not on the boundary of the domain).
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 0.5e6;

wavelength = speedOfSound / sourceFrequency;
domainLength = 0.1;
domainRadius = 0.05;
layerWidth = - 0.01;

numElementPerWavelength = 1;

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
Line(150) = {18, 1};
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
// Cylinder                                                                  //
// ------------------------------------------------------------------------- //

Point(37) = {0.0, 0.0, domainLength, 1.0};
Point(38) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), domainLength, 1.0};
Point(39) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), domainLength, 1.0};
Point(40) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), domainLength, 1.0};
Point(41) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), domainLength, 1.0};
Point(42) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), domainLength, 1.0};
Point(43) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), domainLength, 1.0};
Point(44) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), domainLength, 1.0};
Point(45) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), domainLength, 1.0};
Point(46) = {sourceRadius / 2 * Cos(0.00*Pi), sourceRadius / 2 * Sin(0.00*Pi), domainLength, 1.0};
Point(47) = {sourceRadius / 2 * Cos(0.25*Pi), sourceRadius / 2 * Sin(0.25*Pi), domainLength, 1.0};
Point(48) = {sourceRadius / 2 * Cos(0.50*Pi), sourceRadius / 2 * Sin(0.50*Pi), domainLength, 1.0};
Point(49) = {sourceRadius / 2 * Cos(0.75*Pi), sourceRadius / 2 * Sin(0.75*Pi), domainLength, 1.0};
Point(50) = {sourceRadius / 2 * Cos(1.00*Pi), sourceRadius / 2 * Sin(1.00*Pi), domainLength, 1.0};
Point(51) = {sourceRadius / 2 * Cos(1.25*Pi), sourceRadius / 2 * Sin(1.25*Pi), domainLength, 1.0};
Point(52) = {sourceRadius / 2 * Cos(1.50*Pi), sourceRadius / 2 * Sin(1.50*Pi), domainLength, 1.0};
Point(53) = {sourceRadius / 2 * Cos(1.75*Pi), sourceRadius / 2 * Sin(1.75*Pi), domainLength, 1.0};

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

// ================================ //
// Set transfinite lines (cylinder) //
// ================================ //

numPoints2 = numElementPerWavelength * (domainLength - (focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius))) / wavelength;

Transfinite Line {86, 87, 88, 91, 83, 78, 79, 84, 89, 90, 94, 95} = numPoints1;
Transfinite Line {98, 99, 100, 101, 102, 103, 104, 105} = numPoints1;
Transfinite Line {80, 81, 85, 92, 93, 97, 96, 82} = numPoints1;
Transfinite Line {106, 107, 108, 109, 110, 111, 112, 113} = numPoints2;
Transfinite Line {114, 115, 116, 117, 118, 119, 120, 121, 122} = numPoints2;


// ------------------------------------------------------------------------- //
// Extra layer                                                               //
// ------------------------------------------------------------------------- //

Point(54) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(55) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(56) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(57) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(58) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(59) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(60) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(61) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius), 1.0};
Point(62) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), domainLength, 1.0};
Point(63) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), domainLength, 1.0};
Point(64) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), domainLength, 1.0};
Point(65) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), domainLength, 1.0};
Point(66) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), domainLength, 1.0};
Point(67) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), domainLength, 1.0};
Point(68) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), domainLength, 1.0};
Point(69) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), domainLength, 1.0};

Line(223) = {2, 54};
Line(224) = {3, 55};
Line(225) = {4, 56};
Line(226) = {5, 57};
Line(227) = {6, 58};
Line(228) = {7, 59};
Line(229) = {8, 60};
Line(230) = {9, 61};
Circle(231) = {54, 1, 55};
Circle(232) = {55, 1, 56};
Circle(233) = {56, 1, 57};
Circle(234) = {57, 1, 58};
Circle(235) = {58, 1, 59};
Circle(236) = {59, 1, 60};
Circle(237) = {60, 1, 61};
Circle(238) = {61, 1, 54};
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

// =================================== //
// Set transfinite lines (extra layer) //
// =================================== //

numPoints3 = numElementPerWavelength * (domainRadius - sourceRadius) / wavelength;

Transfinite Line {223, 224, 225, 226, 227, 228, 229, 230,
                  239, 240, 241, 242, 243, 244, 245, 246} = numPoints3;
Transfinite Line {231, 232, 233, 234, 235, 236, 237, 238,
                  247, 248, 249, 250, 251, 252, 253, 254} = numPoints1;
Transfinite Line {255, 256, 257, 258, 259, 260, 261, 262} = numPoints2;


// ------------------------------------------------------------------------- //
// Cylinder 2 + Extra layer 2                                                //
// ------------------------------------------------------------------------- //

Point(70) = {0.0, 0.0, layerWidth, 1.0};
Point(71) = {sourceRadius * Cos(0.00*Pi), sourceRadius * Sin(0.00*Pi), layerWidth, 1.0};
Point(72) = {sourceRadius * Cos(0.25*Pi), sourceRadius * Sin(0.25*Pi), layerWidth, 1.0};
Point(73) = {sourceRadius * Cos(0.50*Pi), sourceRadius * Sin(0.50*Pi), layerWidth, 1.0};
Point(74) = {sourceRadius * Cos(0.75*Pi), sourceRadius * Sin(0.75*Pi), layerWidth, 1.0};
Point(75) = {sourceRadius * Cos(1.00*Pi), sourceRadius * Sin(1.00*Pi), layerWidth, 1.0};
Point(76) = {sourceRadius * Cos(1.25*Pi), sourceRadius * Sin(1.25*Pi), layerWidth, 1.0};
Point(77) = {sourceRadius * Cos(1.50*Pi), sourceRadius * Sin(1.50*Pi), layerWidth, 1.0};
Point(78) = {sourceRadius * Cos(1.75*Pi), sourceRadius * Sin(1.75*Pi), layerWidth, 1.0};
Point(79) = {-circRadius2, 0.0, layerWidth, 1.0};
Point(81) = {0.0, -circRadius2, layerWidth, 1.0};
Point(83) = {circRadius2, 0.0, layerWidth, 1.0};
Point(85) = {0.0, circRadius2, layerWidth, 1.0};
Point(80) = {-circRadius4, -circRadius4, layerWidth, 1.0};
Point(82) = {circRadius4, -circRadius4, layerWidth, 1.0};
Point(84) = {circRadius4, circRadius4, layerWidth, 1.0};
Point(86) = {-circRadius4, circRadius4, layerWidth, 1.0};
Point(87) = {domainRadius * Cos(0.00*Pi), domainRadius * Sin(0.00*Pi), layerWidth, 1.0};
Point(88) = {domainRadius * Cos(0.25*Pi), domainRadius * Sin(0.25*Pi), layerWidth, 1.0};
Point(89) = {domainRadius * Cos(0.50*Pi), domainRadius * Sin(0.50*Pi), layerWidth, 1.0};
Point(90) = {domainRadius * Cos(0.75*Pi), domainRadius * Sin(0.75*Pi), layerWidth, 1.0};
Point(91) = {domainRadius * Cos(1.00*Pi), domainRadius * Sin(1.00*Pi), layerWidth, 1.0};
Point(92) = {domainRadius * Cos(1.25*Pi), domainRadius * Sin(1.25*Pi), layerWidth, 1.0};
Point(93) = {domainRadius * Cos(1.50*Pi), domainRadius * Sin(1.50*Pi), layerWidth, 1.0};
Point(94) = {domainRadius * Cos(1.75*Pi), domainRadius * Sin(1.75*Pi), layerWidth, 1.0};

Line(123) = {35, 70};
Line(124) = {27, 79};
Line(125) = {28, 80};
Line(126) = {29, 81};
Line(127) = {30, 82};
Line(128) = {31, 83};
Line(129) = {32, 84};
Line(130) = {33, 85};
Line(131) = {34, 86};
Line(132) = {2, 71};
Line(133) = {3, 72};
Line(134) = {4, 73};
Line(135) = {5, 74};
Line(136) = {6, 75};
Line(137) = {7, 76};
Line(138) = {8, 77};
Line(139) = {9, 78};
Line(140) = {54, 87};
Line(141) = {55, 88};
Line(142) = {56, 89};
Line(143) = {57, 90};
Line(144) = {58, 91};
Line(145) = {59, 92};
Line(146) = {60, 93};
Line(147) = {61, 94};
Line(151) = {70, 79};
Line(152) = {70, 81};
Line(153) = {70, 83};
Line(154) = {70, 85};
Line(155) = {79, 80};
Line(156) = {80, 81};
Line(157) = {81, 82};
Line(158) = {82, 83};
Line(159) = {83, 84};
Line(160) = {84, 85};
Line(161) = {85, 86};
Line(162) = {86, 79};
Line(163) = {79, 75};
Line(164) = {80, 76};
Line(165) = {81, 77};
Line(166) = {82, 78};
Line(167) = {83, 71};
Line(168) = {84, 72};
Line(169) = {85, 73};
Line(170) = {86, 74};
Circle(171) = {71, 70, 72};
Circle(172) = {72, 70, 73};
Circle(173) = {73, 70, 74};
Circle(174) = {74, 70, 75};
Circle(175) = {75, 70, 76};
Circle(176) = {76, 70, 77};
Circle(177) = {77, 70, 78};
Circle(178) = {78, 70, 71};
Line(179) = {71, 87};
Line(180) = {72, 88};
Line(181) = {73, 89};
Line(182) = {74, 90};
Line(183) = {75, 91};
Line(184) = {76, 92};
Line(185) = {77, 93};
Line(186) = {78, 94};
Circle(187) = {87, 70, 88};
Circle(188) = {88, 70, 89};
Circle(189) = {89, 70, 90};
Circle(190) = {90, 70, 91};
Circle(191) = {91, 70, 92};
Circle(192) = {92, 70, 93};
Circle(193) = {93, 70, 94};
Circle(194) = {94, 70, 87};

Line Loop(500) = {154, -130, -75, 123};
Ruled Surface(501) = {500};
Line Loop(502) = {153, -128, -74, 123};
Ruled Surface(503) = {502};
Line Loop(504) = {152, -126, -77, 123};
Ruled Surface(505) = {504};
Line Loop(506) = {151, -124, -76, 123};
Ruled Surface(507) = {506};
Line Loop(508) = {-154, 153, 159, 160};
Ruled Surface(509) = {508};
Line Loop(510) = {-153, 152, 157, 158};
Ruled Surface(511) = {510};
Line Loop(512) = {-152, 151, 155, 156};
Ruled Surface(513) = {512};
Line Loop(514) = {-151, 154, 161, 162};
Ruled Surface(515) = {514};
Line Loop(516) = {-130, -67, 129, 160};
Ruled Surface(517) = {516};
Line Loop(518) = {-129, -66, 128, 159};
Ruled Surface(519) = {518};
Line Loop(520) = {-128, -73, 127, 158};
Ruled Surface(521) = {520};
Line Loop(522) = {-127, -72, 126, 157};
Ruled Surface(523) = {522};
Line Loop(524) = {-126, -71, 125, 156};
Ruled Surface(525) = {524};
Line Loop(526) = {-125, -70, 124, 155};
Ruled Surface(527) = {526};
Line Loop(528) = {-124, -69, 131, 162};
Ruled Surface(529) = {528};
Line Loop(530) = {-131, -68, 130, 161};
Ruled Surface(531) = {530};

Line Loop(532) = {169, -172, -168, 160};
Ruled Surface(533) = {532};
Line Loop(534) = {168, -171, -167, 159};
Ruled Surface(535) = {534};
Line Loop(536) = {167, -178, -166, 158};
Ruled Surface(537) = {536};
Line Loop(538) = {166, -177, -165, 157};
Ruled Surface(539) = {538};
Line Loop(540) = {165, -176, -164, 156};
Ruled Surface(541) = {540};
Line Loop(542) = {164, -175, -163, 155};
Ruled Surface(543) = {542};
Line Loop(544) = {163, -174, -170, 162};
Ruled Surface(545) = {544};
Line Loop(546) = {170, -173, -169, 161};
Ruled Surface(547) = {546};

Line Loop(548) = {-134, 23, 133, 172};
Ruled Surface(549) = {548};
Line Loop(550) = {-133, 24, 132, 171};
Ruled Surface(551) = {550};
Line Loop(552) = {-132, 25, 139, 178};
Ruled Surface(553) = {552};
Line Loop(554) = {-139, 26, 138, 177};
Ruled Surface(555) = {554};
Line Loop(556) = {-138, 27, 137, 176};
Ruled Surface(557) = {556};
Line Loop(558) = {-137, 28, 136, 175};
Ruled Surface(559) = {558};
Line Loop(560) = {-136, 21, 135, 174};
Ruled Surface(561) = {560};
Line Loop(562) = {-135, 22, 134, 173};
Ruled Surface(563) = {562};

Line Loop(564) = {181, -142, -225, 134};
Ruled Surface(565) = {564};
Line Loop(566) = {180, -141, -224, 133};
Ruled Surface(567) = {566};
Line Loop(568) = {179, -140, -223, 132};
Ruled Surface(569) = {568};
Line Loop(570) = {186, -147, -230, 139};
Ruled Surface(571) = {570};
Line Loop(572) = {185, -146, -229, 138};
Ruled Surface(573) = {572};
Line Loop(574) = {184, -145, -228, 137};
Ruled Surface(575) = {574};
Line Loop(576) = {183, -144, -227, 136};
Ruled Surface(577) = {576};
Line Loop(578) = {182, -143, -226, 135};
Ruled Surface(579) = {578};

Line Loop(580) = {-142, -232, 141, 188};
Ruled Surface(581) = {580};
Line Loop(582) = {-141, -231, 140, 187};
Ruled Surface(583) = {582};
Line Loop(584) = {-140, -238, 147, 194};
Ruled Surface(585) = {584};
Line Loop(586) = {-147, -237, 146, 193};
Ruled Surface(587) = {586};
Line Loop(588) = {-146, -236, 145, 192};
Ruled Surface(589) = {588};
Line Loop(590) = {-145, -235, 144, 191};
Ruled Surface(591) = {590};
Line Loop(592) = {-144, -234, 143, 190};
Ruled Surface(593) = {592};
Line Loop(594) = {-143, -233, 142, 189};
Ruled Surface(595) = {594};

Line Loop(596) = {181, -188, -180, 172};
Ruled Surface(597) = {596};
Line Loop(598) = {180, -187, -179, 171};
Ruled Surface(599) = {598};
Line Loop(600) = {179, -194, -186, 178};
Ruled Surface(601) = {600};
Line Loop(602) = {186, -193, -185, 177};
Ruled Surface(603) = {602};
Line Loop(604) = {185, -192, -184, 176};
Ruled Surface(605) = {604};
Line Loop(606) = {184, -191, -183, 175};
Ruled Surface(607) = {606};
Line Loop(608) = {183, -190, -182, 174};
Ruled Surface(609) = {608};
Line Loop(610) = {182, -189, -181, 173};
Ruled Surface(611) = {610};

Line Loop(612) = {169, -134, 58, 130};
Ruled Surface(613) = {612};
Line Loop(614) = {168, -133, -65, 129};
Ruled Surface(615) = {614};
Line Loop(616) = {167, -132, -64, 128};
Ruled Surface(617) = {616};
Line Loop(618) = {166, -139, -63, 127};
Ruled Surface(619) = {618};
Line Loop(620) = {165, -138, -62, 126};
Ruled Surface(621) = {620};
Line Loop(622) = {164, -137, -61, 125};
Ruled Surface(623) = {622};
Line Loop(624) = {163, -136, -60, 124};
Ruled Surface(625) = {624};
Line Loop(626) = {170, -135, 59, 131};
Ruled Surface(627) = {626};

Surface Loop(701) = {501, 503, 517, 519, 509, 194};
Volume(702) = {701};
Surface Loop(703) = {503, 505, 521, 523, 511, 192};
Volume(704) = {703};
Surface Loop(705) = {505, 507, 525, 527, 513, 198};
Volume(706) = {705};
Surface Loop(707) = {507, 501, 529, 531, 515, 196};
Volume(708) = {707};

Surface Loop(709) = {613, 549, 615, 517, 533, 178};
Volume(710) = {709};
Surface Loop(711) = {615, 551, 617, 519, 535, 176};
Volume(712) = {711};
Surface Loop(713) = {617, 553, 619, 521, 537, 174};
Volume(714) = {713};
Surface Loop(715) = {619, 555, 621, 523, 539, 172};
Volume(716) = {715};
Surface Loop(717) = {621, 557, 623, 525, 541, 170};
Volume(718) = {717};
Surface Loop(719) = {623, 559, 625, 527, 543, 168};
Volume(720) = {719};
Surface Loop(721) = {625, 561, 627, 529, 545, 182};
Volume(722) = {721};
Surface Loop(723) = {627, 563, 613, 531, 547, 180};
Volume(724) = {723};

Surface Loop(725) = {565, 581, 567, 549, 597, 304};
Volume(726) = {725};
Surface Loop(727) = {567, 583, 569, 551, 599, 302};
Volume(728) = {727};
Surface Loop(729) = {569, 585, 571, 553, 601, 316};
Volume(730) = {729};
Surface Loop(731) = {571, 587, 573, 555, 603, 314};
Volume(732) = {731};
Surface Loop(733) = {573, 589, 575, 557, 605, 312};
Volume(734) = {733};
Surface Loop(735) = {575, 591, 577, 559, 607, 310};
Volume(736) = {735};
Surface Loop(737) = {577, 593, 579, 561, 609, 308};
Volume(738) = {737};
Surface Loop(739) = {579, 595, 565, 563, 611, 306};
Volume(740) = {739};

// ================================================== //
// Set transfinite lines (cylinder 2 + extra layer 2) //
// ================================================== //

numPoints4 = numElementPerWavelength * (focalLength - Sqrt(focalLength*focalLength - sourceRadius*sourceRadius) - layerWidth) / wavelength;

Transfinite Line {123,
                  124, 125, 126, 127, 128, 129, 130, 131,
                  132, 133, 134, 135, 136, 137, 138, 139,
                  140, 141, 142, 143, 144, 145, 146, 147} = numPoints4;
Transfinite Line {151, 152, 153, 154,
                  155, 156, 157, 158, 159, 160, 161, 162} = numPoints1;
Transfinite Line {163, 164, 165, 166, 167, 168, 169, 170} = numPoints1;
Transfinite Line {179, 180, 181, 182, 183, 184, 185, 186} = numPoints3;
Transfinite Line {171, 172, 173, 174, 175, 176, 177, 178,
                  187, 188, 189, 190, 191, 192, 193, 194} = numPoints1;


// ------------------------------------------------------------------------- //
// Tag curves, surfaces, and volumes                                         //
// ------------------------------------------------------------------------- //

Physical Surface(1) = {192, 194, 196, 198, 168, 170, 172, 174,
                       176, 178, 180, 182};
Physical Surface(2) = {318, 320, 322, 324, 326, 328, 330, 332,
                       334, 336, 338, 340, 342, 344, 346, 348,
                       208, 210, 212, 214, 216, 218, 220, 222,
                       200, 202, 204, 206,
                       509, 511, 513, 515,
                       533, 535, 537, 539, 541, 543, 545, 547,
                       597, 599, 601, 603, 605, 607, 609, 611,
                       581, 583, 585, 587, 589, 591, 593, 595};

Physical Volume(1) = {202, 204, 206, 208, 210, 212, 214, 216, 218, 220,
                      222, 224, 226, 228, 230, 280, 282, 284, 286, 288,
                      290, 292, 294, 296, 298, 300, 302, 402, 404, 406,
                      408, 410, 412, 414, 416,
                      702, 704, 706, 708, 710, 712, 714, 716, 718, 720,
                      712, 714, 716, 718, 730, 732, 734, 736, 738, 740};

// ==================================== //
// Set transfinite surfaces and volumes //
// ==================================== //

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
