// ----------------------------------------------------------------------------
//
// Gmsh GEO file
//
// Domain for 2D planar problem
// - Structured quadrilateral mesh
// - Sponge layer
//
// ----------------------------------------------------------------------------

speedOfSound = 1500;
sourceFrequency = 500000;

wavelength = speedOfSound / sourceFrequency;
numExtraLayer = 15;
domainRadius = 0.035;
domainLength = 0.12;

spongeRadius = domainRadius + numExtraLayer*wavelength;
spongeLength = domainLength + numExtraLayer*wavelength;

sourceRadius = 0.01;
numElementPerWavelength = 3;

hmin = 0.005; // placeholder for the mesh size

// ------------------------------------------------------------------------- // 
// Rectangle 1 (Layer 1)                                                     //
// ------------------------------------------------------------------------- // 

lengthLayer1 = 0.03;

Point(1) = {0., -sourceRadius, 0., hmin};
Point(2) = {lengthLayer1, -sourceRadius, 0., hmin};
Point(3) = {lengthLayer1, sourceRadius, 0., hmin};
Point(4) = {0., sourceRadius, 0., hmin};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Line Loop(101) = {1, 2, 3, 4};
Ruled Surface(102) = {101};

// ------------------------------------------------------------------------- // 
// Rectangle 2 (Layer 1)                                                     //
// ------------------------------------------------------------------------- // 

Point(5) = {0., -domainRadius, 0., hmin};
Point(6) = {lengthLayer1, -domainRadius, 0., hmin};

Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};

Line Loop(103) = {5, 6, 7, -1};
Ruled Surface(104) = {103};

// ------------------------------------------------------------------------- // 
// Rectangle 3 (Layer 1)                                                     // 
// ------------------------------------------------------------------------- // 

Point(7) = {0., domainRadius, 0., hmin};
Point(8) = {lengthLayer1, domainRadius, 0., hmin};

Line(8) = {4, 7};
Line(9) = {7, 8};
Line(10) = {8, 3};

Line Loop(105) = {8, 9, 10, 3};
Ruled Surface(106) = {105};

// ------------------------------------------------------------------------- // 
// Sponge layer bottom (Layer 1)                                             //
// ------------------------------------------------------------------------- // 

Point(9) = {0., -spongeRadius, 0., hmin};
Point(10) = {lengthLayer1, -spongeRadius, 0., hmin};

Line(11) = {5, 9};
Line(12) = {9, 10};
Line(13) = {10, 6};

Line Loop(107) = {11, 12, 13, -6};
Ruled Surface(108) = {107};

// ------------------------------------------------------------------------- // 
// Sponge layer top (Layer 1)                                                //
// ------------------------------------------------------------------------- // 

Point(11) = {0., spongeRadius, 0., hmin};
Point(12) = {lengthLayer1, spongeRadius, 0., hmin};

Line(14) = {7, 11};
Line(15) = {11, 12};
Line(16) = {12, 8};

Line Loop(109) = {14, 15, 16, -9};
Ruled Surface(110) = {109};

// ------------------------------------------------------------------------- // 
// Rectangle 1 (Layer 2)                                                     //
// ------------------------------------------------------------------------- // 

lengthLayer2 = lengthLayer1 + 0.0065;

Point(13) = {lengthLayer2, -sourceRadius, 0., hmin};
Point(14) = {lengthLayer2, sourceRadius, 0., hmin};

Line(17) = {2, 13};
Line(18) = {13, 14};
Line(19) = {14, 3};

Line Loop(201) = {17, 18, 19, -2};
Ruled Surface(202) = {201};

// ------------------------------------------------------------------------- // 
// Rectangle 2 (Layer 2)                                                     //
// ------------------------------------------------------------------------- // 

Point(15) = {lengthLayer2, -domainRadius, 0., hmin};

Line(20) = {6, 15};
Line(21) = {15, 13};

Line Loop(203) = {20, 21, -17, -7};
Ruled Surface(204) = {203};

// ------------------------------------------------------------------------- // 
// Rectangle 3 (Layer 2)                                                     //
// ------------------------------------------------------------------------- // 

Point(16) = {lengthLayer2, domainRadius, 0., hmin};

Line(22) = {14, 16};
Line(23) = {16, 8};

Line Loop(205) = {-19, 22, 23, 10};
Ruled Surface(206) = {205};

// ------------------------------------------------------------------------- // 
// Sponge layer bottom (Layer 2)                                             //
// ------------------------------------------------------------------------- // 

Point(17) = {lengthLayer2, -spongeRadius, 0., hmin};

Line(24) = {10, 17};
Line(25) = {17, 15};

Line Loop(207) = {-13, 24, 25, -20};
Ruled Surface(208) = {207};

// ------------------------------------------------------------------------- // 
// Sponge layer top (Layer 2)                                                //
// ------------------------------------------------------------------------- // 

Point(18) = {lengthLayer2, spongeRadius, 0., hmin};

Line(26) = {16, 18};
Line(27) = {18, 12};

Line Loop(209) = {-23, 26, 27, 16};
Ruled Surface(210) = {209};

// ------------------------------------------------------------------------- // 
// Rectangle 1 (Layer 3)                                                     //
// ------------------------------------------------------------------------- // 

lengthLayer3 = lengthLayer2 + 0.0835;

Point(19) = {lengthLayer3, -sourceRadius, 0., hmin};
Point(20) = {lengthLayer3, sourceRadius, 0., hmin};

Line(28) = {13, 19};
Line(29) = {19, 20};
Line(30) = {20, 14};

