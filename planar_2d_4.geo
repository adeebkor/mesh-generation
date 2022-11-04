// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 2D planar problem
// - Structured quadrilateral mesh
// - Two different medium
//     - Water (x < 0.03 m, x > 0.0365 m)
//     - Bone (0.03 m < x < 0.0365 m)
// ----------------------------------------------------------------------------


speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
domainRadius = 0.035;
domainLength = 0.12;

sourceRadius = 0.01;
numElementPerWavelength = 3;

hmin = 0.005;  // placeholder for the mesh size

// ------------------------------------------------------------------------- //
// Rectangle 1 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(1) = {0., -sourceRadius, 0., hmin};
Point(2) = {0.03, -sourceRadius, 0., hmin};
Point(3) = {0.03, sourceRadius, 0., hmin};
Point(4) = {0., sourceRadius, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(101) = {1, 2, 3, 4};
Ruled Surface(102) = {101};

// ------------------------------------------------------------------------- //
// Rectangle 2 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(5) = {0., -domainRadius, 0., hmin};
Point(6) = {0.03, -domainRadius, 0., hmin};

Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};

Line Loop(201) = {5, 6, 7, -1};
Ruled Surface(202) = {201};

// ------------------------------------------------------------------------- //
// Rectangle 3 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(7) = {0., domainRadius, 0., hmin};
Point(8) = {0.03, domainRadius, 0., hmin};

Line(8) = {4, 7};
Line(9) = {7, 8};
Line(10) = {8, 3};

Line Loop(301) = {8, 9, 10, 3};
Ruled Surface(302) = {301};

// ------------------------------------------------------------------------- //
// Rectangle 4 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(9) = {0.0365, -sourceRadius, 0., hmin};
Point(10) = {0.0365, sourceRadius, 0., hmin};

Line(11) = {2, 9};
Line(12) = {9, 10};
Line(13) = {10, 3};

Line Loop(401) = {11, 12, 13, -2};
Ruled Surface(402) = {401};

// ------------------------------------------------------------------------- //
// Rectangle 5 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(11) = {0.0365, -domainRadius, 0., hmin};

Line(14) = {6, 11};
Line(15) = {11, 9};

Line Loop(501) = {14, 15, -11, -7};
Ruled Surface(502) = {501};

// ------------------------------------------------------------------------- //
// Rectangle 6 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(12) = {0.0365, domainRadius, 0., hmin};

Line(16) = {10, 12};
Line(17) = {12, 8};

Line Loop(601) = {-13, 16, 17, 10};
Ruled Surface(602) = {601};

// ------------------------------------------------------------------------- //
// Rectangle 7 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(13) = {domainLength, -sourceRadius, 0., hmin};
Point(14) = {domainLength, sourceRadius, 0., hmin};

Line(18) = {9, 13};
Line(19) = {13, 14};
Line(20) = {14, 10};

Line Loop(701) = {18, 19, 20, -12};
Ruled Surface(702) = {701};

// ------------------------------------------------------------------------- //
// Rectangle 8 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(15) = {domainLength, -domainRadius, 0., hmin};

Line(21) = {11, 15};
Line(22) = {15, 13};

Line Loop(801) = {21, 22, -18, -15};
Ruled Surface(802) = {801};

// ------------------------------------------------------------------------- //
// Rectangle 8 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(16) = {domainLength, domainRadius, 0., hmin};

Line(23) = {14, 16};
Line(24) = {16, 12};

Line Loop(901) = {-20, 23, 24, -16};
Ruled Surface(902) = {901};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {6, 9, 14, 17, 19, 21, 22, 23, 24};
Physical Curve(3) = {5, 8};

Physical Surface(1) = {102, 202, 302, 702, 802, 902};
Physical Surface(2) = {402, 502, 602};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {1, 3, 6, 9} = numElementPerWavelength * 0.03 
    / wavelength + 1;
Transfinite Line {11, 13, 14, 17} = numElementPerWavelength * 0.0065
    / wavelength + 1;
Transfinite Line {18, 20, 21, 24} = numElementPerWavelength * (domainLength
    - 0.0365) / wavelength + 1;
Transfinite Line {2, 4, 12, 19} = numElementPerWavelength * 2 * sourceRadius
    / wavelength + 1;
Transfinite Line {5, 7, 8, 10, 15, 16, 22, 23} = numElementPerWavelength
    * (domainRadius - sourceRadius) / wavelength + 1;

Transfinite Surface "*";
Recombine Surface "*";