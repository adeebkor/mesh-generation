p_r = 0.01;
N = 40;

Point(1) = {0., 0., 0., p_r/N};
Point(2) = {p_r, 0., 0., p_r/N};
Point(3) = {0., p_r, 0., p_r/N};
Point(4) = {-p_r, 0., 0., p_r/N};
Point(5) = {0., -p_r, 0., p_r/N};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(2) = {1};

Physical Surface(1) = {2};