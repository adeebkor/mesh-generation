c0 = 1.0;
f0 = 10.0;

L = 1.0;
lmbda = c0 / f0;

epw = 8;
nw = L / lmbda;
nx = epw * nw + 1;

sr = 0.05;
sr_half = sr / 2;

Point(1) = {0., 0., 0., 1.0};
Point(2) = {1.0, 0., 0., 1.0};
Point(3) = {1.0, 1.0, 0., 1.0};
Point(4) = {0., 1.0, 0., 1.0};
Point(5) = {0.5, 0.5, 0., 1.0};
Point(6) = {0.5 + sr * Cos(Pi), 0.5 + sr * Sin(Pi), 0., 1.0};
Point(7) = {0.5 + sr * Cos(5/4*Pi), 0.5 + sr * Sin(5/4*Pi), 0., 1.0};
Point(8) = {0.5 + sr * Cos(3/2*Pi), 0.5 + sr * Sin(3/2*Pi), 0., 1.0};
Point(9) = {0.5 + sr * Cos(7/4*Pi), 0.5 + sr * Sin(7/4*Pi), 0., 1.0};
Point(10) = {0.5 + sr, 0.5, 0., 1.0};
Point(11) = {0.5 + sr * Cos(1/4*Pi), 0.5 + sr * Sin(1/4*Pi), 0., 1.0};
Point(12) = {0.5 + sr * Cos(1/2*Pi), 0.5 + sr * Sin(1/2*Pi), 0., 1.0};
Point(13) = {0.5 + sr * Cos(3/4*Pi), 0.5 + sr * Sin(3/4*Pi), 0., 1.0};
Point(14) = {0.5, 0., 0., 1.0};
Point(15) = {1., 0.5, 0., 1.0};
Point(16) = {0.5, 1.0, 0., 1.0};
Point(17) = {0., 0.5, 0., 1.0};
Point(18) = {0.5 + sr_half * Cos(Pi), 0.5 + sr_half * Sin(Pi), 0., 1.0};
Point(19) = {0.5 + sr_half * Cos(5/4*Pi), 0.5 + sr_half * Sin(5/4*Pi), 0., 1.0};
Point(20) = {0.5 + sr_half * Cos(3/2*Pi), 0.5 + sr_half * Sin(3/2*Pi), 0., 1.0};
Point(21) = {0.5 + sr_half * Cos(7/4*Pi), 0.5 + sr_half * Sin(7/4*Pi), 0., 1.0};
Point(22) = {0.5 + sr_half, 0.5, 0., 1.0};
Point(23) = {0.5 + sr_half * Cos(1/4*Pi), 0.5 + sr_half * Sin(1/4*Pi), 0., 1.0};
Point(24) = {0.5 + sr_half * Cos(1/2*Pi), 0.5 + sr_half * Sin(1/2*Pi), 0., 1.0};
Point(25) = {0.5 + sr_half * Cos(3/4*Pi), 0.5 + sr_half * Sin(3/4*Pi), 0., 1.0};

Line(1) = {1, 14};
Line(2) = {14, 2};
Line(3) = {2, 15};
Line(4) = {15, 3};
Line(5) = {3, 16};
Line(6) = {16, 4};
Line(7) = {4, 17};
Line(8) = {17, 1};
Circle(9) = {6, 5, 7};
Circle(10) = {7, 5, 8};
Circle(11) = {8, 5, 9};
Circle(12) = {9, 5, 10};
Circle(13) = {10, 5, 11};
Circle(14) = {11, 5, 12};
Circle(15) = {12, 5, 13};
Circle(16) = {13, 5, 6};

Line(17) = {5, 18};
Line(18) = {5, 20};
Line(19) = {5, 22};
Line(20) = {5, 24};
Line(21) = {1, 7};
Line(22) = {14, 8};
Line(23) = {2, 9};
Line(24) = {15, 10};
Line(25) = {3, 11};
Line(26) = {16, 12};
Line(27) = {4, 13};
Line(28) = {17, 6};
Line(29) = {18, 19};
Line(30) = {19, 20};
Line(31) = {20, 21};
Line(32) = {21, 22};
Line(33) = {22, 23};
Line(34) = {23, 24};
Line(35) = {24, 25};
Line(36) = {25, 18};
Line(37) = {6, 18};
Line(38) = {7, 19};
Line(39) = {8, 20};
Line(40) = {9, 21};
Line(41) = {10, 22};
Line(42) = {11, 23};
Line(43) = {12, 24};
Line(44) = {13, 25};

Curve Loop(1) = {1, 22, -10, -21};
Plane Surface(2) = {1};
Curve Loop(3) = {2, 23, -11, -22};
Plane Surface(4) = {3};
Curve Loop(5) = {3, 24, -12, -23};
Plane Surface(6) = {5};
Curve Loop(7) = {4, 25, -13, -24};
Plane Surface(8) = {7};
Curve Loop(9) = {5, 26, -14, -25};
Plane Surface(10) = {9};
Curve Loop(11) = {6, 27, -15, -26};
Plane Surface(12) = {11};
Curve Loop(13) = {7, 28, -16, -27};
Plane Surface(14) = {13};
Curve Loop(15) = {8, 21, -9, -28};
Plane Surface(16) = {15};
Curve Loop(17) = {9, 38, -29, -37};
Plane Surface(18) = {17};
Curve Loop(19) = {10, 39, -30, -38};
Plane Surface(20) = {19};
Curve Loop(21) = {11, 40, -31, -39};
Plane Surface(22) = {21};
Curve Loop(23) = {12, 41, -32, -40};
Plane Surface(24) = {23};
Curve Loop(25) = {13, 42, -33, -41};
Plane Surface(26) = {25};
Curve Loop(27) = {14, 43, -34, -42};
Plane Surface(28) = {27};
Curve Loop(29) = {15, 44, -35, -43};
Plane Surface(30) = {29};
Curve Loop(31) = {16, 37, -36, -44};
Plane Surface(32) = {31};
Curve Loop(33) = {29, 30, -18, 17};
Plane Surface(34) = {33};
Curve Loop(35) = {31, 32, -19, 18};
Plane Surface(36) = {35};
Curve Loop(37) = {33, 34, -20, 19};
Plane Surface(38) = {37};
Curve Loop(39) = {35, 36, -17, 20};
Plane Surface(40) = {39};


density1 = nx * 4;
density2 = nx / 4;
density3 = nx / 4;

Transfinite Line {21, 22, 23, 24, 25, 26, 27, 28} = density1;
Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                  17, 18, 19, 20, 29, 30, 31, 32, 33, 34, 35, 36} = density2;
Transfinite Line {37, 38, 39, 40, 41, 42, 43, 44} = density3;

Physical Curve(1) = {7, 8};
Physical Curve(2) = {3, 4};
// Physical Curve(3) = {1, 2, 5, 6};

Physical Surface(1) = {2, 4, 6, 8, 10, 12, 14, 16};
// Physical Surface(2) = {18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40};

Transfinite Surface "*";
Recombine Surface "*";

