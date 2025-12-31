// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// 2D circular domain with a penetrable circle
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

// Fragment disks
s[] = BooleanFragments{ Surface{1}; Delete; }{ Surface{2}; Delete; };

// Get boundary curves
boundary[] = Boundary{ Surface{s[1]}; };

// Set physical curves and surfaces
Physical Curve(1) = { boundary[0] };
Physical Surface(1) = {3};
Physical Surface(2) = {2};