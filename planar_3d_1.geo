c0 = 1500;
f0 = 500000;

lmbda = c0 / f0;
N = 15;
L = 0.12 + N*lmbda;
L_b0 = 0.03;
L_b1 = 0.03 + 0.0065;
R = 0.035 + N*lmbda;

epw = 2.0;
nw = L / lmbda;
nx = epw * nw * 1;

p_r = 0.01;

Point(1) = {0., 0., 0., 1.0};
Point(2) = {p_r * Cos(Pi), p_r * Sin(Pi), 0., 1.0};
Point(3) = {p_r * Cos(5/4*Pi), p_r * Sin(5/4*Pi), 0., 1.0};
Point(4) = {p_r * Cos(3/2*Pi), p_r * Sin(3/2*Pi), 0., 1.0};
Point(5) = {p_r * Cos(7/4*Pi), p_r * Sin(7/4*Pi), 0., 1.0};
Point(6) = {p_r, 0., 0., 1.0};
Point(7) = {p_r * Cos(1/4*Pi), p_r * Sin(1/4*Pi), 0., 1.0};
Point(8) = {p_r * Cos(1/2*Pi), p_r * Sin(1/2*Pi), 0., 1.0};
Point(9) = {p_r * Cos(3/4*Pi), p_r * Sin(3/4*Pi), 0., 1.0};

Point(10) = {R, 0., 0., 1.0};
Point(11) = {R * Cos(Pi), R * Sin(Pi), 0., 1.0};
Point(12) = {R * Cos(5/4*Pi), R * Sin(5/4*Pi), 0., 1.0};
Point(13) = {R * Cos(3/2*Pi), R * Sin(3/2*Pi), 0., 1.0};
Point(14) = {R * Cos(7/4*Pi), R * Sin(7/4*Pi), 0., 1.0};
Point(15) = {R, 0., 0., 1.0};
Point(16) = {R * Cos(1/4*Pi), R * Sin(1/4*Pi), 0., 1.0};
Point(17) = {R * Cos(1/2*Pi), R * Sin(1/2*Pi), 0., 1.0};
Point(18) = {R * Cos(3/4*Pi), R * Sin(3/4*Pi), 0., 1.0};

Point(19) = {p_r / 2 * Cos(Pi), p_r / 2 * Sin(Pi), 0., 1.0};
Point(20) = {p_r / 2 * Cos(5/4*Pi), p_r / 2 * Sin(5/4*Pi), 0., 1.0};
Point(21) = {p_r / 2 * Cos(3/2*Pi), p_r / 2 * Sin(3/2*Pi), 0., 1.0};
Point(22) = {p_r / 2 * Cos(7/4*Pi), p_r / 2 * Sin(7/4*Pi), 0., 1.0};
Point(23) = {p_r / 2, 0., 0., 1.0};
Point(24) = {p_r / 2 * Cos(1/4*Pi), p_r / 2 * Sin(1/4*Pi), 0., 1.0};
Point(25) = {p_r / 2 * Cos(1/2*Pi), p_r / 2 * Sin(1/2*Pi), 0., 1.0};
Point(26) = {p_r / 2 * Cos(3/4*Pi), p_r / 2 * Sin(3/4*Pi), 0., 1.0};

Point(27) = {0., 0., L, 1.0};
Point(28) = {p_r * Cos(Pi), p_r * Sin(Pi), L, 1.0};
Point(29) = {p_r * Cos(5/4*Pi), p_r * Sin(5/4*Pi), L, 1.0};
Point(30) = {p_r * Cos(3/2*Pi), p_r * Sin(3/2*Pi), L, 1.0};
Point(31) = {p_r * Cos(7/4*Pi), p_r * Sin(7/4*Pi), L, 1.0};
Point(32) = {p_r, 0., L, 1.0};
Point(33) = {p_r * Cos(1/4*Pi), p_r * Sin(1/4*Pi), L, 1.0};
Point(34) = {p_r * Cos(1/2*Pi), p_r * Sin(1/2*Pi), L, 1.0};
Point(35) = {p_r * Cos(3/4*Pi), p_r * Sin(3/4*Pi), L, 1.0};

