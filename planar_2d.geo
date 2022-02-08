c0 = 1482;
f0 = 1e6;

L = 0.1;
lmbda = c0 / f0;

epw = 4;
nw = L / lmbda;
nx = epw * nw * 1;

Point(1) = {0.0, -0.03, 0.0, 1.0};
Point(2) = {L, -0.03, 0.0, 1.0};
Point(3) = {L, -0.01, 0.0, 1.0};
Point(4) = {L, 0.01, 0.0, 1.0};
Point(5) = {L, 0.03, 0.0, 1.0};
Point(6) = {0.0, 0.03, 0.0, 1.0};
Point(7) = {0.0, 0.01, 0.0, 1.0};
Point(8) = {0.0, -0.01, 0.0, 1.0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 1};
Line(9) = {8, 3};
Line(10) = {7, 4};

Curve Loop(1) = {1, 2, -9, 8};
Plane Surface(2) = {1};
Curve Loop(3) = {9, 3, -10, 7};
Plane Surface(4) = {3};
Curve Loop(5) = {10, 4, 5, 6};
Plane Surface(6) = {5};

Transfinite Line {1, 5, 9, 10} = nx;
Transfinite Line {2, 3, 4, 6, 7, 8} = 0.2 * nx;

Physical Curve(1) = {7};
Physical Curve(2) = {1, 2, 3, 4, 5, 6, 8};

Physical Surface(1) = {2, 4, 6};

Transfinite Surface "*";
Recombine Surface "*";