// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D point source problem
// - structured quadrilateral mesh
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor

// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
domainRadius = 0.08;

numElementPerWavelength = 3;
numWaves = 2 * domainRadius / wavelength;
numElements = numWaves * numElementPerWavelength;

hmin = 2 * domainRadius / numElements;

// ------------------------------------------------------------------------- //
// Circle
// ------------------------------------------------------------------------- //

Point(1) = {0., 0., 0., hmin};
Point(2) = {domainRadius, 0., 0., hmin};
Point(3) = {-domainRadius, 0., 0., hmin};

Circle(11) = {2, 1, 3};
Circle(12) = {3, 1, 2};

Line Loop(21) = {11, 12};
Plane Surface(22) = {21};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {11, 12};

Physical Surface(1) = {22};

// ------------------ //
// Generate all quads //
// ------------------ //

Recombine Surface "*";