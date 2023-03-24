import numpy as np

# Parameters
speed_of_sound = 1500
source_frequency = 500000

wavelength = speed_of_sound / source_frequency
number_of_extra_wavelength = 7
number_of_element_per_wavelength = 2.4
mesh_size_mm = 0.1
domain_radius = 0.035 + number_of_extra_wavelength*wavelength
domain_length = 0.12 + number_of_extra_wavelength*wavelength

# --------- #
# Read data #
# --------- #

data = np.load("mesh.npz")

skull_surface_outer = data["skull_surface_outer"]
skull_surface_inner = data["skull_surface_inner"]

npoints = skull_surface_inner.shape[0]
Ny = 71
Nz = 71
yi = np.linspace(-0.035, 0.035, Ny)
zi = np.linspace(-0.035, 0.035, Nz)

dy = yi[1] - yi[0]
dz = zi[1] - zi[0]

# ----------------- #
# Write to geo file #
# ----------------- #

file_object = open(r"transducer_3d_9.geo", "w")

transfinite_line1 = []
transfinite_line2 = []
transfinite_line3 = []
transfinite_line4 = []
transfinite_line5 = []

# ------------------ #
# Transducer surface #
# ------------------ #

# Create points
focal_length = 0.064

for p in range(npoints):
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]
    xp_i = - np.sqrt(focal_length**2 - yp_i**2 - zp_i**2) + 0.064

    file_object.write(
        f"Point({p + 500000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 1300000
        point_1 = yl*Nz + zl + 500000
        point_2 = yl*Nz + zl + Nz + 500000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 1400000
        point_1 = zl + yl*Nz + 500000
        point_2 = zl + yl*Nz + 500001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + 0.064

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + 0.064

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + 0.064

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + 0.064

    file_object.write(
        f"Point({p + 600000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point 1
file_object.write(
    f"Point(1) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1500000
    point_1 = p + 600000
    point_2 = p + 600000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1500000
    point_1 = p + 600000
    point_2 = p + 600000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1600000
    point_1 = p + 600000
    point_2 = p + 600001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1600000
    point_1 = p + 600000
    point_2 = p + 600001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create center point 2
file_object.write(
    f"Point(2) = {{{focal_length}, {0.0}, {0.0}, 1.0}};\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1700000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1700000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1800001
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1800000
    point_1 = p + 500000
    point_2 = p + 600000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create and tag surface
source_tag = []
for zc in range(Nz-1):
    for yc in range(Ny-1):
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
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

        yp = yi[yc] + dy/2
        zp = zi[zc] + dz/2

        R = np.sqrt(yp**2 + zp**2)

        if R < 0.032:
            source_tag.append(str(surface))

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        line_number = yl + zl*(Ny-1) + 700000
        point_1 = yl*Nz + zl + 300000
        point_2 = yl*Nz + zl + Nz + 300000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 800000
        point_1 = zl + yl*Nz + 300000
        point_2 = zl + yl*Nz + 300001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_outer[p, 0]
    yp_i = skull_surface_outer[p, 1]
    zp_i = skull_surface_outer[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_outer.max() + 0.001
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
    xp = skull_surface_outer.max() + 0.001
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
    xp = skull_surface_outer.max() + 0.001
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
    xp = skull_surface_outer.max() + 0.001
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

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 900000
    point_1 = p + 400000
    point_2 = p + 400000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1000000
    point_1 = p + 400000
    point_2 = p + 400001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1000000
    point_1 = p + 400000
    point_2 = p + 400001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1100000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1100000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1200001
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1200000
    point_1 = p + 300000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
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
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        line_number = yl + zl*(Ny-1) + 100000
        point_1 = yl*Nz + zl + 100000
        point_2 = yl*Nz + zl + Nz + 100000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 200000
        point_1 = zl + yl*Nz + 100000
        point_2 = zl + yl*Nz + 100001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = skull_surface_inner[p, 0]
    yp_i = skull_surface_inner[p, 1]
    zp_i = skull_surface_inner[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = skull_surface_inner.max() + 0.001
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
    xp = skull_surface_inner.max() + 0.001
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
    xp = skull_surface_inner.max() + 0.001
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
    xp = skull_surface_inner.max() + 0.001
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

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 300000
    point_1 = p + 200000
    point_2 = p + 200000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 400000
    point_1 = p + 200000
    point_2 = p + 200001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 400000
    point_1 = p + 200000
    point_2 = p + 200001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 500000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 500000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 600001
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 600000
    point_1 = p + 100000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
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
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        line_number = yl + zl*(Ny-1) + 1900000
        point_1 = yl*Nz + zl + 700000
        point_2 = yl*Nz + zl + Nz + 700000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 2000000
        point_1 = zl + yl*Nz + 700000
        point_2 = zl + yl*Nz + 700001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

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

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2100000
    point_1 = p + 800000
    point_2 = p + 800000 + Nz
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2200000
    point_1 = p + 800000
    point_2 = p + 800001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2200000
    point_1 = p + 800000
    point_2 = p + 800001
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2300000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2300000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 2400001
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2400000
    point_1 = p + 700000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create surfaces
for zc in range(Nz-1):
    for yc in range(Ny-1):
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
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

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
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# -------- #
# Volume 1 #
# -------- #

# Make line between the transducer surface and outer skull surface
for p in range(Ny*Nz):
    line_number = p + 2500000
    point_1 = p + 500000
    point_2 = p + 300000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2600000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2600000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2700000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2700000
    point_1 = p + 600000
    point_2 = p + 400000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 50000000
        surface = 2 * (yc + zc*(Ny-1)) + 50000001
        line_1 = 2500000 + zc + yc*Nz
        line_2 = 700000 + yc + zc*(Ny-1)
        line_3 = 2500000 + zc + (yc+1)*Nz
        line_4 = 1300000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 60000000
        surface = 2 * (zc + yc*(Nz-1)) + 60000001
        line_1 = 2500000 + zc + yc*Nz
        line_2 = 800000 + zc + yc*(Nz-1)
        line_3 = 2500001 + zc + yc*Nz
        line_4 = 1400000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 70000000
    surface = 2 * s + 70000001
    line_1 = 2600000 + s
    line_2 = 900000 + s
    line_3 = 2600001 + s
    line_4 = 1500000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2700000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 2600000 + (Ny-1)*(Nz-1) + s
    line_2 = 900000 + (Ny-1)*(Nz-1) + s
    line_3 = 2600001 + (Ny-1)*(Nz-1) + s
    line_4 = 1500000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2700000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 2600000
line_2 = 1000000
line_3 = 2700001
line_4 = 1600000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 2700001 + s
    line_2 = 1000001 + s
    line_3 = 2700002 + s
    line_4 = 1600001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2600000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2700000 + (Ny-1)*(Nz-1) + s
    line_2 = 1000000 + (Ny-1)*(Nz-1) + s
    line_3 = 2700001 + (Ny-1)*(Nz-1) + s
    line_4 = 1600000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 80000000 + 2*s
    surface = 80000001 + 2*s
    line_1 = 1700000 + s
    line_2 = 2600000 + s
    line_3 = 1100000 + s
    line_4 = 2500000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1700000 + (Ny-1)*(Nz-1) + s
    line_2 = 2600000 + (Ny-1)*(Nz-1) + s
    line_3 = 1100000 + (Ny-1)*(Nz-1) + s
    line_4 = 2500000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1800001 + s
    line_2 = 2700001 + s
    line_3 = 1200001 + s
    line_4 = 2500001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 1800000 + (Ny-1)*(Nz-1) + s
    line_2 = 2700000 + (Ny-1)*(Nz-1) + s
    line_3 = 1200000 + (Ny-1)*(Nz-1) + s
    line_4 = 2500000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# Make volume
volume_tag1 = []

for zc in range(Nz-1):
    for yc in range(Ny-1):
        surface_loop_number = 2 * (yc + zc*(Ny-1)) + 100000
        volume = 2 * (yc + zc*(Ny-1)) + 100001
        surface_1 = 2 * (yc + zc*(Ny-1)) + 10000001
        surface_2 = 2 * (yc + zc*(Ny-1)) + 20000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 50000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 50000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 60000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 60000001

        file_object.write(
            f"Surface Loop({surface_loop_number}) = "
            f"{{{surface_1}, {surface_2},"
            f" {surface_3}, {surface_4},"
            f" {surface_5}, {surface_6}}};\n")
        file_object.write(
            f"Volume({volume}) = {{{surface_loop_number}}};\n")

        volume_tag1.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 50000001 + 2*v
    surface_2 = 70000001 + 2*v
    surface_3 = 11000001 + 2*v
    surface_4 = 21000001 + 2*v
    surface_5 = 80000001 + 2*v
    surface_6 = 80000003 + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 80000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 50000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 70000001 + 2*(Ny-1) + 2*v
    surface_3 = 11000001 + 2*(Ny-1) + 2*v
    surface_4 = 21000001 + 2*(Ny-1) + 2*v
    surface_5 = 80000001 + 2*(Ny-1) + 2*v
    surface_6 = 80000003 + 2*(Ny-1) + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 80000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 = 60000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 80000001
surface_6 = 80000001 + 4 * (Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Nz-3):
    surface_loop_number += 2
    volume += 2
    surface_1 = 60000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 80000001 + 4 * (Ny-1) + 2*v
    surface_6 += 2
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 80000001 + 2*(Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Nz-1):
    surface_loop_number += 2
    volume += 2
    surface_1 = 60000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 += 2
    surface_6 = surface_5 + 2

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

# -------- #
# Volume 2 #
# -------- #

# Make line between the outer and inner skull surface
for p in range(Ny*Nz):
    line_number = p + 3500000
    point_1 = p + 300000
    point_2 = p + 100000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 3600000
    point_1 = p + 400000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 3600000
    point_1 = p + 400000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 3700000
    point_1 = p + 400000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 3700000
    point_1 = p + 400000
    point_2 = p + 200000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 90000000
        surface = 2 * (yc + zc*(Ny-1)) + 90000001
        line_1 = 3500000 + zc + yc*Nz
        line_2 = 100000 + yc + zc*(Ny-1)
        line_3 = 3500000 + zc + (yc+1)*Nz
        line_4 = 700000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 100000000
        surface = 2 * (zc + yc*(Nz-1)) + 100000001
        line_1 = 3500000 + zc + yc*Nz
        line_2 = 200000 + zc + yc*(Nz-1)
        line_3 = 3500001 + zc + yc*Nz
        line_4 = 800000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 110000000
    surface = 2 * s + 110000001
    line_1 = 3600000 + s
    line_2 = 300000 + s
    line_3 = 3600001 + s
    line_4 = 900000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3700000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 3600000 + (Ny-1)*(Nz-1) + s
    line_2 = 300000 + (Ny-1)*(Nz-1) + s
    line_3 = 3600001 + (Ny-1)*(Nz-1) + s
    line_4 = 900000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3700000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 3600000
line_2 = 400000
line_3 = 3700001
line_4 = 1000000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 3700001 + s
    line_2 = 400001 + s
    line_3 = 3700002 + s
    line_4 = 1000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3600000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 3700000 + (Ny-1)*(Nz-1) + s
    line_2 = 400000 + (Ny-1)*(Nz-1) + s
    line_3 = 3700001 + (Ny-1)*(Nz-1) + s
    line_4 = 1000000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 120000000 + 2*s
    surface = 120000001 + 2*s
    line_1 = 1100000 + s
    line_2 = 3600000 + s
    line_3 = 500000 + s
    line_4 = 3500000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1100000 + (Ny-1)*(Nz-1) + s
    line_2 = 3600000 + (Ny-1)*(Nz-1) + s
    line_3 = 500000 + (Ny-1)*(Nz-1) + s
    line_4 = 3500000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1200001 + s
    line_2 = 3700001 + s
    line_3 = 600001 + s
    line_4 = 3500001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 1200000 + (Ny-1)*(Nz-1) + s
    line_2 = 3700000 + (Ny-1)*(Nz-1) + s
    line_3 = 600000 + (Ny-1)*(Nz-1) + s
    line_4 = 3500000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# Make volume
volume_tag2 = []

for zc in range(Nz-1):
    for yc in range(Ny-1):
        surface_loop_number = 2 * (yc + zc*(Ny-1)) + 200000
        volume = 2 * (yc + zc*(Ny-1)) + 200001
        surface_1 = 2 * (yc + zc*(Ny-1)) + 20000001
        surface_2 = 2 * (yc + zc*(Ny-1)) + 30000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 90000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 90000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 100000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 100000001

        file_object.write(
            f"Surface Loop({surface_loop_number}) = "
            f"{{{surface_1}, {surface_2},"
            f" {surface_3}, {surface_4},"
            f" {surface_5}, {surface_6}}};\n")
        file_object.write(
            f"Volume({volume}) = {{{surface_loop_number}}};\n")

        volume_tag2.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 90000001 + 2*v
    surface_2 = 110000001 + 2*v
    surface_3 = 21000001 + 2*v
    surface_4 = 31000001 + 2*v
    surface_5 = 120000001 + 2*v
    surface_6 = 120000003 + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag2.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 120000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag2.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 90000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 110000001 + 2*(Ny-1) + 2*v
    surface_3 = 21000001 + 2*(Ny-1) + 2*v
    surface_4 = 31000001 + 2*(Ny-1) + 2*v
    surface_5 = 120000001 + 2*(Ny-1) + 2*v
    surface_6 = 120000003 + 2*(Ny-1) + 2*v
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag2.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 120000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag2.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 = 100000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 120000001
surface_6 = 120000001 + 4 * (Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag2.append(str(volume))

for v in range(Nz-3):
    surface_loop_number += 2
    volume += 2
    surface_1 = 100000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 120000001 + 4 * (Ny-1) + 2*v
    surface_6 += 2
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag2.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 120000001 + 2*(Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag2.append(str(volume))

for v in range(Nz-1):
    surface_loop_number += 2
    volume += 2
    surface_1 = 100000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 += 2
    surface_6 = surface_5 + 2

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag2.append(str(volume))

# -------- #
# Volume 3 #
# -------- #

# Make line between the outer and inner skull surface
for p in range(Ny*Nz):
    line_number = p + 4500000
    point_1 = p + 100000
    point_2 = p + 700000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 4600000
    point_1 = p + 200000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 4600000
    point_1 = p + 200000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 4700000
    point_1 = p + 200000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 4700000
    point_1 = p + 200000
    point_2 = p + 800000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 130000000
        surface = 2 * (yc + zc*(Ny-1)) + 130000001
        line_1 = 4500000 + zc + yc*Nz
        line_2 = 1900000 + yc + zc*(Ny-1)
        line_3 = 4500000 + zc + (yc+1)*Nz
        line_4 = 100000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 140000000
        surface = 2 * (zc + yc*(Nz-1)) + 140000001
        line_1 = 4500000 + zc + yc*Nz
        line_2 = 2000000 + zc + yc*(Nz-1)
        line_3 = 4500001 + zc + yc*Nz
        line_4 = 200000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 150000000
    surface = 2 * s + 150000001
    line_1 = 4600000 + s
    line_2 = 2100000 + s
    line_3 = 4600001 + s
    line_4 = 300000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4700000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 4600000 + (Ny-1)*(Nz-1) + s
    line_2 = 2100000 + (Ny-1)*(Nz-1) + s
    line_3 = 4600001 + (Ny-1)*(Nz-1) + s
    line_4 = 300000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4700000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 4600000
line_2 = 2200000
line_3 = 4700001
line_4 = 400000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 4700001 + s
    line_2 = 2200001 + s
    line_3 = 4700002 + s
    line_4 = 400001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4600000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 4700000 + (Ny-1)*(Nz-1) + s
    line_2 = 2200000 + (Ny-1)*(Nz-1) + s
    line_3 = 4700001 + (Ny-1)*(Nz-1) + s
    line_4 = 400000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 160000000 + 2*s
    surface = 160000001 + 2*s
    line_1 = 500000 + s
    line_2 = 4600000 + s
    line_3 = 2300000 + s
    line_4 = 4500000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 500000 + (Ny-1)*(Nz-1) + s
    line_2 = 4600000 + (Ny-1)*(Nz-1) + s
    line_3 = 2300000 + (Ny-1)*(Nz-1) + s
    line_4 = 4500000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 600001 + s
    line_2 = 4700001 + s
    line_3 = 2400001 + s
    line_4 = 4500001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 600000 + (Ny-1)*(Nz-1) + s
    line_2 = 4700000 + (Ny-1)*(Nz-1) + s
    line_3 = 2400000 + (Ny-1)*(Nz-1) + s
    line_4 = 4500000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# Make volume
for zc in range(Nz-1):
    for yc in range(Ny-1):
        surface_loop_number = 2 * (yc + zc*(Ny-1)) + 300000
        volume = 2 * (yc + zc*(Ny-1)) + 300001
        surface_1 = 2 * (yc + zc*(Ny-1)) + 30000001
        surface_2 = 2 * (yc + zc*(Ny-1)) + 40000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 130000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 130000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 140000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 140000001

        file_object.write(
            f"Surface Loop({surface_loop_number}) = "
            f"{{{surface_1}, {surface_2},"
            f" {surface_3}, {surface_4},"
            f" {surface_5}, {surface_6}}};\n")
        file_object.write(
            f"Volume({volume}) = {{{surface_loop_number}}};\n")

        volume_tag1.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 130000001 + 2*v
    surface_2 = 150000001 + 2*v
    surface_3 = 31000001 + 2*v
    surface_4 = 41000001 + 2*v
    surface_5 = 160000001 + 2*v
    surface_6 = 160000003 + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 160000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 130000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 150000001 + 2*(Ny-1) + 2*v
    surface_3 = 31000001 + 2*(Ny-1) + 2*v
    surface_4 = 41000001 + 2*(Ny-1) + 2*v
    surface_5 = 160000001 + 2*(Ny-1) + 2*v
    surface_6 = 160000003 + 2*(Ny-1) + 2*v
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 160000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 = 140000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 160000001
surface_6 = 160000001 + 4 * (Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Nz-3):
    surface_loop_number += 2
    volume += 2
    surface_1 = 140000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 160000001 + 4 * (Ny-1) + 2*v
    surface_6 += 2
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 160000001 + 2*(Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag1.append(str(volume))

for v in range(Nz-1):
    surface_loop_number += 2
    volume += 2
    surface_1 = 140000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 += 2
    surface_6 = surface_5 + 2

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag1.append(str(volume))

# -------------------- #
# Set transfinite line #
# -------------------- #
file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line1))
file_object.write("} = 1;\n\n")

number_of_element_line2 = number_of_element_per_wavelength \
    * number_of_extra_wavelength

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line2))
file_object.write("} = ")
file_object.write(f"{number_of_element_line2};\n\n")

thickness_volume_1 = skull_surface_outer[:, 0].max()
number_of_element_line3 = number_of_element_per_wavelength \
    * thickness_volume_1 / wavelength

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line3))
file_object.write("} = ")
file_object.write(f"{number_of_element_line3};\n\n")

skull_thickness = skull_surface_inner - skull_surface_outer
thickness_volume_2 = skull_thickness.max()
number_of_element_line4 = number_of_element_per_wavelength \
    * thickness_volume_2 / wavelength

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line4))
file_object.write("} = ")
file_object.write(f"{number_of_element_line4};\n\n")

thickness_volume_3 = domain_length - thickness_volume_2
number_of_element_line5 = number_of_element_per_wavelength \
    * thickness_volume_3 / wavelength

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line5))
file_object.write("} = ")
file_object.write(f"{number_of_element_line5};\n\n")

# ---------- #
# Write tags #
# ---------- #
file_object.write("Physical Surface(1) = {")
file_object.write(", ".join(source_tag))
file_object.write("};\n\n")

file_object.write("Physical Volume (1) = {")
file_object.write(", ".join(volume_tag1))
file_object.write("};\n\n")

file_object.write("Physical Volume (2) = {")
file_object.write(", ".join(volume_tag2))
file_object.write("};\n\n")

# ------------ #
# Create hexes #
# ------------ #

file_object.write("Transfinite Surface \"*\";\n")
file_object.write("Recombine Surface \"*\";\n")

file_object.write("Transfinite Volume \"*\";\n")

file_object.close()
