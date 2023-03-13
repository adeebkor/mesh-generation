import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
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

# Inner surface

for p in range(npoints):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]
    
    file_object.write(
        f"Point({p + 100000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

for zl in range(Nz):
    for yl in range(Ny - 1):
        line_num = yl + zl*(Ny - 1)
        file_object.write(
            f"Line({line_num + 100000}) = {{{yl + zl*Ny + 100000}, {yl + zl*Ny + 100001}}};\n")

file_object.write("\n\n")

for yl in range(Ny):
    for zl in range(Nz - 1):
        line_num = zl + yl*(Nz - 1)
        file_object.write(
            f"Line({line_num + 200000}) = {{{zl + yl*Nz + 100000}, {zl + yl*Nz + Ny + 100001}}};\n")

file_object.write("\n\n")

file_object.close()