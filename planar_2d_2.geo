// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Heterogenous domain for 2D planar problem
// - structured quadrilateral mesh
// - two different medium (x < 0.06 m, x > 0.06 m)
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor


// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

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
Point(2) = {domainLength/2, -sourceRadius, 0., hmin};
Point(3) = {domainLength/2, sourceRadius, 0., hmin};
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
Point(6) = {domainLength/2, -domainRadius, 0., hmin};

Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};

Line Loop(201) = {5, 6, 7, -1};
Ruled Surface(202) = {201};

// ------------------------------------------------------------------------- //
// Rectangle 3 (Medium 1)                                                    //
// ------------------------------------------------------------------------- //

Point(7) = {0., domainRadius, 0., hmin};
Point(8) = {domainLength/2, domainRadius, 0., hmin};

Line(8) = {4, 7};
Line(9) = {7, 8};
Line(10) = {8, 3};

Line Loop(301) = {8, 9, 10, 3};
Ruled Surface(302) = {301};

// ------------------------------------------------------------------------- //
// Rectangle 4 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(9) = {domainLength, -sourceRadius, 0., hmin};
Point(10) = {domainLength, sourceRadius, 0., hmin};

Line(11) = {2, 9};
Line(12) = {9, 10};
Line(13) = {10, 3};

Line Loop(401) = {11, 12, 13, -2};
Ruled Surface(402) = {401};

// ------------------------------------------------------------------------- //
// Rectangle 5 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(11) = {domainLength, -domainRadius, 0., hmin};

Line(14) = {6, 11};
Line(15) = {11, 9};

Line Loop(501) = {14, 15, -11, -7};
Ruled Surface(502) = {501};

// ------------------------------------------------------------------------- //
// Rectangle 5 (Medium 2)                                                    //
// ------------------------------------------------------------------------- //

Point(12) = {domainLength, domainRadius, 0., hmin};

Line(16) = {10, 12};
Line(17) = {12, 8};

Line Loop(601) = {-13, 16, 17, 10};
Ruled Surface(602) = {601};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {6, 9, 12, 14, 15, 16, 17};
Physical Curve(3) = {5, 8};

Physical Surface(1) = {102, 202, 302};
Physical Surface(2) = {402, 502, 602};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {1, 3, 6, 9, 11, 13, 14, 17} = numElementPerWavelength
    * domainLength / 2 / wavelength + 1;
Transfinite Line {2, 4, 12} = numElementPerWavelength * 2 * sourceRadius
    / wavelength + 1;
Transfinite Line {5, 7, 8, 10, 15, 16} = numElementPerWavelength
    * (domainRadius - sourceRadius) / wavelength + 1;

Transfinite Surface "*";
Recombine Surface "*";