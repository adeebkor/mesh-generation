sr = 0.05;

Point(1) = {0.5 - sr, 0., 0., 1.0};
Point(2) = {0.5 + sr, 0., 0., 1.0};
Point(3) = {0.5, 0.5, 0., 0., 1.0};
Point(4) = {0.5 - sr, 0.5, 0., 1.0};
Point(5) = {0.5 + sr, 0.5, 0., 1.0};

Line(1) = {1, 2};
Line(2) = {2, 5};
Circle(3) = {4, 3, 5};
Line(4) = {4, 1};

Curve Loop(1) = {1, 2, -3, 4};
Plane Surface(2) = {1};

Point(6) = {0.5 - sr, 1.0, 0., 1.0};
Point(7) = {0.5 + sr, 1.0, 0., 1.0};
Line(5) = {6, 7};
Line(6) = {7, 5};
Circle(7) = {5, 3, 4};
Line(8) = {4, 6};

Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(3) = {2};

Transfinite Line {5, 6, 7, 8} = 10;

Point(8) = {0., 0., 0., 1.0};
Point(9) = {1.0, 0., 0., 1.0};
Point(10) = {1., 1., 0., 1.0};
Point(11) = {0., 1., 0., 1.0};
Point(12) = {0., 0.5, 0., 1.0};

Line(9) = {8, 1};
Line(10) = {6, 11};
Line(11) = {11, 12};
Line(12) = {12, 8};
Line(13) = {12, 4};

Curve Loop(3) = {9, -4, -13, 12};
Plane Surface(4) = {3};

Curve Loop(5) = {13, 8, 10, 11};
Plane Surface(6) = {5};

Point(13) = {1.0, 0.5, 0., 1.0};

Line(14) = {2, 9};
Line(15) = {9, 13};
Line(16) = {13, 10};
Line(17) = {10, 7};
Line(18) = {5, 13};

Curve Loop(7) = {14, 15, -18, -2};
Plane Surface(8) = {7};

Curve Loop(9) = {18, 16, 17, 6};
Plane Surface(10) = {9};

ngrid = 5;
Transfinite Line {1, 3, 5, 7} = ngrid;
Transfinite Line {2, 14, 15, 18, 16, 17, 6, 8, 10, 11, 13, 12, 9, 4} = 4.5 * ngrid;

Physical Curve(1) = {12, 11};
Physical Curve(2) = {9, 1, 14, 15, 16, 17, 5, 10};
Physical Curve(3) = {3, 7};

Transfinite Surface "*";
Recombine Surface "*";
