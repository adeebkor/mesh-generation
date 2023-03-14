import numpy as np
import pandas as pd

# Generate data
Nx = 4
Ny = 4
Nz = 3

xi = np.full(4, 0)
yi = np.linspace(-0.035, 0.035, Ny)
zi = np.linspace(-0.035, 0.035, Nz)

X, Y, Z = np.meshgrid(xi, yi, zi, indexing="ij")

points = np.hstack((X.reshape(-1, 1),
                    Y.reshape(-1, 1),
                    Z.reshape(-1, 1)))

npoints = points.shape[0]

# ----------------- #
# Write to geo file #
# ----------------- #

file_object = open(r"simple.geo", "w")

for p in range(npoints):
    xp_i = points[p, 0]
    yp_i = points[p, 1]
    zp_i = points[p, 2]

    file_object.write(
        f"Point({p + 100000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")
    
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        lnum = yl + zl*(Ny-1) + 100000
        p1 = yl*Nz + zl + 100000
        p2 = yl*Nz + zl + Nz + 100000
        file_object.write(
            f"Line({lnum}) = {{{p1}, {p2}}};\n")

file_object.write("\n\n")
        
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        lnum = zl + yl*(Nz-1) + 200000
        p1 = zl + yl*Nz + 100000
        p2 = zl + yl*Nz + 100001
        file_object.write(
            f"Line({lnum}) = {{{p1}, {p2}}};\n")

file_object.write("\n\n")
        
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1), 100000 + yc + zc*(Ny-1), 20000 + zc + yc*(Nz-1) + (Nz-1),
        #       100000 + yc + zc*(Ny-1) + Ny - 1, 20000 + zc + yc*(Nz-1))
        lloop_num = 2 * (yc + zc*(Ny-1)) + 300000
        surf = 2 * (yc + zc*(Ny-1)) + 300001
        l1 = 100000 + yc + zc*(Ny-1)
        l2 = 200000 + zc + yc*(Nz-1) + (Nz-1)
        l3 = 100000 + yc + zc*(Ny-1) + Ny - 1
        l4 = 200000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({lloop_num}) = {{{l1}, {-l2}, {-l3}, {-l4}}};\n"
        )
        file_object.write(
            f"Surface({surf}) = {{{lloop_num}}};\n"
        )

file_object.close()