c0 = 1.0;
f0 = 10.0;

L = 1.0;
lmbda = c0 / f0;

epw = 32;
nw = L / lmbda;
nx = epw * nw + 1;

Point(1) = {-0.5, -0.5, 0., 1.0};
Point(2) = {0.5, -0.5, 0., 1.0};
Point(3) = {0.5, 0.5, 0., 1.0};
Point(4) = {-0.5, 0.5, 0., 1.0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

Transfinite Line {1, 2, 3, 4} = nx;

Physical Curve(1) = {4};
Physical Curve(2) = {2};

Physical Surface(1) = {2};

Transfinite Surface "*";
Recombine Surface "*";