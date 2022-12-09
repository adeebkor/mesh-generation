// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Simple unstructured quadrilateral mesh
// - use for testing the mass and stiffness sum factorisation operators
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor

// Geometry

L = 1.0;  // Length
W = 1.0;  // Width

hmin = 0.02;  // placeholder for the mesh size

// Domain

Point(1) = {0., 0., 0., hmin};
Point(2) = {L, 0., 0., hmin};
Point(3) = {L, W, 0., hmin};
Point(4) = {0., W, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

// Tag curves and surfaces

Physical Curve(1) = {1, 2, 3, 4};
Physical Surface(1) = {2};

// Set transfinite line

Transfinite Line {1, 2, 3, 4} = 16;

// Generate quadrilateral mesh

Recombine Surface "*";
