// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Plane wave scattering due to a circular scatterer
// - structured quadrilateral mesh
// - if wavelength < scatterer radius
//
// ----------------------------------------------------------------------------
// Copyright (C) 2025 Adeeb Arif Kor

// ------------------------------------------------------------------------- //
// Geometry and mesh parameters
// ------------------------------------------------------------------------- //

speedOfSound = 1500.0;
sourceFrequency = 2000.0;

wavelength = speedOfSound / sourceFrequency;

numElementPerWavelength = 4;

scattererRadius = 1.0 * wavelength;
scattererHalfRadius = scattererRadius / 2.0;

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

scale_x = 10;
scale_y = 12;

Point(1) = {- scale_y * scattererRadius, - scale_y * scattererRadius, 0., 1.0};
Point(2) = {scale_x * scattererRadius, - scale_y * scattererRadius, 0., 1.0};
Point(3) = {scale_x * scattererRadius, scale_y * scattererRadius, 0., 1.0};
Point(4) = {- scale_y * scattererRadius, scale_y * scattererRadius, 0., 1.0};
Point(5) = {0., 0., 0., 1.0};
Point(6) = {scattererRadius * Cos(Pi), scattererRadius * Sin(Pi), 0., 1.0};
Point(7) = {scattererRadius * Cos(5/4*Pi), scattererRadius * Sin(5/4*Pi), 0., 1.0};
Point(8) = {scattererRadius * Cos(3/2*Pi), scattererRadius * Sin(3/2*Pi), 0., 1.0};
Point(9) = {scattererRadius * Cos(7/4*Pi), scattererRadius * Sin(7/4*Pi), 0., 1.0};
Point(10) = {scattererRadius, 0.0, 0., 1.0};
Point(11) = {scattererRadius * Cos(1/4*Pi), scattererRadius * Sin(1/4*Pi), 0., 1.0};
Point(12) = {scattererRadius * Cos(1/2*Pi), scattererRadius * Sin(1/2*Pi), 0., 1.0};
Point(13) = {scattererRadius * Cos(3/4*Pi), scattererRadius * Sin(3/4*Pi), 0., 1.0};
Point(14) = {0., - scale_y * scattererRadius, 0., 1.0};
Point(15) = {scale_x * scattererRadius, 0., 0., 1.0};
Point(16) = {0., scale_y * scattererRadius, 0., 1.0};
Point(17) = {- scale_y * scattererRadius, 0., 0., 1.0};
Point(18) = {scattererRadius * Cos(5/4*Pi), - scale_y * scattererRadius, 0., 1.0};
Point(19) = {scattererRadius * Cos(7/4*Pi), - scale_y * scattererRadius, 0., 1.0};
Point(20) = {scale_x * scattererRadius, scattererRadius * Sin(7/4*Pi), 0., 1.0};
Point(21) = {scale_x * scattererRadius, scattererRadius * Sin(1/4*Pi), 0., 1.0};
Point(22) = {scattererRadius * Cos(7/4*Pi), scale_y * scattererRadius, 0., 1.0};
Point(23) = {scattererRadius * Cos(5/4*Pi), scale_y * scattererRadius, 0., 1.0};
Point(24) = {- scale_y * scattererRadius, scattererRadius * Sin(3/4*Pi), 0., 1.0};
Point(25) = {- scale_y * scattererRadius, scattererRadius * Sin(5/4*Pi), 0., 1.0};

Point(26) = {scattererHalfRadius * Cos(Pi), scattererHalfRadius * Sin(Pi), 0., 1.0};
Point(27) = {scattererHalfRadius * Cos(5/4*Pi), scattererHalfRadius * Sin(5/4*Pi), 0., 1.0};
Point(28) = {scattererHalfRadius * Cos(3/2*Pi), scattererHalfRadius * Sin(3/2*Pi), 0., 1.0};
Point(29) = {scattererHalfRadius * Cos(7/4*Pi), scattererHalfRadius * Sin(7/4*Pi), 0., 1.0};
Point(30) = {scattererHalfRadius, 0., 0., 1.0};
Point(31) = {scattererHalfRadius * Cos(1/4*Pi), scattererHalfRadius * Sin(1/4*Pi), 0., 1.0};
Point(32) = {scattererHalfRadius * Cos(1/2*Pi), scattererHalfRadius * Sin(1/2*Pi), 0., 1.0};
Point(33) = {scattererHalfRadius * Cos(3/4*Pi), scattererHalfRadius * Sin(3/4*Pi), 0., 1.0};

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

