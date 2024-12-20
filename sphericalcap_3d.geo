// ------------------------------------------------------------------------- //
//
// Gmsh GEO file
//
// Spherical cap geometry
// - this is based on the example from http://matveichev.blogspot.com/2013/12/building-hexagonal-meshes-with-gmsh.html
//
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 0.5e6;

wavelength = speedOfSound / sourceFrequency;

numElementPerWavelength = 2;

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


// -------------------------------- //
// Tag curves, surfaces and volumes //
// -------------------------------- //

Physical Surface(1) = {192, 194, 196, 198, 168, 170, 172, 174,
                       176, 178, 180, 182};
Physical Surface(2) = {79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101};
Physical Volume(1) = {200, 202, 204, 206, 208,
                      210, 212, 214, 216, 218,
                      220, 222, 224, 226, 228,
                      230};


// ============================================ //
// Set transfinite curves, surfaces and volumes //
// ============================================ //

numPoints = 2 * numElementPerWavelength * sourceRadius / 2 / wavelength;

Transfinite Line {150, 41, 42, 43, 44, 45, 46, 47, 48} = numPoints;
Transfinite Line {58, 59, 60, 61, 62, 63, 64, 65} = numPoints;

Transfinite Line {9, 10, 11, 14, 39, 30, 31, 32} = numPoints;
Transfinite Line {1, 2, 7, 12, 13, 17, 18, 6} = numPoints;
Transfinite Line {33, 34, 35, 36, 37, 38, 39, 40} = numPoints;
Transfinite Line {21, 22, 23, 24, 25, 26, 27, 28, 29} = numPoints;
Transfinite Line {66, 67, 68, 69, 70, 71, 72, 73} = numPoints;
Transfinite Line {74, 75, 76, 77} = numPoints;

Transfinite Line {49, 56, 16, 57, 15, 50, 8, 51} = numPoints;
Transfinite Line {4, 52, 3, 53, 5, 54, 19, 55, 20} = numPoints;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
