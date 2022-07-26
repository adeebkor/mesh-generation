// Heterogenous domain

c0 = 1500;
f0 = 500000;

lmbda = c0 / f0;
N = 15;
R = 0.035;
L = 0.12;

PML_0 = R + N*lmbda;
PML_1 = L + N*lmbda;

p_r = 0.01;
epw = 3;

hmin = 0.005;

// Rectangle 1

L0 = 0.03;

Point(1) = {0., -R, 0., hmin};
Point(2) = {0., R, 0., hmin};
Point(3) = {L0, -R, 0., hmin};
Point(4) = {L0, R, 0., hmin};

Line(1) = {1, 3};
Line(2) = {3, 4};
Line(3) = {4, 2};
Line(4) = {2, 1};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

// Rectangle 2

L1 = L0 + 0.0065;

Point(5) = {L1, -R, 0., hmin};
Point(6) = {L1, R, 0., hmin};

Line(5) = {3, 5};
Line(6) = {5, 6};
Line(7) = {6, 4};

Line Loop(3) = {5, 6, 7, -2};
Ruled Surface(4) = {3};

// Rectangle 3

L2 = L1 + 0.0835;

Point(7) = {L2, -R, 0., hmin};
Point(8) = {L2, R, 0., hmin};

Line(8) = {5, 7};
Line(9) = {7, 8};
Line(10) = {8, 6};

Line Loop(5) = {8, 9, 10, -6};
Ruled Surface(6) = {5};

// PML 1

Point(9) = {PML_1, -R, 0., hmin};
Point(10) = {PML_1, R, 0., hmin};

Line(11) = {7, 9};
Line(12) = {9, 10};
Line(13) = {10, 8};

Line Loop(7) = {11, 12, 13, -9};
Ruled Surface(8) = {7};

// Source

// Point(14) = {0., -p_r, 0., hmin};
// Point(15) = {0., p_r, 0., hmin};
// 
// Line(14) = {14, 15};
// Line(15) = {15, 2};
// Line(16) = {14, 1};

// PML 0 bottom

Point(16) = {0., -PML_0, 0., hmin};
Point(17) = {L0, -PML_0, 0., hmin};
Point(18) = {L1, -PML_0, 0., hmin};
Point(19) = {L, -PML_0, 0., hmin};
Point(20) = {PML_1, -PML_0, 0., hmin};

Line(17) = {1, 16};
Line(18) = {16, 17};
Line(19) = {17, 3};

Line Loop(9) = {17, 18, 19, -1};
Ruled Surface(10) = {9};

Line(20) = {17,18};
Line(21) = {18, 5};

Line Loop(11) = {20, 21, -5, -19};
Ruled Surface(12) = {11};

Line(22) = {18, 19};
Line(23) = {19, 7};

Line Loop(13) = {22, 23, -8, -21};
Ruled Surface(14) = {13};

Line(24) = {19, 20};
Line(25) = {20, 9};

Line Loop(15) = {24, 25, -11, -23};
Ruled Surface(16) = {15};

// PML 0 top

Point(21) = {0., PML_0, 0., hmin};
Point(22) = {L0, PML_0, 0., hmin};
Point(23) = {L1, PML_0, 0., hmin};
Point(24) = {L, PML_0, 0., hmin};
Point(25) = {PML_1, PML_0, 0., hmin};

Line(26) = {2, 21};
Line(27) = {21, 22};
Line(28) = {22, 4};

Line Loop(17) = {26, 27, 28, 3};
Ruled Surface(18) = {17};

Line(29) = {22, 23};
Line(30) = {23, 6};

Line Loop(19) = {29, 30, 7, -28};
Ruled Surface(20) = {19};

Line(31) = {23, 24};
Line(32) = {24, 8};

Line Loop(21) = {31, 32, 10, -30};
Ruled Surface(22) = {21};

Line(33) = {24, 25};
Line(34) = {25, 10};

Line Loop(23) = {33, 34, 13, -32};
Ruled Surface(24) = {23};

// Tag curves and surfaces

// Physical Curve(1) = {14};
Physical Curve(2) = {12, 18, 20, 22, 24, 25,
                     27, 29, 31, 33, 34};
Physical Curve(3) = {15, 16, 17, 26};

Physical Surface(1) = {2, 6};
Physical Surface(2) = {4};
Physical Surface(3) = {8, 10, 12, 14, 16, 18, 20, 22, 24};

// Set transfinite

Transfinite Line {2, 4, 6, 9, 12} = epw * 2 * R / lmbda + 1;
Transfinite Line {17, 19, 21, 23, 25,
                  26, 28, 30, 32, 34} = epw * N + 1;
Transfinite Line {1, 3, 18, 27} = epw * L0 / lmbda + 1;
Transfinite Line {5, 7, 20, 29} = epw * (L1 - L0) / lmbda + 1;
Transfinite Line {8, 10, 22, 31} = epw * (L - L1) / lmbda + 1;
Transfinite Line {11, 13, 24, 33} = epw * (PML_1 - L) / lmbda + 1;

Transfinite Surface "*";
Recombine Surface "*";
