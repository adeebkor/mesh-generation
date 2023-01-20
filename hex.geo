// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Simple unstructured hex mesh
// - use for testing the mass and stiffness sum factorisation operators
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor

// Geometry

L = 1.0;  // Length
W = 1.0;  // Width
H = 1.0;  // Height

hmin = 0.02;  // placeholder for the mesh size

// Domain

Point(1) = {0., 0., 0., hmin};
Point(2) = {L, 0., 0., hmin};
Point(3) = {L, W, 0., hmin};
Point(4) = {0., W, 0., hmin};
Point(5) = {0., 0., H, hmin};
Point(6) = {L, 0., H, hmin};
Point(7) = {L, W, H, hmin};
Point(8) = {0., W, H, hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};

Line Loop(1) = {1, 2, 3, 4};
Ruled Surface(2) = {1};

Line Loop(3) = {5, 6, 7, 8};
Ruled Surface(4) = {3};

Line Loop(5) = {9, -8, -12, 4};
Ruled Surface(6) = {5};

Line Loop(7) = {10, 6, -11, -2};
Ruled Surface(8) = {7};

Line Loop(9) = {-1, 9, 5, -10};
Ruled Surface(10) = {9};

Line Loop(11) = {3, 12, -7, -11};
Ruled Surface(12) = {11};

Surface Loop(21) = {2, 4, 6, 8, 10, 12};
Volume(22) = {21};

// Tag surfaces and volumes

Physical Surface(1) = {2, 4, 6, 8, 10, 12};
Physical Volume(1) = {22};

// Set transfinite

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12} = 8;

// Set algorithm

// Mesh.Algorithm3D = 1;
// Mesh.SubdivisionAlgorithm = 2;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";