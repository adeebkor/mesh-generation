import numpy as np
import pandas as pd
import mat73

from scipy.interpolate import griddata

# Read data
data = mat73.loadmat("SKULL-MAPS/skull_mask_bm7_dx_0.1mm.mat")

xi = data["xi"] / 1000
yi = data["yi"] / 1000
zi = data["zi"] / 1000

dy = yi[1] - yi[0]
dz = zi[1] - zi[0]

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
skull_surface_outer_df = skull_volume_df.groupby(
    ["Y", "Z"]).min().reset_index()
skull_surface_inner_df = skull_volume_df.groupby(
    ["Y", "Z"]).max().reset_index()

# Rearrange columns
skull_surface_outer_df = skull_surface_outer_df[["X", "Y", "Z"]]
skull_surface_inner_df = skull_surface_inner_df[["X", "Y", "Z"]]

# Sort based on Y and Z columns
skull_surface_outer_df = skull_surface_outer_df.sort_values(by=["Y", "Z"])
skull_surface_inner_df = skull_surface_inner_df.sort_values(by=["Y", "Z"])

# Convert to numpy array
skull_surface_outer = skull_surface_outer_df.to_numpy()
skull_surface_inner = skull_surface_inner_df.to_numpy()

# Reshape arrays
X_outer = skull_surface_outer[:, 0].reshape(yi.shape[0], zi.shape[0])
X_inner = skull_surface_inner[:, 0].reshape(yi.shape[0], zi.shape[0])
Y = skull_surface_outer[:, 1].reshape(yi.shape[0], zi.shape[0])
Z = skull_surface_outer[:, 2].reshape(yi.shape[0], zi.shape[0])

# Define interpolation points
Y_interp, Z_interp = np.mgrid[-0.035:0.035:71j, -0.035:0.035:71j]
Points = np.hstack((Y.reshape(-1, 1), Z.reshape(-1, 1)))

# Interpolate on outer surface to a larger mesh size
X_interp_outer_nearest = griddata(Points, X_outer.flatten(),
                                  (Y_interp, Z_interp), method='nearest')

# Interpolate on inner surface to a larger mesh size
X_interp_inner_nearest = griddata(Points, X_inner.flatten(),
                                  (Y_interp, Z_interp), method='nearest')

# Save mesh
skull_surface_outer_pp = np.hstack((X_interp_outer_nearest.reshape(-1, 1),
                                    Y_interp.reshape(-1, 1),
                                    Z_interp.reshape(-1, 1)))

skull_surface_inner_pp = np.hstack((X_interp_inner_nearest.reshape(-1, 1),
                                    Y_interp.reshape(-1, 1),
                                    Z_interp.reshape(-1, 1)))

output_filename = "mesh.npz"

with open(output_filename, "wb") as out_file:
    np.savez_compressed(
        out_file,
        skull_surface_outer=skull_surface_outer_pp,
        skull_surface_inner=skull_surface_inner_pp)