Line Loop(301) = {28, 29, 30, -18};
Ruled Surface(302) = {301};

// ------------------------------------------------------------------------- // 
// Rectangle 2 (Layer 3)                                                     //
// ------------------------------------------------------------------------- // 

Point(21) = {lengthLayer3, -domainRadius, 0., hmin};

Line(31) = {15, 21};
Line(32) = {21, 19};

Line Loop(303) = {31, 32, -28, -21};
Ruled Surface(304) = {303};

// ------------------------------------------------------------------------- // 
// Rectangle 3 (Layer 3)                                                     //
// ------------------------------------------------------------------------- // 

Point(22) = {lengthLayer3, domainRadius, 0., hmin};

Line(33) = {20, 22};
Line(34) = {22, 16};

Line Loop(305) = {-30, 33, 34, -22};
Ruled Surface(306) = {305};

// ------------------------------------------------------------------------- // 
// Sponge layer bottom (Layer 3)                                             //
// ------------------------------------------------------------------------- // 

Point(23) = {lengthLayer3, -spongeRadius, 0., hmin};

Line(35) = {17, 23};
Line(36) = {23, 21};

Line Loop(307) = {35, 36, -31, -25};
Ruled Surface(308) = {307};

// ------------------------------------------------------------------------- // 
// Sponge layer top (Layer 3)                                                //
// ------------------------------------------------------------------------- // 

Point(24) = {lengthLayer3, spongeRadius, 0., hmin};

Line(37) = {22, 24};
Line(38) = {24, 18};

Line Loop(309) = {-34, 37, 38, -26};
Ruled Surface(310) = {309};

// ------------------------------------------------------------------------- // 
// Rectangle 1 (Sponge layer)                                                //
// ------------------------------------------------------------------------- // 

Point(25) = {spongeLength, -sourceRadius, 0., hmin};
Point(26) = {spongeLength, sourceRadius, 0., hmin};

Line(39) = {19, 25};
Line(40) = {25, 26};
Line(41) = {26, 20};

Line Loop(401) = {39, 40, 41, -29};
Ruled Surface(402) = {401};

// ------------------------------------------------------------------------- // 
// Rectangle 2 (Sponge layer)                                                //
// ------------------------------------------------------------------------- // 

Point(27) = {spongeLength, -domainRadius, 0., hmin};

Line(42) = {21, 27};
Line(43) = {27, 25};

Line Loop(403) = {42, 43, -39, -32};
Ruled Surface(404) = {403};

// ------------------------------------------------------------------------- // 
// Rectangle 3 (Sponge layer)                                                //
// ------------------------------------------------------------------------- // 

Point(28) = {spongeLength, domainRadius, 0., hmin};

Line(44) = {26, 28};
Line(45) = {28, 22};

Line Loop(405) = {-41, 44, 45, -33};
Ruled Surface(406) = {405};

// ------------------------------------------------------------------------- // 
// Sponge layer bottom (Sponge layer)                                        //
// ------------------------------------------------------------------------- // 

Point(29) = {spongeLength, -spongeRadius, 0., hmin};

Line(46) = {23, 29};
Line(47) = {29, 27};

Line Loop(407) = {-36, 46, 47, -42};
Ruled Surface(408) = {407};

// ------------------------------------------------------------------------- // 
// Sponge layer top (Sponge layer)                                           //
// ------------------------------------------------------------------------- // 

Point(30) = {spongeLength, spongeRadius, 0., hmin};

Line(48) = {28, 30};
Line(49) = {30, 24};

Line Loop(409) = {-45, 48, 49, -37};
Ruled Surface(410) = {409};

// ----------------------- //
// Tag curves and surfaces //
// ----------------------- //

Physical Curve(1) = {4};
Physical Curve(2) = {12, 24, 35, 46, 15, 27, 38, 49, 47, 43, 40, 44, 48};
Physical Curve(3) = {5, 8, 11, 14};

// Physical Surface(1) = {102, 104, 106, 302, 304, 306};
// Physical Surface(2) = {202, 204, 206};
// Physical Surface(3) = {108, 110, 208, 210, 308, 310, 402, 404, 406, 408, 410};
Physical Surface(1) = {102, 104, 106, 202, 204, 206, 302, 304, 306, 402, 404, 406};
Physical Surface(2) = {108, 110, 208, 210, 308, 310, 408, 410};

// =============== //
// Set transfinite //
// =============== //

Transfinite Line {2, 4, 18, 29, 40} = numElementPerWavelength * 2 * sourceRadius / wavelength + 1;
Transfinite Line {5, 7, 21, 32, 43, 8, 10, 22, 33, 44} = numElementPerWavelength * (domainRadius - sourceRadius/2) / wavelength + 1;
Transfinite Line {11, 13, 25, 36, 47, 14, 16, 26, 37, 48} = numElementPerWavelength * (spongeRadius - domainRadius - sourceRadius/2) / wavelength + 1;
Transfinite Line {1, 3, 6, 9, 12, 15} = numElementPerWavelength * lengthLayer1 / wavelength + 1;
Transfinite Line {17, 19, 20, 23, 24, 27} = numElementPerWavelength * (lengthLayer2 - lengthLayer1) / wavelength + 1;
Transfinite Line {28, 30, 31, 34, 35, 38} = numElementPerWavelength * (lengthLayer3 - lengthLayer2) / wavelength + 1;
Transfinite Line {39, 41, 42, 45, 46, 49} = numElementPerWavelength * (spongeLength - lengthLayer3) / wavelength + 1;

Transfinite Surface "*";
Recombine Surface "*";
