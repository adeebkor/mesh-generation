// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Plane wave scattering due to a circular scatterer
// - unstructured quadrilateral mesh
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

numElementPerWavelength = 10;

scattererRadius = 1.0 * wavelength;

// ------------------------------------------------------------------------- //
// Domain                                                                    //
// ------------------------------------------------------------------------- //

xscale = 12;
yscale = 12;

Point(1) = {- yscale * scattererRadius, - yscale * scattererRadius, 0., 1.0};
Point(2) = {xscale * scattererRadius, - yscale * scattererRadius, 0., 1.0};
Point(3) = {xscale * scattererRadius, yscale * scattererRadius, 0., 1.0};
Point(4) = {- yscale * scattererRadius, yscale * scattererRadius, 0., 1.0};
Point(5) = {0., 0., 0., 1.0};
Point(6) = {- scattererRadius, 0., 0., 1.0};
Point(7) = {scattererRadius, 0., 0., 1.0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};

Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(3) = {5, 6};

Plane Surface(1) = {1, 3};

// Set number of points on circle

numPoints = 2 * Pi * scattererRadius * numElementPerWavelength / wavelength + 1;

// Transfinite Curve {5, 6} = numPoints;

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {2};
Physical Curve(3) = {1, 3};

Physical Surface(1) = {1};

Mesh.MinimumCirclePoints = numPoints;

Recombine Surface "*";

// Uncomment below to try different algorithm 
// Refer to gmsh t11.geo for details

//Mesh.Algorithm = 8;
//Mesh.RecombinationAlgorithm = 3; // or 3

Printf("The wavelength is %g meter", wavelength);
Printf("Number of points is %g", numPoints);