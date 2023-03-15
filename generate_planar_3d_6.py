import numpy as np
import pandas as pd
import mat73

# Parameters
speed_of_sound = 1500
source_frequency = 500000

wavelength = speed_of_sound / source_frequency
number_of_extra_wavelength = 11
domain_radius = 0.035 + number_of_extra_wavelength*wavelength
domain_length = 0.12 + number_of_extra_wavelength*wavelength

# Read data
data = mat73.loadmat("SKULL-MAPS/skull_mask_bm7_dx_5mm.mat")

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

file_object = open(r"planar_3d_7.geo", "w")
"""
# ------------------ #
# Transducer surface #
# ------------------ #

# Create points
for p in range(npoints):
    xp_i = 0.0
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    file_object.write(
        f"Point({p + 500000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 1300000
        point_1 = yl*Nz + zl + 500000
        point_2 = yl*Nz + zl + Nz + 500000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        line_number = zl + yl*(Nz-1) + 1400000
        point_1 = zl + yl*Nz + 500000
        point_2 = zl + yl*Nz + 500001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = 0.0
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = 0.0
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = 0.0
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = 0.0
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1500000
    point_1 = p + 600000
    point_2 = p + 600000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1500000
    point_1 = p + 600000
    point_2 = p + 600000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1600000
    point_1 = p + 600000
    point_2 = p + 600001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1600000
    point_1 = p + 600000
    point_2 = p + 600001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1700000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1700000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1800001
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1800000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create and tag surface
source_tag = []
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1),
        #       1300000 + yc + zc*(Ny-1),
        #       1400000 + zc + yc*(Nz-1) + (Nz-1),
        #       1300000 + yc + zc*(Ny-1) + Ny - 1,
        #       1400000 + zc + yc*(Nz-1))

        line_loop_number = 2 * (yc + zc*(Ny-1)) + 10000000
        surface = 2 * (yc + zc*(Ny-1)) + 10000001
        line_1 = 1300000 + yc + zc*(Ny-1)
        line_2 = 1400000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 1300000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 1400000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")
        
        yp = yi[yc] + dy/2
        zp = zi[zc] + dz/2

        R = np.sqrt(yp**2 + zp**2)

        if R < 0.01:
            source_tag.append(str(surface))
        
file_object.write("Physical Surface(1) = {")
file_object.write(", ".join(source_tag))
file_object.write("};\n\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 11000000
    surface = 2 * s + 11000001
    line_1 = 1700000 + s
    line_2 = 1500000 + s
    line_3 = 1700001 + s
    line_4 = 1300000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1800000 + (Ny-1)*(Nz-1)
line_4 += 1
file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1700000 + s + (Ny-1)*(Nz-1)
    line_2 = 1500000 + s + (Ny-1)*(Nz-1)
    line_3 = 1700001 + s + (Ny-1)*(Nz-1)
    line_4 = 1300000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1800000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 1700000
line_2 = 1600000
line_3 = 1800001
line_4 = 1400000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 1800001 + s
    line_2 = 1600001 + s
    line_3 = 1800002 + s
    line_4 = 1400001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1700000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1800000 + s + (Ny-1)*(Nz-1)
    line_2 = 1600000 + s + (Ny-1)*(Nz-1)
    line_3 = 1800001 + s + (Ny-1)*(Nz-1)
    line_4 = 1400000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

# --------------------- #
# Outer surface (skull) #
# --------------------- #

# Create points
for p in range(npoints):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    file_object.write(
        f"Point({p + 300000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 700000
        point_1 = yl*Nz + zl + 300000
        point_2 = yl*Nz + zl + Nz + 300000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        line_number = zl + yl*(Nz-1) + 800000
        point_1 = zl + yl*Nz + 300000
        point_2 = zl + yl*Nz + 300001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_outer.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_outer.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_outer.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_outer.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 900000
    point_1 = p + 400000
    point_2 = p + 400000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 900000
    point_1 = p + 400000
    point_2 = p + 400000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1000000
    point_1 = p + 400000
    point_2 = p + 400001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1000000
    point_1 = p + 400000
    point_2 = p + 400001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1100000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1100000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1200001
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1200000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1),
        #       1300000 + yc + zc*(Ny-1),
        #       1400000 + zc + yc*(Nz-1) + (Nz-1),
        #       1300000 + yc + zc*(Ny-1) + Ny - 1,
        #       1400000 + zc + yc*(Nz-1))

        line_loop_number = 2 * (yc + zc*(Ny-1)) + 20000000
        surface = 2 * (yc + zc*(Ny-1)) + 20000001
        line_1 = 700000 + yc + zc*(Ny-1)
        line_2 = 800000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 700000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 800000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 21000000
    surface = 2 * s + 21000001
    line_1 = 1100000 + s
    line_2 = 900000 + s
    line_3 = 1100001 + s
    line_4 = 700000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1200000 + (Ny-1)*(Nz-1)
line_4 += 1
file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1100000 + s + (Ny-1)*(Nz-1)
    line_2 = 900000 + s + (Ny-1)*(Nz-1)
    line_3 = 1100001 + s + (Ny-1)*(Nz-1)
    line_4 = 700000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1200000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 1100000
line_2 = 1000000
line_3 = 1200001
line_4 = 800000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 1200001 + s
    line_2 = 1000001 + s
    line_3 = 1200002 + s
    line_4 = 800001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1100000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1200000 + s + (Ny-1)*(Nz-1)
    line_2 = 1000000 + s + (Ny-1)*(Nz-1)
    line_3 = 1200001 + s + (Ny-1)*(Nz-1)
    line_4 = 800000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

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
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 100000
        point_1 = yl*Nz + zl + 100000
        point_2 = yl*Nz + zl + Nz + 100000

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

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_inner.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_inner.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_inner.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_inner.max() + 0.005
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 300000
    point_1 = p + 200000
    point_2 = p + 200000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 300000
    point_1 = p + 200000
    point_2 = p + 200000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 400000
    point_1 = p + 200000
    point_2 = p + 200001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 400000
    point_1 = p + 200000
    point_2 = p + 200001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 500000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 500000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 600001
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 600000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1),
        #       1300000 + yc + zc*(Ny-1),
        #       1400000 + zc + yc*(Nz-1) + (Nz-1),
        #       1300000 + yc + zc*(Ny-1) + Ny - 1,
        #       1400000 + zc + yc*(Nz-1))

        line_loop_number = 2 * (yc + zc*(Ny-1)) + 30000000
        surface = 2 * (yc + zc*(Ny-1)) + 30000001
        line_1 = 100000 + yc + zc*(Ny-1)
        line_2 = 200000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 100000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 200000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 31000000
    surface = 2 * s + 31000001
    line_1 = 500000 + s
    line_2 = 300000 + s
    line_3 = 500001 + s
    line_4 = 100000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 600000 + (Ny-1)*(Nz-1)
line_4 += 1
file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 500000 + s + (Ny-1)*(Nz-1)
    line_2 = 300000 + s + (Ny-1)*(Nz-1)
    line_3 = 500001 + s + (Ny-1)*(Nz-1)
    line_4 = 100000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")
    
line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 600000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 500000
line_2 = 400000
line_3 = 600001
line_4 = 200000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 600001 + s
    line_2 = 400001 + s
    line_3 = 600002 + s
    line_4 = 200001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 500000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 600000 + s + (Ny-1)*(Nz-1)
    line_2 = 400000 + s + (Ny-1)*(Nz-1)
    line_3 = 600001 + s + (Ny-1)*(Nz-1)
    line_4 = 200000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")
"""
# --------------------- #
# Domain length surface #
# --------------------- #

