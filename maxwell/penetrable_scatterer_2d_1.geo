// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// 2D circular domain with a penetrable scatterer
//
// ----------------------------------------------------------------------------
// Copyright (C) 2026 Adeeb Arif Kor

SetFactory("OpenCASCADE");

// Geometry and mesh parameters

wavelength = 0.1;
domainRadius = 1.0;

lc = wavelength / 5;
Mesh.CharacteristicLengthMin = lc;
Mesh.CharacteristicLengthMax = lc;

// Create domain
Disk(1) = {0., 0., 0., domainRadius, domainRadius};

// Create scatterer
Point(2) = {-0.4, 0.0, 0};
Point(3) = {0.0, -0.4, 0};
Point(4) = {0.4, 0.0, 0};
Point(5) = {0.0, 0.4, 0};

Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 2};

Line Loop(2) = {2, 3, 4, 5};

Plane Surface(3) = {2};

// Fragment disks
s[] = BooleanFragments{ Surface{1}; Delete; }{ Surface{3}; Delete; };

// Get boundary curves
boundary[] = Boundary{ Surface{s[1]}; };

// Set physical curves and surfaces
Physical Curve(1) = { boundary[0] };
Physical Surface(1) = {4};
Physical Surface(2) = {3};