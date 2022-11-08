// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D planewave problem
// - unstructured quadrilateral mesh
// - sponge layer
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor


// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500.0;
sourceFrequency = 500000.0;

wavelength = speedOfSound / sourceFrequency;
numElementPerWavelength = 3.0;

domainLength = 0.12;
domainRadius = 0.035;

hmin = 0.005;  // placeholder for the mesh size

spongeLength = domainLength + 5 * wavelength;

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

Point(1) = {0., -domainRadius, 0., hmin};
Point(2) = {domainLength, -domainRadius, 0., hmin};
Point(3) = {domainLength, domainRadius, 0., hmin};
Point(4) = {0., domainRadius, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

// ------------------------------------------------------------------------- //
// Sponge layer                                                              //
// ------------------------------------------------------------------------- //

Point(5) = {spongeLength, -domainRadius, 0., hmin};
Point(6) = {spongeLength, domainRadius, 0., hmin};

Line(5) = {2, 5};
Line(6) = {5, 6};
Line(7) = {6, 3};

Line Loop(3) = {5, 6, 7, -2};
Ruled Surface(4) = {3};


// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {6};
Physical Curve(3) = {1, 3, 5, 7};

Physical Surface(1) = {2};
Physical Surface(2) = {4};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {1, 3} = numElementPerWavelength * domainLength /
    wavelength + 1;
Transfinite Line {5, 7} = numElementPerWavelength * 
    (spongeLength - domainLength) / wavelength + 1;
Transfinite Line {2, 4, 6} = numElementPerWavelength * (2 * domainRadius)
    / wavelength + 1;

Recombine Surface "*";
