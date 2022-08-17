// Heterogenous domain

c0 = 1500;
f0 = 500000;

lmbda = c0 / f0;
N = 15;
R = 0.035;
L = 0.12;

PML_R = R + N*lmbda;
PML_L = L + N*lmbda;

p_r = 0.01;
epw = 3;

hmin = 0.005;

// 