# Create points
for p in range(npoints):
    xp_i = domain_length
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    file_object.write(
        f"Point({p + 700000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        # print(yl + zl*(Ny-1), yl*Nz + zl, yl*Nz + zl + Nz)
        line_number = yl + zl*(Ny-1) + 1900000
        point_1 = yl*Nz + zl + 700000
        point_2 = yl*Nz + zl + Nz + 700000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        # print(zl + yl*(Nz-1), zl + yl*Nz, zl + yl*Nz + 1)
        line_number = zl + yl*(Nz-1) + 2000000
        point_1 = zl + yl*Nz + 700000
        point_2 = zl + yl*Nz + 700001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = domain_length
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 800000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = domain_length
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 800000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = domain_length
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 800000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = domain_length
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 800000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")
    
file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2100000
    point_1 = p + 800000
    point_2 = p + 800000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2100000
    point_1 = p + 800000
    point_2 = p + 800000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2200000
    point_1 = p + 800000
    point_2 = p + 800001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2200000
    point_1 = p + 800000
    point_2 = p + 800001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2300000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2300000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 2400001
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2400000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
        # print(yc + zc*(Ny-1),
        #       1300000 + yc + zc*(Ny-1),
        #       1400000 + zc + yc*(Nz-1) + (Nz-1),
        #       1300000 + yc + zc*(Ny-1) + Ny - 1,
        #       1400000 + zc + yc*(Nz-1))

        line_loop_number = 2 * (yc + zc*(Ny-1)) + 40000000
        surface = 2 * (yc + zc*(Ny-1)) + 40000001
        line_1 = 1900000 + yc + zc*(Ny-1)
        line_2 = 2000000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 1900000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 2000000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Surface({surface}) = {{{line_loop_number}}};\n")
        
for s in range(Nz-2):
    line_loop_number = 2 * s + 41000000
    surface = 2 * s + 41000001
    line_1 = 2300000 + s
    line_2 = 2100000 + s
    line_3 = 2300001 + s
    line_4 = 1900000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2400000 + (Ny-1)*(Nz-1)
line_4 += 1
file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 2300000 + s + (Ny-1)*(Nz-1)
    line_2 = 2100000 + s + (Ny-1)*(Nz-1)
    line_3 = 2300001 + s + (Ny-1)*(Nz-1)
    line_4 = 1900000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2400000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 2300000
line_2 = 2200000
line_3 = 2400001
line_4 = 2000000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 2400001 + s
    line_2 = 2200001 + s
    line_3 = 2400002 + s
    line_4 = 2000001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2300000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2400000 + s + (Ny-1)*(Nz-1)
    line_2 = 2200000 + s + (Ny-1)*(Nz-1)
    line_3 = 2400001 + s + (Ny-1)*(Nz-1)
    line_4 = 2000000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Surface({surface}) = {{{line_loop_number}}};\n")

"""
# -------- #
# Volume 1 #
# -------- #

# Connect the transducer surface and outer skull surface
for p in range(Ny*Nz):
    line_number = p + 2500000
    point_1 = p + 500000
    point_2 = p + 300000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2600000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2600000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2700000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2700000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

file_object.write("\n\n")

"""

file_object.close()