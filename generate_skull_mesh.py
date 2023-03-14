import numpy as np
import pandas as pd
import mat73

# Read data
data = mat73.loadmat("SKULL-MAPS/skull_mask_bm7_dx_1mm.mat")

xi = data["xi"]
yi = data["yi"]
zi = data["zi"]

skull_mask = data["skull_mask"]
brain_mask = data["brain_mask"]

# Get skull points
X, Y, Z = np.meshgrid(xi, yi, zi, indexing="ij")

x_skull = X[skull_mask]
y_skull = Y[skull_mask]
z_skull = Z[skull_mask]

# Create a dataframe
p_skull_volume = np.hstack((x_skull[:, np.newaxis],
                            y_skull[:, np.newaxis],
                            z_skull[:, np.newaxis]))
skull_volume_df = pd.DataFrame(p_skull_volume, columns=["X", "Y", "Z"])

# Get minimum and maximum at each (Y, Z) points
skull_surface_inner_df = skull_volume_df.groupby(
    ["Y", "Z"]).min().reset_index()
skull_surface_outer_df = skull_volume_df.groupby(
    ["Y", "Z"]).max().reset_index()

# Rearrange columns
skull_surface_inner_df = skull_surface_inner_df[["X", "Y", "Z"]]
skull_surface_outer_df = skull_surface_outer_df[["X", "Y", "Z"]]

# Convert to numpy array
skull_surface_inner = skull_surface_inner_df.to_numpy()
skull_surface_outer = skull_surface_outer_df.to_numpy()

npoints = skull_surface_inner.shape[0]
Ny = yi.shape[0]
Nz = zi.shape[0]

# ----------------- #
# Write to geo file #
# ----------------- #

file_object = open(r"planar_3d_6.geo", "w")

# --------------------- #
# Inner surface (skull) #
# --------------------- #

# Create points
for p in range(npoints):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    file_object.write(
        f"Point({p + 100000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
transfinite_line_1 = []
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 100000
        point_1 = yl*Nz + zl + 100000
        point_2 = yl*Nz + zl + Nz + 100000

        transfinite_line_1.append(str(line_number))

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        line_number = zl + yl*(Nz-1) + 200000
        point_1 = zl + yl*Nz + 100000
        point_2 = zl + yl*Nz + 100001

        transfinite_line_1.append(str(line_number))

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1), 100000 + yc + zc*(Ny-1),
        #       20000 + zc + yc*(Nz-1) + (Nz-1),
        #       100000 + yc + zc*(Ny-1) + Ny - 1,
        #       20000 + zc + yc*(Nz-1))
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 300000
        surface = 2 * (yc + zc*(Ny-1)) + 300001
        line_1 = 100000 + yc + zc*(Ny-1)
        line_2 = 200000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 100000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 200000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

# --------------------- #
# Outer surface (skull) #
# --------------------- #

# Create points
for p in range(npoints):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    file_object.write(
        f"Point({p + 400000}) = {{{xp_i}, {yp_i}, {zp_i}, 0.005}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 400000
        point_1 = yl*Nz + zl + 400000
        point_2 = yl*Nz + zl + Nz + 400000
        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line_1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        line_number = zl + yl*(Nz-1) + 500000
        point_1 = zl + yl*Nz + 400000
        point_2 = zl + yl*Nz + 400001
        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line_1.append(str(line_number))

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1), 100000 + yc + zc*(Ny-1),
        #       20000 + zc + yc*(Nz-1) + (Nz-1),
        #       100000 + yc + zc*(Ny-1) + Ny - 1,
        #       20000 + zc + yc*(Nz-1))

        line_loop_number = 2 * (yc + zc*(Ny-1)) + 600000
        surface = 2 * (yc + zc*(Ny-1)) + 600001
        line_1 = 400000 + yc + zc*(Ny-1)
        line_2 = 500000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 400000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 500000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

# -------------------------------------------- #
# Connecting the inner and outer skull surface #
# -------------------------------------------- #

transfinite_line_2 = []

for p in range(Ny*Nz):
    # print(100000 + p, 400000 + p)

    line_number = p + 700000
    point_1 = p + 100000
    point_2 = p + 400000

    transfinite_line_2.append(str(line_number))

    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), 100000 + yl + zl*(Ny-1),
        #       700000 + zl + yl*Nz + Nz,
        #       400000 + yl + zl*(Ny-1),
        #       700000 + zl + yl*Nz)

        line_loop_number = 2 * (yl + zl*(Ny-1)) + 800000
        surface = 2 * (yl + zl*(Ny-1)) + 800001
        line_1 = 100000 + yl + zl*(Ny-1)
        line_2 = 700000 + zl + yl*Nz + Nz
        line_3 = 400000 + yl + zl*(Ny-1)
        line_4 = 700000 + zl + yl*Nz
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for zl in range(Nz-1):
    for yl in range(Ny):
        # print(yl + zl*Ny, 200000 + zl + yl*(Nz-1),
        #       700001 + zl + yl*Nz,
        #       500000 + zl + yl*(Nz-1),
        #       700000 + zl + yl*Nz)

        line_loop_number = 2 * (yl + zl*Ny) + 900000
        surface = 2 * (yl + zl*Ny) + 900001
        line_1 = 200000 + zl + yl*(Nz-1)
        line_2 = 700001 + zl + yl*Nz
        line_3 = 500000 + zl + yl*(Nz-1)
        line_4 = 700000 + zl + yl*Nz
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

volumes = []
for zv in range(Nz-1):
    for yv in range(Ny-1):
        # print(surface_loop_number, vol,
        #       300001 + 2 * (yv + zv*(Ny-1)),
        #       600001 + 2 * (yv + zv*(Ny-1)),
        #       800001 + 2 * (yv + zv*(Ny-1)),
        #       800001 + 2 * ((yv + zv*(Ny-1)) + Ny - 1),
        #       900001 + 2*(yv + zv*Ny),
        #       900003 + 2*(yv + zv*Ny))

        surface_loop_number = 2 * (yv + zv*(Ny-1)) + 1000000
        volume = 2 * (yv + zv*(Ny-1)) + 1000001
        surface_1 = 300001 + 2 * (yv + zv*(Ny-1))
        surface_2 = 600001 + 2 * (yv + zv*(Ny-1))
        surface_3 = 800001 + 2 * (yv + zv*(Ny-1))
        surface_4 = 800001 + 2 * ((yv + zv*(Ny-1)) + Ny - 1)
        surface_5 = 900001 + 2*(yv + zv*Ny)
        surface_6 = 900003 + 2*(yv + zv*Ny)

        file_object.write(
            f"Surface Loop({surface_loop_number}) = "
            f"{{{surface_1}, {surface_2}, {surface_3}, "
            f"{surface_4}, {surface_5}, {surface_6}}};\n")
        file_object.write(
            f"Volume({volume}) = {{{surface_loop_number}}};\n")

        volumes.append(str(volume))

file_object.write("\n\n")

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line_1))
file_object.write("} = 1.0;\n\n")

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line_2))
file_object.write("} = 8.0;\n\n")

file_object.write("Physical Surface(1) = {3000001};\n\n")

file_object.write("Physical Volume (1) = {")
file_object.write(", ".join(volumes))
file_object.write("};\n\n")

file_object.write("Transfinite Surface \"*\";\n")
file_object.write("Recombine Surface \"*\";\n")

file_object.write("Transfinite Volume \"*\";\n")

file_object.close()