Point(36) = {R, 0., L, 1.0};
Point(37) = {R * Cos(Pi), R * Sin(Pi), L, 1.0};
Point(38) = {R * Cos(5/4*Pi), R * Sin(5/4*Pi), L, 1.0};
Point(39) = {R * Cos(3/2*Pi), R * Sin(3/2*Pi), L, 1.0};
Point(40) = {R * Cos(7/4*Pi), R * Sin(7/4*Pi), L, 1.0};
Point(41) = {R, 0., L, 1.0};
Point(42) = {R * Cos(1/4*Pi), R * Sin(1/4*Pi), L, 1.0};
Point(43) = {R * Cos(1/2*Pi), R * Sin(1/2*Pi), L, 1.0};
Point(44) = {R * Cos(3/4*Pi), R * Sin(3/4*Pi), L, 1.0};

Point(45) = {p_r / 2 * Cos(Pi), p_r / 2 * Sin(Pi), L, 1.0};
Point(46) = {p_r / 2 * Cos(5/4*Pi), p_r / 2 * Sin(5/4*Pi), L, 1.0};
Point(47) = {p_r / 2 * Cos(3/2*Pi), p_r / 2 * Sin(3/2*Pi), L, 1.0};
Point(48) = {p_r / 2 * Cos(7/4*Pi), p_r / 2 * Sin(7/4*Pi), L, 1.0};
Point(49) = {p_r / 2, 0., L, 1.0};
Point(50) = {p_r / 2 * Cos(1/4*Pi), p_r / 2 * Sin(1/4*Pi), L, 1.0};
Point(51) = {p_r / 2 * Cos(1/2*Pi), p_r / 2 * Sin(1/2*Pi), L, 1.0};
Point(52) = {p_r / 2 * Cos(3/4*Pi), p_r / 2 * Sin(3/4*Pi), L, 1.0};

Point(53) = {0., 0., L_b0, 1.0};
Point(54) = {p_r * Cos(Pi), p_r * Sin(Pi), L_b0, 1.0};
Point(55) = {p_r * Cos(5/4*Pi), p_r * Sin(5/4*Pi), L_b0, 1.0};
Point(56) = {p_r * Cos(3/2*Pi), p_r * Sin(3/2*Pi), L_b0, 1.0};
Point(57) = {p_r * Cos(7/4*Pi), p_r * Sin(7/4*Pi), L_b0, 1.0};
Point(58) = {p_r, 0., L_b0, 1.0};
Point(59) = {p_r * Cos(1/4*Pi), p_r * Sin(1/4*Pi), L_b0, 1.0};
Point(60) = {p_r * Cos(1/2*Pi), p_r * Sin(1/2*Pi), L_b0, 1.0};
Point(61) = {p_r * Cos(3/4*Pi), p_r * Sin(3/4*Pi), L_b0, 1.0};

Point(62) = {R, 0., L_b0, 1.0};
Point(63) = {R * Cos(Pi), R * Sin(Pi), L_b0, 1.0};
Point(64) = {R * Cos(5/4*Pi), R * Sin(5/4*Pi), L_b0, 1.0};
Point(65) = {R * Cos(3/2*Pi), R * Sin(3/2*Pi), L_b0, 1.0};
Point(66) = {R * Cos(7/4*Pi), R * Sin(7/4*Pi), L_b0, 1.0};
Point(67) = {R, 0., L_b0, 1.0};
Point(68) = {R * Cos(1/4*Pi), R * Sin(1/4*Pi), L_b0, 1.0};
Point(69) = {R * Cos(1/2*Pi), R * Sin(1/2*Pi), L_b0, 1.0};
Point(70) = {R * Cos(3/4*Pi), R * Sin(3/4*Pi), L_b0, 1.0};

Point(45) = {p_r / 2 * Cos(Pi), p_r / 2 * Sin(Pi), L, 1.0};
Point(46) = {p_r / 2 * Cos(5/4*Pi), p_r / 2 * Sin(5/4*Pi), L, 1.0};
Point(47) = {p_r / 2 * Cos(3/2*Pi), p_r / 2 * Sin(3/2*Pi), L, 1.0};
Point(48) = {p_r / 2 * Cos(7/4*Pi), p_r / 2 * Sin(7/4*Pi), L, 1.0};
Point(49) = {p_r / 2, 0., L, 1.0};
Point(50) = {p_r / 2 * Cos(1/4*Pi), p_r / 2 * Sin(1/4*Pi), L, 1.0};
Point(51) = {p_r / 2 * Cos(1/2*Pi), p_r / 2 * Sin(1/2*Pi), L, 1.0};
Point(52) = {p_r / 2 * Cos(3/4*Pi), p_r / 2 * Sin(3/4*Pi), L, 1.0};
