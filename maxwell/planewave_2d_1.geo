// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Homogenous domain for 2D planewave problem
//
// ----------------------------------------------------------------------------
// Copyright (C) 2025 Adeeb Arif Kor

SetFactory("OpenCASCADE");

// Geometry and mesh parameters

wavelength = 0.1;
domainRadius = 0.5;

lc = wavelength / 15;
Mesh.CharacteristicLengthMin = lc;
Mesh.CharacteristicLengthMax = lc;

// Domain

Disk(1) = {0, 0, 0, domainRadius, domainRadius}; // create disk surface
disk_boundary[] = Boundary{ Surface{1}; }; // get disk boundary

// Tag curve and surfaces

Physical Curve(1) = {disk_boundary[]};
Physical Surface(2) = {1};