Line(37) = {5, 26};
Line(38) = {5, 28};
Line(39) = {5, 30};
Line(40) = {5, 32};

Line(41) = {26, 27};
Line(42) = {27, 28};
Line(43) = {28, 29};
Line(44) = {29, 30};
Line(45) = {30, 31};
Line(46) = {31, 32};
Line(47) = {32, 33};
Line(48) = {33, 26};

Line(49) = {26, 6};
Line(50) = {27, 7};
Line(51) = {28, 8};
Line(52) = {29, 9};
Line(53) = {30, 10};
Line(54) = {31, 11};
Line(55) = {32, 12};
Line(56) = {33, 13};

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

Curve Loop(25) = {37, 41, 42, -38};
Plane Surface(26) = {25};
Curve Loop(27) = {38, 43, 44, -39};
Plane Surface(28) = {27};
Curve Loop(29) = {39, 45, 46, -40};
Plane Surface(30) = {29};
Curve Loop(31) = {40, 47, 48, -37};
Plane Surface(32) = {31};

Curve Loop(33) = {49, 17, -50, -41};
Plane Surface(34) = {33};
Curve Loop(35) = {50, 18, -51, -42};
Plane Surface(36) = {35};
Curve Loop(37) = {51, 19, -52, -43};
Plane Surface(38) = {37};
Curve Loop(39) = {52, 20, -53, -44};
Plane Surface(40) = {39};
Curve Loop(41) = {53, 21, -54, -45};
Plane Surface(42) = {41};
Curve Loop(43) = {54, 22, -55, -46};
Plane Surface(44) = {43};
Curve Loop(45) = {55, 23, -56, -47};
Plane Surface(46) = {45};
Curve Loop(47) = {56, 24, -49, -48};
Plane Surface(48) = {47};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {13, 14, 15, 16};
Physical Curve(2) = {5, 6, 7, 8};
Physical Curve(3) = {1, 2, 3, 4,
                     9, 10, 11, 12};

Physical Surface(1) = {2, 4, 6, 8,
                       10, 12, 14, 16, 18, 20, 22, 24};
Physical Surface(2) = {26, 28, 30, 32,
                       34, 36, 38, 40, 42, 44, 46, 48};

// =============== //
// Set transfinite //
// =============== //

numPoints1 = ( scattererRadius * Cos(5/4*Pi) - (- scale_x * scattererRadius) ) * numElementPerWavelength / wavelength + 1;
numPoints2 = ( scattererRadius * Sin(5/4*Pi) - (- scale_y * scattererRadius) ) * numElementPerWavelength / wavelength + 1;
numPoints3 = ( - scattererRadius * Cos(5/4*Pi) ) * numElementPerWavelength / wavelength + 1;
numPoints4 = ( - scattererRadius * Sin(5/4*Pi) ) * numElementPerWavelength / wavelength + 1;
numPoints5 = ( scattererHalfRadius ) * numElementPerWavelength / wavelength + 1;

Transfinite Line {4, 9,
                  28, 29, 30} = numPoints1;
Transfinite Line {1, 12, 34, 35, 36, 
                  5, 8, 13, 16,
                  25, 26, 27,
                  31, 32, 33} = numPoints2;
Transfinite Line {2, 3, 10, 11,
                  18, 19, 22, 23,
                  37, 39,
                  42, 43, 46, 47} = numPoints3;
Transfinite Line {6, 7, 14, 15,
                  17, 20, 21, 24,
                  38, 40,
                  41, 44, 45, 48} = numPoints4;
Transfinite Line {49, 50, 51, 52, 53, 54, 55, 56} = numPoints5;

Transfinite Surface "*";
Recombine Surface "*";

Printf("The wavelength is %g meter", wavelength);
Printf("Number of points 1 is %g", numPoints1);
Printf("Number of points 2 is %g", numPoints2);
Printf("Number of points 3 is %g", numPoints3);
Printf("Number of points 4 is %g", numPoints4);
Printf("Number of points 5 is %g", numPoints5);
