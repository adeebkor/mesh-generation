// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain with a circular scatterer
// - structured quadrilateral mesh
// - if wavelength > scatterer radius
//
// ----------------------------------------------------------------------------
// Copyright (C) 2024 Adeeb Arif Kor

// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500.0;
sourceFrequency = 2000.0;

wavelength = speedOfSound / sourceFrequency;

numElementPerWavelength = 6;

scattererRadius = 0.5 * wavelength;

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

scale_x = 8;
scale_y = 12;

Point(1) = {- scale_y * wavelength, - scale_y * wavelength, 0., 1.0};
Point(2) = {scale_x * wavelength, - scale_y * wavelength, 0., 1.0};
Point(3) = {scale_x * wavelength, scale_y * wavelength, 0., 1.0};
Point(4) = {- scale_y * wavelength, scale_y * wavelength, 0., 1.0};
Point(5) = {0., 0., 0., 1.0};
Point(6) = {scattererRadius * Cos(Pi), scattererRadius * Sin(Pi), 0., 1.0};
Point(7) = {scattererRadius * Cos(5/4*Pi), scattererRadius * Sin(5/4*Pi), 0., 1.0};
Point(8) = {scattererRadius * Cos(3/2*Pi), scattererRadius * Sin(3/2*Pi), 0., 1.0};
Point(9) = {scattererRadius * Cos(7/4*Pi), scattererRadius * Sin(7/4*Pi), 0., 1.0};
Point(10) = {scattererRadius, 0.0, 0., 1.0};
Point(11) = {scattererRadius * Cos(1/4*Pi), scattererRadius * Sin(1/4*Pi), 0., 1.0};
Point(12) = {scattererRadius * Cos(1/2*Pi), scattererRadius * Sin(1/2*Pi), 0., 1.0};
Point(13) = {scattererRadius * Cos(3/4*Pi), scattererRadius * Sin(3/4*Pi), 0., 1.0};
Point(14) = {0., - scale_y * wavelength, 0., 1.0};
Point(15) = {scale_x * wavelength, 0., 0., 1.0};
Point(16) = {0., scale_y * wavelength, 0., 1.0};
Point(17) = {- scale_y * wavelength, 0., 0., 1.0};
Point(18) = {scattererRadius * Cos(5/4*Pi), - scale_y * wavelength, 0., 1.0};
Point(19) = {scattererRadius * Cos(7/4*Pi), - scale_y * wavelength, 0., 1.0};
Point(20) = {scale_x * wavelength, scattererRadius * Sin(7/4*Pi), 0., 1.0};
Point(21) = {scale_x * wavelength, scattererRadius * Sin(1/4*Pi), 0., 1.0};
Point(22) = {scattererRadius * Cos(7/4*Pi), scale_y * wavelength, 0., 1.0};
Point(23) = {scattererRadius * Cos(5/4*Pi), scale_y * wavelength, 0., 1.0};
Point(24) = {- scale_y * wavelength, scattererRadius * Sin(3/4*Pi), 0., 1.0};
Point(25) = {- scale_y * wavelength, scattererRadius * Sin(5/4*Pi), 0., 1.0};

Line(1) = {1, 18};
Line(2) = {18, 14};
Line(3) = {14, 19};
Line(4) = {19, 2};
Line(5) = {2, 20};
Line(6) = {20, 15};
Line(7) = {15, 21};
Line(8) = {21, 3};
Line(9) = {3, 22};
Line(10) = {22, 16};
Line(11) = {16, 23};
Line(12) = {23, 4};
Line(13) = {4, 24};
Line(14) = {24, 17};
Line(15) = {17, 25};
Line(16) = {25, 1};

Circle(17) = {6, 5, 7};
Circle(18) = {7, 5, 8};
Circle(19) = {8, 5, 9};
Circle(20) = {9, 5, 10};
Circle(21) = {10, 5, 11};
Circle(22) = {11, 5, 12};
Circle(23) = {12, 5, 13};
Circle(24) = {13, 5, 6};

Line(25) = {18, 7};
Line(26) = {14, 8};
Line(27) = {19, 9};
Line(28) = {20, 9};
Line(29) = {15, 10};
Line(30) = {21, 11};
Line(31) = {22, 11};
Line(32) = {16, 12};
Line(33) = {23, 13};
Line(34) = {24, 13};
Line(35) = {17, 6};
Line(36) = {25, 7};

Curve Loop(1) = {1, 25, -36, 16};
Plane Surface(2) = {1};
Curve Loop(3) = {4, 5, 28, -27};
Plane Surface(4) = {3};
Curve Loop(5) = {8, 9, 31, -30};
Plane Surface(6) = {5};
Curve Loop(7) = {12, 13, 34, -33};
Plane Surface(8) = {7};

Curve Loop(9) = {2, 26, -18, -25};
Plane Surface(10) = {9};
Curve Loop(11) = {3, 27, -19, -26};
Plane Surface(12) = {11};

Curve Loop(13) = {6, 29, -20, -28};
Plane Surface(14) = {13};
Curve Loop(15) = {7, 30, -21, -29};
Plane Surface(16) = {15};

Curve Loop(17) = {10, 32, -22, -31};
Plane Surface(18) = {17};
Curve Loop(19) = {11, 33, -23, -32};
Plane Surface(20) = {19};

Curve Loop(21) = {14, 35, -24, -34};
Plane Surface(22) = {21};
Curve Loop(23) = {15, 36, -17, -35};
Plane Surface(24) = {23};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {13, 14, 15, 16};
Physical Curve(2) = {5, 6, 7, 8};
Physical Curve(3) = {1, 2, 3, 4,
                     9, 10, 11, 12,
                     17, 18, 19, 20, 21, 22, 23, 24};

Physical Surface(1) = {2, 4, 6, 8,
                       10, 12, 14, 16, 18, 20, 22, 24};

// =============== //
// Set transfinite //
// =============== //

numPoints1 = ( scale_x * wavelength - scattererRadius * Cos(7/4*Pi)) * numElementPerWavelength / wavelength + 1;
numPoints2 = ( scattererRadius * Cos(5/4*Pi) - (- scale_y * wavelength) ) * numElementPerWavelength / wavelength + 1;
numPoints3 = ( - scattererRadius * Cos(5/4*Pi) ) * numElementPerWavelength / wavelength + 1;
numPoints4 = ( - scattererRadius * Sin(5/4*Pi) ) * numElementPerWavelength / wavelength + 1;

Transfinite Line {4, 9,
                  28, 29, 30} = numPoints1;
Transfinite Line {1, 12, 34, 35, 36, 
                  5, 8, 13, 16,
                  25, 26, 27,
                  31, 32, 33} = numPoints2;
Transfinite Line {2, 3, 10, 11,
                  18, 19, 22, 23} = numPoints3;
Transfinite Line {6, 7, 14, 15,
                  17, 20, 21, 24} = numPoints4;

Transfinite Surface "*";
Recombine Surface "*";

Printf("The wavelength is %g meter", wavelength);
Printf("Number of points 1 is %g", numPoints1);
Printf("Number of points 2 is %g", numPoints2);
Printf("Number of points 3 is %g", numPoints3);
Printf("Number of points 4 is %g", numPoints4);