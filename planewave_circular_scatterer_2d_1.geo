// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain with a circular scatterer
// - structured quadrilateral mesh
//
// ----------------------------------------------------------------------------
// Copyright (C) 2022 Adeeb Arif Kor


// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1.0;
sourceFrequency = 10.0;

domainLength = 1.0;
wavelength = speedOfSound / sourceFrequency;

numElementPerWavelength = 8;
numPoints = numElementPerWavelength * domainLength / wavelength + 1;

scattererRadius = 0.05;

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

Point(1) = {-0.5, -0.5, 0., 1.0};
Point(2) = {0.5, -0.5, 0., 1.0};
Point(3) = {0.5, 0.5, 0., 1.0};
Point(4) = {-0.5, 0.5, 0., 1.0};
Point(5) = {0., 0., 0., 1.0};
Point(6) = {scattererRadius * Cos(Pi), scattererRadius * Sin(Pi), 0., 1.0};
Point(7) = {scattererRadius * Cos(5/4*Pi), scattererRadius * Sin(5/4*Pi), 0., 1.0};
Point(8) = {scattererRadius * Cos(3/2*Pi), scattererRadius * Sin(3/2*Pi), 0., 1.0};
Point(9) = {scattererRadius * Cos(7/4*Pi), scattererRadius * Sin(7/4*Pi), 0., 1.0};
Point(10) = {scattererRadius, 0.0, 0., 1.0};
Point(11) = {scattererRadius * Cos(1/4*Pi), scattererRadius * Sin(1/4*Pi), 0., 1.0};
Point(12) = {scattererRadius * Cos(1/2*Pi), scattererRadius * Sin(1/2*Pi), 0., 1.0};
Point(13) = {scattererRadius * Cos(3/4*Pi), scattererRadius * Sin(3/4*Pi), 0., 1.0};
Point(14) = {0., -0.5, 0., 1.0};
Point(15) = {0.5, 0., 0., 1.0};
Point(16) = {0., 0.5, 0., 1.0};
Point(17) = {-0.5, 0., 0., 1.0};

Line(1) = {1, 14};
Line(2) = {14, 2};
Line(3) = {2, 15};
Line(4) = {15, 3};
Line(5) = {3, 16};
Line(6) = {16, 4};
Line(7) = {4, 17};
Line(8) = {17, 1};
Circle(9) = {6, 5, 7};
Circle(10) = {7, 5, 8};
Circle(11) = {8, 5, 9};
Circle(12) = {9, 5, 10};
Circle(13) = {10, 5, 11};
Circle(14) = {11, 5, 12};
Circle(15) = {12, 5, 13};
Circle(16) = {13, 5, 6};

Line(17) = {1, 7};
Line(18) = {14, 8};
Line(19) = {2, 9};
Line(20) = {15, 10};
Line(21) = {3, 11};
Line(22) = {16, 12};
Line(23) = {4, 13};
Line(24) = {17, 6};

Curve Loop(1) = {-24, 8, 17, -9};
Plane Surface(2) = {1};
Curve Loop(3) = {1, 18, -10, -17};
Plane Surface(4) = {3};
Curve Loop(5) = {2, 19, -11, -18};
Plane Surface(6) = {5};
Curve Loop(7) = {3, 20, -12, -19};
Plane Surface(8) = {7};
Curve Loop(9) = {4, 21, -13, -20};
Plane Surface(10) = {9};
Curve Loop(11) = {5, 22, -14, -21};
Plane Surface(12) = {11};
Curve Loop(13) = {6, 23, -15, -22};
Plane Surface(14) = {13};
Curve Loop(15) = {7, 24, -16, -23};
Plane Surface(16) = {15};


// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {7, 8};
Physical Curve(2) = {3, 4};
Physical Curve(3) = {1, 2, 5, 6};
Physical Curve(4) = {9, 10, 11, 12, 13, 14, 15, 16};

Physical Surface(1) = {2, 4, 6, 8, 10, 12, 14, 16};


// =============== //
// Set transfinite //
// =============== //

Transfinite Line {17, 18, 19, 20, 21, 22, 23, 24} = numPoints;
Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16} = numPoints;

Transfinite Surface "*";
Recombine Surface "*";
