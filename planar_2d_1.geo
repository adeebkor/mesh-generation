// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D planar problem
// - Structured quadrilateral mesh
//
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
// Rectangle 1                                                               //
// ------------------------------------------------------------------------- //

Point(1) = {0., -sourceRadius, 0., hmin};
Point(2) = {domainLength, -sourceRadius, 0., hmin};
Point(3) = {domainLength, sourceRadius, 0., hmin};
Point(4) = {0., sourceRadius, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(101) = {1, 2, 3, 4};
Ruled Surface(102) = {101};

// ------------------------------------------------------------------------- //
// Rectangle 2                                                               //
// ------------------------------------------------------------------------- //

Point(5) = {0., -domainRadius, 0., hmin};
Point(6) = {domainLength, -domainRadius, 0., hmin};

Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};

Line Loop(201) = {5, 6, 7, -1};
Ruled Surface(202) = {201};

// ------------------------------------------------------------------------- //
// Rectangle 3                                                               //
// ------------------------------------------------------------------------- //

Point(7) = {0., domainRadius, 0., hmin};
Point(8) = {domainLength, domainRadius, 0., hmin};

Line(8) = {4, 7};
Line(9) = {7, 8};
Line(10) = {8, 3};

Line Loop(301) = {8, 9, 10, 3};
Ruled Surface(302) = {301};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {2, 6, 7, 9, 10};
Physical Curve(3) = {5, 8};

Physical Surface(1) = {102, 202, 302};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {1, 3, 6, 9} = numElementPerWavelength * domainLength 
    / wavelength + 1;
Transfinite Line {2, 4} = numElementPerWavelength * 2 * sourceRadius 
    / wavelength + 1;
Transfinite Line {5, 7, 8, 10} = numElementPerWavelength * (domainRadius
    - sourceRadius) / wavelength + 1;

Transfinite Surface "*";
Recombine Surface "*";
