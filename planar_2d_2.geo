// Heterogenous domain

c0 = 1500;
f0 = 500000;

lmbda = c0 / f0;
N = 15;
R = 0.035;
L = 0.12;

PML_R = R + N*lmbda;
PML_L = L + N*lmbda;

p_r = 0.01;
epw = 3;

hmin = 0.005;

// Rectangle 1 (Layer 1)

L1 = 0.03;

Point(1) = {0., -p_r, 0., hmin};
Point(2) = {L1, -p_r, 0., hmin};
Point(3) = {L1, p_r, 0., hmin};
Point(4) = {0., p_r, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(101) = {1, 2, 3, 4};
Ruled Surface(102) = {101};

// Rectangle 2 (Layer 1)

Point(5) = {0., -R, 0., hmin};
Point(6) = {L1, -R, 0., hmin};

Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};

Line Loop(103) = {5, 6, 7, -1};
Ruled Surface(104) = {103};

// Rectangle 3 (Layer 1)

Point(7) = {0., R, 0., hmin};
Point(8) = {L1, R, 0., hmin};

Line(8) = {4, 7};
Line(9) = {7, 8};
Line(10) = {8, 3};

Line Loop(105) = {8, 9, 10, 3};
Ruled Surface(106) = {105};

// PML R bottom (Layer 1)

Point(9) = {0., -PML_R, 0., hmin};
Point(10) = {L1, -PML_R, 0., hmin};

Line(11) = {5, 9};
Line(12) = {9, 10};
Line(13) = {10, 6};

Line Loop(107) = {11, 12, 13, -6};
Ruled Surface(108) = {107};

// PML R top (Layer 1)

Point(11) = {0., PML_R, 0., hmin};
Point(12) = {L1, PML_R, 0., hmin};

Line(14) = {7, 11};
Line(15) = {11, 12};
Line(16) = {12, 8};

Line Loop(109) = {14, 15, 16, -9};
Ruled Surface(110) = {109};

// Rectangle 1 (Layer 2)

L2 = L1 + 0.0065;

Point(13) = {L2, -p_r, 0., hmin};
Point(14) = {L2, p_r, 0., hmin};

Line(17) = {2, 13};
Line(18) = {13, 14};
Line(19) = {14, 3};

Line Loop(201) = {17, 18, 19, -2};
Ruled Surface(202) = {201};

// Rectangle 2 (Layer 2)

Point(15) = {L2, -R, 0., hmin};

Line(20) = {6, 15};
Line(21) = {15, 13};

Line Loop(203) = {20, 21, -17, -7};
Ruled Surface(204) = {203};

// Rectangle 3 (Layer 2)

Point(16) = {L2, R, 0., hmin};

Line(22) = {14, 16};
Line(23) = {16, 8};

Line Loop(205) = {-19, 22, 23, 10};
Ruled Surface(206) = {205};

// PML R bottom (Layer 2)

Point(17) = {L2, -PML_R, 0., hmin};

Line(24) = {10, 17};
Line(25) = {17, 15};

Line Loop(207) = {-13, 24, 25, -20};
Ruled Surface(208) = {207};

// PML R top (Layer 2)

Point(18) = {L2, PML_R, 0., hmin};

Line(26) = {16, 18};
Line(27) = {18, 12};

Line Loop(209) = {-23, 26, 27, 16};
Ruled Surface(210) = {209};

// Rectangle 1 (Layer 3)

L3 = L2 + 0.0835;

Point(19) = {L3, -p_r, 0., hmin};
Point(20) = {L3, p_r, 0., hmin};

Line(28) = {13, 19};
Line(29) = {19, 20};
Line(30) = {20, 14};

Line Loop(301) = {28, 29, 30, -18};
Ruled Surface(302) = {301};

// Rectangle 2 (Layer 3)

Point(21) = {L3, -R, 0., hmin};

Line(31) = {15, 21};
Line(32) = {21, 19};

