// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// 2D circular domain with a circular hole
//
// ----------------------------------------------------------------------------
// Copyright (C) 2025 Adeeb Arif Kor

SetFactory("OpenCASCADE");

// Geometry and mesh parameters

wavelength = 0.1;
domainRadius = 1.0;
scattererRadius = 0.2;

lc = wavelength / 5;
Mesh.CharacteristicLengthMin = lc;
Mesh.CharacteristicLengthMax = lc;

// Create disks
Disk(1) = {0., 0., 0., domainRadius, domainRadius};
Disk(2) = {0., 0., 0., scattererRadius, scattererRadius};

// Substract inner disk from outer disk
BooleanDifference(3) = { Surface{1}; Delete; }{ Surface{2}; Delete; };

// Get boundary curves
boundary[] = Boundary{ Surface{3}; };

// Set physical curves and surfaces
Physical Curve(1) = { boundary[0] };
Physical Curve(2) = { boundary[1] };
Physical Surface(3) = {3};