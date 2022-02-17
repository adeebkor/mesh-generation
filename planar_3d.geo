c0 = 1482;
f0 = 1e6;

L = 0.005;
R = 0.03;
lmbda = c0 / f0;

epw = 32;
nw = L / lmbda;
nx = epw * nw + 1;

p_r = 0.01;

Point(1) = {0., 0., 0., 1.0};
Point(2) = {p_r * Cos(Pi), p_r * Sin(Pi), 0., 1.0};
Point(3) = {p_r * Cos(5/4*Pi), p_r * Sin(5/4*Pi), 0., 1.0};
Point(4) = {p_r * Cos(3/2*Pi), p_r * Sin(3/2*Pi), 0., 1.0};
Point(5) = {p_r * Cos(7/4*Pi), p_r * Sin(7/4*Pi), 0., 1.0};
Point(6) = {p_r, 0., 0., 1.0};
Point(7) = {p_r * Cos(1/4*Pi), p_r * Sin(1/4*Pi), 0., 1.0};
Point(8) = {p_r * Cos(1/2*Pi), p_r * Sin(1/2*Pi), 0., 1.0};
Point(9) = {p_r * Cos(3/4*Pi), p_r * Sin(3/4*Pi), 0., 1.0};

Point(10) = {R, 0., 0., 1.0};
Point(11) = {R * Cos(Pi), R * Sin(Pi), 0., 1.0};
Point(12) = {R * Cos(5/4*Pi), R * Sin(5/4*Pi), 0., 1.0};
Point(13) = {R * Cos(3/2*Pi), R * Sin(3/2*Pi), 0., 1.0};
Point(14) = {R * Cos(7/4*Pi), R * Sin(7/4*Pi), 0., 1.0};
Point(15) = {R, 0., 0., 1.0};
Point(16) = {R * Cos(1/4*Pi), R * Sin(1/4*Pi), 0., 1.0};
Point(17) = {R * Cos(1/2*Pi), R * Sin(1/2*Pi), 0., 1.0};
Point(18) = {R * Cos(3/4*Pi), R * Sin(3/4*Pi), 0., 1.0};

Point(19) = {p_r / 2 * Cos(Pi), p_r / 2 * Sin(Pi), 0., 1.0};
Point(20) = {p_r / 2 * Cos(5/4*Pi), p_r / 2 * Sin(5/4*Pi), 0., 1.0};
Point(21) = {p_r / 2 * Cos(3/2*Pi), p_r / 2 * Sin(3/2*Pi), 0., 1.0};
Point(22) = {p_r / 2 * Cos(7/4*Pi), p_r / 2 * Sin(7/4*Pi), 0., 1.0};
Point(23) = {p_r / 2, 0., 0., 1.0};
Point(24) = {p_r / 2 * Cos(1/4*Pi), p_r / 2 * Sin(1/4*Pi), 0., 1.0};
Point(25) = {p_r / 2 * Cos(1/2*Pi), p_r / 2 * Sin(1/2*Pi), 0., 1.0};
Point(26) = {p_r / 2 * Cos(3/4*Pi), p_r / 2 * Sin(3/4*Pi), 0., 1.0};

Point(27) = {0., 0., L, 1.0};
Point(28) = {p_r * Cos(Pi), p_r * Sin(Pi), L, 1.0};
Point(29) = {p_r * Cos(5/4*Pi), p_r * Sin(5/4*Pi), L, 1.0};
Point(30) = {p_r * Cos(3/2*Pi), p_r * Sin(3/2*Pi), L, 1.0};
Point(31) = {p_r * Cos(7/4*Pi), p_r * Sin(7/4*Pi), L, 1.0};
Point(32) = {p_r, 0., L, 1.0};
Point(33) = {p_r * Cos(1/4*Pi), p_r * Sin(1/4*Pi), L, 1.0};
Point(34) = {p_r * Cos(1/2*Pi), p_r * Sin(1/2*Pi), L, 1.0};
Point(35) = {p_r * Cos(3/4*Pi), p_r * Sin(3/4*Pi), L, 1.0};

Point(36) = {R, 0., L, 1.0};
Point(37) = {R * Cos(Pi), R * Sin(Pi), L, 1.0};
Point(38) = {R * Cos(5/4*Pi), R * Sin(5/4*Pi), L, 1.0};
Point(39) = {R * Cos(3/2*Pi), R * Sin(3/2*Pi), L, 1.0};
Point(40) = {R * Cos(7/4*Pi), R * Sin(7/4*Pi), L, 1.0};
Point(41) = {R, 0., L, 1.0};
Point(42) = {R * Cos(1/4*Pi), R * Sin(1/4*Pi), L, 1.0};
Point(43) = {R * Cos(1/2*Pi), R * Sin(1/2*Pi), L, 1.0};
Point(44) = {R * Cos(3/4*Pi), R * Sin(3/4*Pi), L, 1.0};

Point(45) = {p_r / 2 * Cos(Pi), p_r / 2 * Sin(Pi), L, 1.0};
Point(46) = {p_r / 2 * Cos(5/4*Pi), p_r / 2 * Sin(5/4*Pi), L, 1.0};
Point(47) = {p_r / 2 * Cos(3/2*Pi), p_r / 2 * Sin(3/2*Pi), L, 1.0};
Point(48) = {p_r / 2 * Cos(7/4*Pi), p_r / 2 * Sin(7/4*Pi), L, 1.0};
Point(49) = {p_r / 2, 0., L, 1.0};
Point(50) = {p_r / 2 * Cos(1/4*Pi), p_r / 2 * Sin(1/4*Pi), L, 1.0};
Point(51) = {p_r / 2 * Cos(1/2*Pi), p_r / 2 * Sin(1/2*Pi), L, 1.0};
Point(52) = {p_r / 2 * Cos(3/4*Pi), p_r / 2 * Sin(3/4*Pi), L, 1.0};

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

Physical Surface(1) = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24};
Physical Surface(2) = {26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46,
                       48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68,
                       70, 72, 74, 76, 78, 80, 130, 132, 134, 136,
                       138, 140, 142, 144};
Physical Volume(1) = {170, 172, 174, 176, 178, 180, 182, 184, 186,
                      188, 190, 192, 194, 196, 198, 200, 202, 204,
                      206, 208};

density1 = nx;
density2 = 0.1 * nx;
density3 = 0.2 * nx;

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                  13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
                  23, 24, 25, 26, 27, 28, 37, 38, 39, 40,
                  41, 42, 43, 44} = density2;
Transfinite Line {29, 30, 31, 32, 33, 34, 35, 36} = density3;

Transfinite Line {45, 46, 47, 48, 49, 50, 51, 52, 53, 54,
                  55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
                  65, 66, 67, 68, 69, 70, 71, 72, 81, 82,
                  83, 84, 85, 86, 87, 88} = density2;
Transfinite Line {73, 74, 75, 76, 77, 78, 79, 80} = density3;

Transfinite Line {89, 90, 91, 92, 93, 94, 95, 96,
                  97, 98, 99, 100, 101, 102, 103, 104,
                  105, 106, 107, 108, 109, 110, 111, 112, 113} = density1;



Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";