Line Loop(303) = {31, 32, -28, -21};
Ruled Surface(304) = {303};

// Rectangle 3 (Layer 3)

Point(22) = {L3, R, 0., hmin};

Line(33) = {20, 22};
Line(34) = {22, 16};

Line Loop(305) = {-30, 33, 34, -22};
Ruled Surface(306) = {305};

// PML R bottom (Layer 3)

Point(23) = {L3, -PML_R, 0., hmin};

Line(35) = {17, 23};
Line(36) = {23, 21};

Line Loop(307) = {35, 36, -31, -25};
Ruled Surface(308) = {307};

// PML R top (Layer 3)

Point(24) = {L3, PML_R, 0., hmin};

Line(37) = {22, 24};
Line(38) = {24, 18};

Line Loop(309) = {-34, 37, 38, -26};
Ruled Surface(310) = {309};

// Rectangle 1 (Layer PML)

Point(25) = {PML_L, -p_r, 0., hmin};
Point(26) = {PML_L, p_r, 0., hmin};

Line(39) = {19, 25};
Line(40) = {25, 26};
Line(41) = {26, 20};

Line Loop(401) = {39, 40, 41, -29};
Ruled Surface(402) = {401};

// Rectangle 2 (Layer PML)

Point(27) = {PML_L, -R, 0., hmin};

Line(42) = {21, 27};
Line(43) = {27, 25};

Line Loop(403) = {42, 43, -39, -32};
Ruled Surface(404) = {403};

// Rectangle 3 (Layer PML)

Point(28) = {PML_L, R, 0., hmin};

Line(44) = {26, 28};
Line(45) = {28, 22};

Line Loop(405) = {-41, 44, 45, -33};
Ruled Surface(406) = {405};

// PML R bottom (Layer PML)

Point(29) = {PML_L, -PML_R, 0., hmin};

Line(46) = {23, 29};
Line(47) = {29, 27};

Line Loop(407) = {-36, 46, 47, -42};
Ruled Surface(408) = {407};

// PML R top (Layer PML)

Point(30) = {PML_L, PML_R, 0., hmin};

Line(48) = {28, 30};
Line(49) = {30, 24};

Line Loop(409) = {-45, 48, 49, -37};
Ruled Surface(410) = {409};

// Tag curves and surfaces

Physical Curve(1) = {4};
Physical Curve(2) = {12, 24, 35, 46, 15, 27, 38, 49, 47, 43, 40, 44, 48};
Physical Curve(3) = {5, 8, 11, 14};

// Physical Surface(1) = {102, 104, 106, 302, 304, 306};
// Physical Surface(2) = {202, 204, 206};
// Physical Surface(3) = {108, 110, 208, 210, 308, 310, 402, 404, 406, 408, 410};
Physical Surface(1) = {102, 104, 106, 202, 204, 206, 302, 304, 306, 402, 404, 406};
Physical Surface(2) = {108, 110, 208, 210, 308, 310, 408, 410};

// Set transfinite

Transfinite Line {2, 4, 18, 29, 40} = epw * 2 * p_r / lmbda + 1;
Transfinite Line {5, 7, 21, 32, 43, 8, 10, 22, 33, 44} = epw * (R - p_r/2) / lmbda + 1;
Transfinite Line {11, 13, 25, 36, 47, 14, 16, 26, 37, 48} = epw * (PML_R - R - p_r/2) / lmbda + 1;
Transfinite Line {1, 3, 6, 9, 12, 15} = epw * L1 / lmbda + 1;
Transfinite Line {17, 19, 20, 23, 24, 27} = epw * (L2 - L1) / lmbda + 1;
Transfinite Line {28, 30, 31, 34, 35, 38} = epw * (L3 - L2) / lmbda + 1;
Transfinite Line {39, 41, 42, 45, 46, 49} = epw * (PML_L - L3) / lmbda + 1;

Transfinite Surface "*";
Recombine Surface "*";