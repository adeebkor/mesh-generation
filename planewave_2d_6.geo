// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D planewave problem
// - Structured quadrilateral mesh
// - The top and bottom boundary is tag as 2 instead of 3 as in
//   planewave_2d_1.geo
// ----------------------------------------------------------------------------

speedOfSound = 1500.0;
sourceFrequency = 500000.0;

wavelength = speedOfSound / sourceFrequency;
numElementPerWavelength = 3.0;

domainLength = 0.12;
domainRadius = 0.035;

hmin = 0.005; // placeholder for the mesh size

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

Point(1) = {0., -domainRadius, 0., hmin};
Point(2) = {domainLength, -domainRadius, 0., hmin};
Point(3) = {domainLength, domainRadius, 0., hmin};
Point(4) = {0, domainRadius, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {1, 2, 3};
Physical Surface(1) = {2};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {1, 3} = numElementPerWavelength * domainLength 
    / wavelength + 1;
Transfinite Line {2, 4} = numElementPerWavelength * (2 * domainRadius) 
    / wavelength + 1;

Transfinite Surface "*";
Recombine Surface "*";
