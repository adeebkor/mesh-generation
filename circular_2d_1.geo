// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D point source problem
// - structured quadrilateral mesh
// - contain a circular scatterer
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor

// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
domainRadius = 0.08;

numElementPerWavelength = 0.1;
numWaves = 2 * domainRadius / wavelength;
numElements = numWaves * numElementPerWavelength;

hmin = 2 * domainRadius / numElements;


// ------------------------------------------------------------------------- //
// Circle 1
// ------------------------------------------------------------------------- //

Point(1) = {0., 0., 0., hmin};
Point(2) = {domainRadius, 0., 0., hmin};
Point(3) = {-domainRadius, 0., 0., hmin};

Circle(11) = {2, 1, 3};
Circle(12) = {3, 1, 2};

Line Loop(21) = {11, 12};
Plane Surface(22) = {21};

// ------------------------------------------------------------------------- //
// Circle 2
// ------------------------------------------------------------------------- //

Point(4) = {1.5*domainRadius, 0., 0., hmin};
Point(5) = {-1.5*domainRadius, 0., 0., hmin};

Line(13) = {2, 4};
Line(14) = {3, 5};
Circle(15) = {4, 1, 5};
Circle(16) = {5, 1, 4};

Line Loop(23) = {13, 15, -14, -11};
Plane Surface(24) = {23};

Line Loop(25) = {14, 16, -13, -12};
Plane Surface(26) = {25};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {15, 16};

Physical Surface(1) = {22, 24, 26};

// ------------------ //
// Generate all quads //
// ------------------ //

Recombine Surface "*";