import numpy as np

# Parameters
speed_of_sound = 1500
source_frequency = 1.1E6

wavelength = speed_of_sound / source_frequency
number_of_extra_wavelength = 7
number_of_element_per_wavelength1 = 4
transducer_radius = 0.0165 
domain_radius = 0.02 + number_of_extra_wavelength*wavelength
domain_length = 0.08 + number_of_extra_wavelength*wavelength

# ----------------------------------- #
# Generate points at the focal region #
# ----------------------------------- #

yz_a, yz_b = -0.002, 0.002
yz_radius = yz_b - yz_a
number_of_elements = int(np.ceil(
    number_of_element_per_wavelength1 * yz_radius / wavelength))

y0 = np.linspace(yz_a, yz_b, number_of_elements)
z0 = np.linspace(yz_a, yz_b, number_of_elements)
x0 = np.full(y0.shape[0], 0.03)

X0, Y0, Z0 = np.meshgrid(x0, y0, z0, indexing="ij")
points_0 = np.hstack((X0.reshape(-1, 1),
                      Y0.reshape(-1, 1),
                      Z0.reshape(-1, 1)))

x1 = np.full(y0.shape[0], 0.045)
X1, Y1, Z1 = np.meshgrid(x1, y0, z0, indexing="ij")
points_1 = np.hstack((X1.reshape(-1, 1),
                      Y1.reshape(-1, 1),
                      Z1.reshape(-1, 1)))

npoints = points_0.shape[0]
Ny = y0.shape[0]
Nz = z0.shape[0]

# ----------------- #
# Write to geo file #
# ----------------- #

file_object = open(r"transducer_3d_W.geo", "w")

transfinite_line1 = []
transfinite_line2 = []
transfinite_line3 = []
transfinite_line4 = []
transfinite_line5 = []
transfinite_line6 = []

# ------------------ #
# Transducer surface #
# ------------------ #

# Create points
focal_length = 0.035

for p in range(npoints):
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]
    xp_i = - np.sqrt(focal_length**2 - yp_i**2 - zp_i**2) + focal_length

    file_object.write(
        f"Point({p + 10000000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 1000000
        point_1 = yl*Nz + zl + 10000000
        point_2 = yl*Nz + zl + Nz + 10000000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 1100000
        point_1 = zl + yl*Nz + 10000000
        point_2 = zl + yl*Nz + 10000001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for transducer radius
for p in range(Ny):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 20000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 20000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 20000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 20000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point 1
file_object.write(
    f"Point(1) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for transducer radius
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1200000
    point_1 = p + 20000000
    point_2 = p + 20000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1200000
    point_1 = p + 20000000
    point_2 = p + 20000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1300000
    point_1 = p + 20000000
    point_2 = p + 20000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1300000
    point_1 = p + 20000000
    point_2 = p + 20000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 1, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create center point 2
file_object.write(
    f"Point(2) = {{{focal_length}, {0.0}, {0.0}, 1.0}};\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1400000
    point_1 = p + 10000000
    point_2 = p + 20000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1400000
    point_1 = p + 10000000
    point_2 = p + 20000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1500001
    point_1 = p + 10000000
    point_2 = p + 20000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1500000
    point_1 = p + 10000000
    point_2 = p + 20000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 100000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 100000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 100000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    xp = - np.sqrt(focal_length**2 - yp**2 - zp**2) + focal_length

    file_object.write(
        f"Point({p + 100000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point 1
file_object.write(
    f"Point(3) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1600000
    point_1 = p + 100000000
    point_2 = p + 100000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 3, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1600000
    point_1 = p + 100000000
    point_2 = p + 100000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 3, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 1700000
    point_1 = p + 100000000
    point_2 = p + 100000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 3, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1700000
    point_1 = p + 100000000
    point_2 = p + 100000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 3, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 1800000
    point_1 = p + 20000000
    point_2 = p + 100000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 1800000
    point_1 = p + 20000000
    point_2 = p + 100000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 1900001
    point_1 = p + 20000000
    point_2 = p + 100000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 1900000
    point_1 = p + 20000000
    point_2 = p + 100000000
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 2, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

# Create and tag surface
source_tag = []
for zc in range(Nz-1):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 10000000
        surface = 2 * (yc + zc*(Ny-1)) + 10000001
        line_1 = 1000000 + yc + zc*(Ny-1)
        line_2 = 1100000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 1000000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 1100000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
        
        source_tag.append(str(surface))

for s in range(Nz-2):
    line_loop_number = 2 * s + 11000000
    surface = 2 * s + 11000001
    line_1 = 1400000 + s
    line_2 = 1200000 + s
    line_3 = 1400001 + s
    line_4 = 1000000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
    
    source_tag.append(str(surface))

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1500000 + (Ny-1)*(Nz-1)
line_4 += 1
file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
source_tag.append(str(surface))

file_object.write("\n\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1400000 + s + (Ny-1)*(Nz-1)
    line_2 = 1200000 + s + (Ny-1)*(Nz-1)
    line_3 = 1400001 + s + (Ny-1)*(Nz-1)
    line_4 = 1000000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
    
    source_tag.append(str(surface))

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1500000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

source_tag.append(str(surface))

line_loop_number += 2
surface += 2
line_1 = 1400000
line_2 = 1300000
line_3 = 1500001
line_4 = 1100000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
    
source_tag.append(str(surface))

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 1500001 + s
    line_2 = 1300001 + s
    line_3 = 1500002 + s
    line_4 = 1100001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

    source_tag.append(str(surface))

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1400000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

source_tag.append(str(surface))

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1500000 + s + (Ny-1)*(Nz-1)
    line_2 = 1300000 + s + (Ny-1)*(Nz-1)
    line_3 = 1500001 + s + (Ny-1)*(Nz-1)
    line_4 = 1100000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

    source_tag.append(str(surface))

for s in range(Nz-2):
    line_loop_number = 2 * s + 21000000
    surface = 2 * s + 21000001
    line_1 = 1800000 + s
    line_2 = 1600000 + s
    line_3 = 1800001 + s
    line_4 = 1200000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1900000 + (Ny-1)*(Nz-1)
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
    line_1 = 1800000 + s + (Ny-1)*(Nz-1)
    line_2 = 1600000 + s + (Ny-1)*(Nz-1)
    line_3 = 1800001 + s + (Ny-1)*(Nz-1)
    line_4 = 1200000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 1900000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 1800000
line_2 = 1700000
line_3 = 1900001
line_4 = 1300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 1900001 + s
    line_2 = 1700001 + s
    line_3 = 1900002 + s
    line_4 = 1300001 + s

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

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1900000 + s + (Ny-1)*(Nz-1)
    line_2 = 1700000 + s + (Ny-1)*(Nz-1)
    line_3 = 1900001 + s + (Ny-1)*(Nz-1)
    line_4 = 1300000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# --------- #
# Surface 1 #
# --------- #

# Create points
for p in range(npoints):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    file_object.write(
        f"Point({p + 30000000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 2000000
        point_1 = yl*Nz + zl + 30000000
        point_2 = yl*Nz + zl + Nz + 30000000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 2100000
        point_1 = zl + yl*Nz + 30000000
        point_2 = zl + yl*Nz + 30000001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for transducer radius
for p in range(Ny):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 40000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 40000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp =  xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 40000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 40000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point 1
file_object.write(
    f"Point(4) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for transducer radius
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2200000
    point_1 = p + 40000000
    point_2 = p + 40000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2200000
    point_1 = p + 40000000
    point_2 = p + 40000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2300000
    point_1 = p + 40000000
    point_2 = p + 40000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2300000
    point_1 = p + 40000000
    point_2 = p + 40000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4,{point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2400000
    point_1 = p + 30000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2400000
    point_1 = p + 30000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 2500001
    point_1 = p + 30000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2500000
    point_1 = p + 30000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_0[p, 0]
    yp_i = points_0[p, 1]
    zp_i = points_0[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 200000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2600000
    point_1 = p + 200000000
    point_2 = p + 200000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2600000
    point_1 = p + 200000000
    point_2 = p + 200000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 2700000
    point_1 = p + 200000000
    point_2 = p + 200000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2700000
    point_1 = p + 200000000
    point_2 = p + 200000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 4, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 2800000
    point_1 = p + 40000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 2800000
    point_1 = p + 40000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 2900001
    point_1 = p + 40000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 2900000
    point_1 = p + 40000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

# Create and tag surface
for zc in range(Nz-1):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 30000000
        surface = 2 * (yc + zc*(Ny-1)) + 30000001
        line_1 = 2000000 + yc + zc*(Ny-1)
        line_2 = 2100000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 2000000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 2100000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 31000000
    surface = 2 * s + 31000001
    line_1 = 2400000 + s
    line_2 = 2200000 + s
    line_3 = 2400001 + s
    line_4 = 2000000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2500000 + (Ny-1)*(Nz-1)
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
    line_1 = 2400000 + s + (Ny-1)*(Nz-1)
    line_2 = 2200000 + s + (Ny-1)*(Nz-1)
    line_3 = 2400001 + s + (Ny-1)*(Nz-1)
    line_4 = 2000000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2500000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 2400000
line_2 = 2300000
line_3 = 2500001
line_4 = 2100000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 2500001 + s
    line_2 = 2300001 + s
    line_3 = 2500002 + s
    line_4 = 2100001 + s

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

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2500000 + s + (Ny-1)*(Nz-1)
    line_2 = 2300000 + s + (Ny-1)*(Nz-1)
    line_3 = 2500001 + s + (Ny-1)*(Nz-1)
    line_4 = 2100000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 41000000
    surface = 2 * s + 41000001
    line_1 = 2800000 + s
    line_2 = 2600000 + s
    line_3 = 2800001 + s
    line_4 = 2200000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2900000 + (Ny-1)*(Nz-1)
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
    line_1 = 2800000 + s + (Ny-1)*(Nz-1)
    line_2 = 2600000 + s + (Ny-1)*(Nz-1)
    line_3 = 2800001 + s + (Ny-1)*(Nz-1)
    line_4 = 2200000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2900000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 2800000
line_2 = 2700000
line_3 = 2900001
line_4 = 2300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 2900001 + s
    line_2 = 2700001 + s
    line_3 = 2900002 + s
    line_4 = 2300001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 2800000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2900000 + s + (Ny-1)*(Nz-1)
    line_2 = 2700000 + s + (Ny-1)*(Nz-1)
    line_3 = 2900001 + s + (Ny-1)*(Nz-1)
    line_4 = 2300000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# --------- #
# Surface 2 #
# --------- #

# Create points
for p in range(npoints):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    file_object.write(
        f"Point({p + 50000000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 3000000
        point_1 = yl*Nz + zl + 50000000
        point_2 = yl*Nz + zl + Nz + 50000000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 3100000
        point_1 = zl + yl*Nz + 50000000
        point_2 = zl + yl*Nz + 50000001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for transducer radius
for p in range(Ny):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 60000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 60000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp =  xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 60000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 60000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point
file_object.write(
    f"Point(5) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for transducer radius
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 3200000
    point_1 = p + 60000000
    point_2 = p + 60000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 3200000
    point_1 = p + 60000000
    point_2 = p + 60000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 3300000
    point_1 = p + 60000000
    point_2 = p + 60000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 3300000
    point_1 = p + 60000000
    point_2 = p + 60000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5,{point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 3400000
    point_1 = p + 50000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 3400000
    point_1 = p + 50000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 3500001
    point_1 = p + 50000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 3500000
    point_1 = p + 50000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)
    file_object.write(
        f"Point({p + 300000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 300000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 300000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = points_1[p, 0]
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 300000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 3600000
    point_1 = p + 300000000
    point_2 = p + 300000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 3600000
    point_1 = p + 300000000
    point_2 = p + 300000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 3700000
    point_1 = p + 300000000
    point_2 = p + 300000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 3700000
    point_1 = p + 300000000
    point_2 = p + 300000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 5, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 3800000
    point_1 = p + 60000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 3800000
    point_1 = p + 60000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 3900001
    point_1 = p + 60000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 3900000
    point_1 = p + 60000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

# Create and tag surface
for zc in range(Nz-1):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 50000000
        surface = 2 * (yc + zc*(Ny-1)) + 50000001
        line_1 = 3000000 + yc + zc*(Ny-1)
        line_2 = 3100000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 3000000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 3100000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 51000000
    surface = 2 * s + 51000001
    line_1 = 3400000 + s
    line_2 = 3200000 + s
    line_3 = 3400001 + s
    line_4 = 3000000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3500000 + (Ny-1)*(Nz-1)
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
    line_1 = 3400000 + s + (Ny-1)*(Nz-1)
    line_2 = 3200000 + s + (Ny-1)*(Nz-1)
    line_3 = 3400001 + s + (Ny-1)*(Nz-1)
    line_4 = 3000000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3500000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 3400000
line_2 = 3300000
line_3 = 3500001
line_4 = 3100000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 3500001 + s
    line_2 = 3300001 + s
    line_3 = 3500002 + s
    line_4 = 3100001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3400000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 3500000 + s + (Ny-1)*(Nz-1)
    line_2 = 3300000 + s + (Ny-1)*(Nz-1)
    line_3 = 3500001 + s + (Ny-1)*(Nz-1)
    line_4 = 3100000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 61000000
    surface = 2 * s + 61000001
    line_1 = 3800000 + s
    line_2 = 3600000 + s
    line_3 = 3800001 + s
    line_4 = 3200000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3900000 + (Ny-1)*(Nz-1)
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
    line_1 = 3800000 + s + (Ny-1)*(Nz-1)
    line_2 = 3600000 + s + (Ny-1)*(Nz-1)
    line_3 = 3800001 + s + (Ny-1)*(Nz-1)
    line_4 = 3200000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3900000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 3800000
line_2 = 3700000
line_3 = 3900001
line_4 = 3300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 3900001 + s
    line_2 = 3700001 + s
    line_3 = 3900002 + s
    line_4 = 3300001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 3800000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 3900000 + s + (Ny-1)*(Nz-1)
    line_2 = 3700000 + s + (Ny-1)*(Nz-1)
    line_3 = 3900001 + s + (Ny-1)*(Nz-1)
    line_4 = 3300000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# --------- #
# Surface 3 #
# --------- #

# Create points
for p in range(npoints):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    file_object.write(
        f"Point({p + 70000000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")


# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 4000000
        point_1 = yl*Nz + zl + 70000000
        point_2 = yl*Nz + zl + Nz + 70000000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")


# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 4100000
        point_1 = zl + yl*Nz + 70000000
        point_2 = zl + yl*Nz + 70000001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create points for transducer radius
for p in range(Ny):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 80000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 80000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp =  xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 80000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = transducer_radius * np.cos(angle)
    zp = transducer_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 80000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create center point
file_object.write(
    f"Point(6) = {{{xp}, {0.0}, {0.0}, 1.0}};\n")

# Create lines for transducer radius
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 4200000
    point_1 = p + 80000000
    point_2 = p + 80000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 4200000
    point_1 = p + 80000000
    point_2 = p + 80000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 4300000
    point_1 = p + 80000000
    point_2 = p + 80000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 4300000
    point_1 = p + 80000000
    point_2 = p + 80000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6,{point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 4400000
    point_1 = p + 70000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 4400000
    point_1 = p + 70000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 4500001
    point_1 = p + 70000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 4500000
    point_1 = p + 70000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line2.append(str(line_number))

file_object.write("\n\n")

# Create points for extra layer (4 extra layer)
for p in range(Ny):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Ny*Nz - Ny, Ny*Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(Nz, Ny*(Nz-2)+1, Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

for p in range(2*Nz-1, Ny*(Nz-1), Nz):
    xp_i = domain_length
    yp_i = points_1[p, 1]
    zp_i = points_1[p, 2]

    angle = np.arctan2(zp_i, yp_i)
    xp = xp_i
    yp = domain_radius * np.cos(angle)
    zp = domain_radius * np.sin(angle)

    file_object.write(
        f"Point({p + 400000000}) = {{{xp}, {yp}, {zp}, 1.0}};\n")

file_object.write("\n\n")

# Create lines for extra layers (4 layers)
for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 4600000
    point_1 = p + 400000000
    point_2 = p + 400000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 4600000
    point_1 = p + 400000000
    point_2 = p + 400000000 + Nz
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 4700000
    point_1 = p + 400000000
    point_2 = p + 400000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny-1)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 4700000
    point_1 = p + 400000000
    point_2 = p + 400000001
    file_object.write(
        f"Circle({line_number}) = {{{point_1}, 6, {point_2}}};\n")

    transfinite_line1.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 4800000
    point_1 = p + 80000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 4800000
    point_1 = p + 80000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(1, Nz-1)):
    line_number = i + 4900001
    point_1 = p + 80000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 4900000
    point_1 = p + 80000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line3.append(str(line_number))

file_object.write("\n\n")

# Create and tag surface
for zc in range(Nz-1):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 70000000
        surface = 2 * (yc + zc*(Ny-1)) + 70000001
        line_1 = 4000000 + yc + zc*(Ny-1)
        line_2 = 4100000 + zc + yc*(Nz-1) + (Nz-1)
        line_3 = 4000000 + yc + zc*(Ny-1) + Ny - 1
        line_4 = 4100000 + zc + yc*(Nz-1)

        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 71000000
    surface = 2 * s + 71000001
    line_1 = 4400000 + s
    line_2 = 4200000 + s
    line_3 = 4400001 + s
    line_4 = 4000000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4500000 + (Ny-1)*(Nz-1)
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
    line_1 = 4400000 + s + (Ny-1)*(Nz-1)
    line_2 = 4200000 + s + (Ny-1)*(Nz-1)
    line_3 = 4400001 + s + (Ny-1)*(Nz-1)
    line_4 = 4000000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4500000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 4400000
line_2 = 4300000
line_3 = 4500001
line_4 = 4100000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 4500001 + s
    line_2 = 4300001 + s
    line_3 = 4500002 + s
    line_4 = 4100001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4400000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 4500000 + s + (Ny-1)*(Nz-1)
    line_2 = 4300000 + s + (Ny-1)*(Nz-1)
    line_3 = 4500001 + s + (Ny-1)*(Nz-1)
    line_4 = 4100000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number = 2 * s + 81000000
    surface = 2 * s + 81000001
    line_1 = 4800000 + s
    line_2 = 4600000 + s
    line_3 = 4800001 + s
    line_4 = 4200000 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4900000 + (Ny-1)*(Nz-1)
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
    line_1 = 4800000 + s + (Ny-1)*(Nz-1)
    line_2 = 4600000 + s + (Ny-1)*(Nz-1)
    line_3 = 4800001 + s + (Ny-1)*(Nz-1)
    line_4 = 4200000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4900000 + (Ny-1)*Nz
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 4800000
line_2 = 4700000
line_3 = 4900001
line_4 = 4300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 4900001 + s
    line_2 = 4700001 + s
    line_3 = 4900002 + s
    line_4 = 4300001 + s

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 4800000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 4900000 + s + (Ny-1)*(Nz-1)
    line_2 = 4700000 + s + (Ny-1)*(Nz-1)
    line_3 = 4900001 + s + (Ny-1)*(Nz-1)
    line_4 = 4300000 + s + (Ny-1)*(Nz-1)

    file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# -------- #
# Volume 1 #
# -------- #

# Make lines
for p in range(Ny*Nz):
    line_number = p + 10000000
    point_1 = p + 10000000
    point_2 = p + 30000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 11000000
    point_1 = p + 20000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 11000000
    point_1 = p + 20000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 12000000
    point_1 = p + 20000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 12000000
    point_1 = p + 20000000
    point_2 = p + 40000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 13000000
    point_1 = p + 100000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 13000000
    point_1 = p + 100000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 14000000
    point_1 = p + 100000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 14000000
    point_1 = p + 100000000
    point_2 = p + 200000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line4.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 100000000
        surface = 2 * (yc + zc*(Ny-1)) + 100000001
        line_1 = 10000000 + zc + yc*Nz
        line_2 = 2000000 + yc + zc*(Ny-1)
        line_3 = 10000000 + zc + (yc+1)*Nz
        line_4 = 1000000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 200000000
        surface = 2 * (zc + yc*(Nz-1)) + 200000001
        line_1 = 10000000 + zc + yc*Nz
        line_2 = 2100000 + zc + yc*(Nz-1)
        line_3 = 10000001 + zc + yc*Nz
        line_4 = 1100000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 300000000
    surface = 2 * s + 300000001
    line_1 = 11000000 + s
    line_2 = 2200000 + s
    line_3 = 11000001 + s
    line_4 = 1200000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 12000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 11000000 + (Ny-1)*(Nz-1) + s
    line_2 = 2200000 + (Ny-1)*(Nz-1) + s
    line_3 = 11000001 + (Ny-1)*(Nz-1) + s
    line_4 = 1200000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 12000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 11000000
line_2 = 2300000
line_3 = 12000001
line_4 = 1300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 12000001 + s
    line_2 = 2300001 + s
    line_3 = 12000002 + s
    line_4 = 1300001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 11000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 12000000 + (Ny-1)*(Nz-1) + s
    line_2 = 2300000 + (Ny-1)*(Nz-1) + s
    line_3 = 12000001 + (Ny-1)*(Nz-1) + s
    line_4 = 1300000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 400000000 + 2*s
    surface = 400000001 + 2*s
    line_1 = 1400000 + s
    line_2 = 11000000 + s
    line_3 = 2400000 + s
    line_4 = 10000000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1400000 + (Ny-1)*(Nz-1) + s
    line_2 = 11000000 + (Ny-1)*(Nz-1) + s
    line_3 = 2400000 + (Ny-1)*(Nz-1) + s
    line_4 = 10000000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1500001 + s
    line_2 = 12000001 + s
    line_3 = 2500001 + s
    line_4 = 10000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 1500000 + (Ny-1)*(Nz-1) + s
    line_2 = 12000000 + (Ny-1)*(Nz-1) + s
    line_3 = 2500000 + (Ny-1)*(Nz-1) + s
    line_4 = 10000000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 500000000
    surface = 2 * s + 500000001
    line_1 = 13000000 + s
    line_2 = 2600000 + s
    line_3 = 13000001 + s
    line_4 = 1600000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 14000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 13000000 + (Ny-1)*(Nz-1) + s
    line_2 = 2600000 + (Ny-1)*(Nz-1) + s
    line_3 = 13000001 + (Ny-1)*(Nz-1) + s
    line_4 = 1600000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 14000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 13000000
line_2 = 2700000
line_3 = 14000001
line_4 = 1700000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 14000001 + s
    line_2 = 2700001 + s
    line_3 = 14000002 + s
    line_4 = 1700001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 13000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 14000000 + (Ny-1)*(Nz-1) + s
    line_2 = 2700000 + (Ny-1)*(Nz-1) + s
    line_3 = 14000001 + (Ny-1)*(Nz-1) + s
    line_4 = 1700000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")
    
for s in range(Ny-1):
    line_loop_number = 600000000 + 2*s
    surface = 600000001 + 2*s
    line_1 = 1800000 + s
    line_2 = 13000000 + s
    line_3 = 2800000 + s
    line_4 = 11000000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 1800000 + (Ny-1)*(Nz-1) + s
    line_2 = 13000000 + (Ny-1)*(Nz-1) + s
    line_3 = 2800000 + (Ny-1)*(Nz-1) + s
    line_4 = 11000000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 1900001 + s
    line_2 = 14000001 + s
    line_3 = 2900001 + s
    line_4 = 12000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 1900000 + (Ny-1)*(Nz-1) + s
    line_2 = 14000000 + (Ny-1)*(Nz-1) + s
    line_3 = 2900000 + (Ny-1)*(Nz-1) + s
    line_4 = 12000000 + (Ny-1)*(Nz-1) + s
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
        surface_2 = 2 * (yc + zc*(Ny-1)) + 30000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 100000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 100000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 200000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 200000001

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
    surface_1 = 100000001 + 2*v
    surface_2 = 300000001 + 2*v
    surface_3 = 11000001 + 2*v
    surface_4 = 31000001 + 2*v
    surface_5 = 400000001 + 2*v
    surface_6 = 400000003 + 2*v

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
surface_6 = 400000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

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
    surface_1 = 100000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 300000001 + 2*(Ny-1) + 2*v
    surface_3 = 11000001 + 2*(Ny-1) + 2*v
    surface_4 = 31000001 + 2*(Ny-1) + 2*v
    surface_5 = 400000001 + 2*(Ny-1) + 2*v
    surface_6 = 400000003 + 2*(Ny-1) + 2*v

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
surface_6 = 400000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

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
surface_1 = 200000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 400000001
surface_6 = 400000001 + 4 * (Ny-1)

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
    surface_1 = 200000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 400000001 + 4 * (Ny-1) + 2*v
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
surface_6 = 400000001 + 2*(Ny-1)

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
    surface_1 = 200000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
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

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 300000001 + 2*v
    surface_2 = 500000001 + 2*v
    surface_3 = 21000001 + 2*v
    surface_4 = 41000001 + 2*v
    surface_5 = 600000001 + 2*v
    surface_6 = 600000003 + 2*v

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
surface_6 = 600000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

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
    surface_1 = 300000001 + 2*(Ny-1) + 2*v
    surface_2 = 500000001 + 2*(Ny-1) + 2*v
    surface_3 = 21000001 + 2*(Ny-1) + 2*v
    surface_4 = 41000001 + 2*(Ny-1) + 2*v
    surface_5 = 600000001 + 2*(Ny-1) + 2*v
    surface_6 = 600000003 + 2*(Ny-1) + 2*v

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
surface_6 = 600000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

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
surface_5 = 600000001
surface_6 = 600000001 + 4 * (Ny-1)

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
    surface_1 += 2
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 600000001 + 4 * (Ny-1) + 2*v
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
surface_6 = 600000001 + 2*(Ny-1)

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
    surface_1 += 2
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

# Make lines
for p in range(Ny*Nz):
    line_number = p + 20000000
    point_1 = p + 30000000
    point_2 = p + 50000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 21000000
    point_1 = p + 40000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 21000000
    point_1 = p + 40000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 22000000
    point_1 = p + 40000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 22000000
    point_1 = p + 40000000
    point_2 = p + 60000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 23000000
    point_1 = p + 200000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 23000000
    point_1 = p + 200000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 24000000
    point_1 = p + 200000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 24000000
    point_1 = p + 200000000
    point_2 = p + 300000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line5.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 110000000
        surface = 2 * (yc + zc*(Ny-1)) + 110000001
        line_1 = 20000000 + zc + yc*Nz
        line_2 = 3000000 + yc + zc*(Ny-1)
        line_3 = 20000000 + zc + (yc+1)*Nz
        line_4 = 2000000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 210000000
        surface = 2 * (zc + yc*(Nz-1)) + 210000001
        line_1 = 20000000 + zc + yc*Nz
        line_2 = 3100000 + zc + yc*(Nz-1)
        line_3 = 20000001 + zc + yc*Nz
        line_4 = 2100000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 310000000
    surface = 2 * s + 310000001
    line_1 = 21000000 + s
    line_2 = 3200000 + s
    line_3 = 21000001 + s
    line_4 = 2200000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 22000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 21000000 + (Ny-1)*(Nz-1) + s
    line_2 = 3200000 + (Ny-1)*(Nz-1) + s
    line_3 = 21000001 + (Ny-1)*(Nz-1) + s
    line_4 = 2200000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 22000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 21000000
line_2 = 3300000
line_3 = 22000001
line_4 = 2300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 22000001 + s
    line_2 = 3300001 + s
    line_3 = 22000002 + s
    line_4 = 2300001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 21000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 22000000 + (Ny-1)*(Nz-1) + s
    line_2 = 3300000 + (Ny-1)*(Nz-1) + s
    line_3 = 22000001 + (Ny-1)*(Nz-1) + s
    line_4 = 2300000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 410000000 + 2*s
    surface = 410000001 + 2*s
    line_1 = 2400000 + s
    line_2 = 21000000 + s
    line_3 = 3400000 + s
    line_4 = 20000000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2400000 + (Ny-1)*(Nz-1) + s
    line_2 = 21000000 + (Ny-1)*(Nz-1) + s
    line_3 = 3400000 + (Ny-1)*(Nz-1) + s
    line_4 = 20000000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 2500001 + s
    line_2 = 22000001 + s
    line_3 = 3500001 + s
    line_4 = 20000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 2500000 + (Ny-1)*(Nz-1) + s
    line_2 = 22000000 + (Ny-1)*(Nz-1) + s
    line_3 = 3500000 + (Ny-1)*(Nz-1) + s
    line_4 = 20000000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 510000000
    surface = 2 * s + 510000001
    line_1 = 23000000 + s
    line_2 = 3600000 + s
    line_3 = 23000001 + s
    line_4 = 2600000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 24000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 23000000 + (Ny-1)*(Nz-1) + s
    line_2 = 3600000 + (Ny-1)*(Nz-1) + s
    line_3 = 23000001 + (Ny-1)*(Nz-1) + s
    line_4 = 2600000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 24000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 23000000
line_2 = 3700000
line_3 = 24000001
line_4 = 2700000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 24000001 + s
    line_2 = 3700001 + s
    line_3 = 24000002 + s
    line_4 = 2700001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 23000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 24000000 + (Ny-1)*(Nz-1) + s
    line_2 = 3700000 + (Ny-1)*(Nz-1) + s
    line_3 = 24000001 + (Ny-1)*(Nz-1) + s
    line_4 = 2700000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 610000000 + 2*s
    surface = 610000001 + 2*s
    line_1 = 2800000 + s
    line_2 = 23000000 + s
    line_3 = 3800000 + s
    line_4 = 21000000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 2800000 + (Ny-1)*(Nz-1) + s
    line_2 = 23000000 + (Ny-1)*(Nz-1) + s
    line_3 = 3800000 + (Ny-1)*(Nz-1) + s
    line_4 = 21000000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 2900001 + s
    line_2 = 24000001 + s
    line_3 = 3900001 + s
    line_4 = 22000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 2900000 + (Ny-1)*(Nz-1) + s
    line_2 = 24000000 + (Ny-1)*(Nz-1) + s
    line_3 = 3900000 + (Ny-1)*(Nz-1) + s
    line_4 = 22000000 + (Ny-1)*(Nz-1) + s
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
        surface_1 = 2 * (yc + zc*(Ny-1)) + 30000001
        surface_2 = 2 * (yc + zc*(Ny-1)) + 50000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 110000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 110000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 210000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 210000001

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
    surface_1 = 110000001 + 2*v
    surface_2 = 310000001 + 2*v
    surface_3 = 31000001 + 2*v
    surface_4 = 51000001 + 2*v
    surface_5 = 410000001 + 2*v
    surface_6 = 410000003 + 2*v

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
surface_6 = 410000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

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
    surface_1 = 110000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 310000001 + 2*(Ny-1) + 2*v
    surface_3 = 31000001 + 2*(Ny-1) + 2*v
    surface_4 = 51000001 + 2*(Ny-1) + 2*v
    surface_5 = 410000001 + 2*(Ny-1) + 2*v
    surface_6 = 410000003 + 2*(Ny-1) + 2*v

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
surface_6 = 410000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

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
surface_1 = 210000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 410000001
surface_6 = 410000001 + 4 * (Ny-1)

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
    surface_1 = 210000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 410000001 + 4 * (Ny-1) + 2*v
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
surface_6 = 410000001 + 2*(Ny-1)

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
    surface_1 = 210000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
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

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 310000001 + 2*v
    surface_2 = 510000001 + 2*v
    surface_3 = 41000001 + 2*v
    surface_4 = 61000001 + 2*v
    surface_5 = 610000001 + 2*v
    surface_6 = 610000003 + 2*v

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
surface_6 = 610000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

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
    surface_1 = 310000001 + 2*(Ny-1) + 2*v
    surface_2 = 510000001 + 2*(Ny-1) + 2*v
    surface_3 = 41000001 + 2*(Ny-1) + 2*v
    surface_4 = 61000001 + 2*(Ny-1) + 2*v
    surface_5 = 610000001 + 2*(Ny-1) + 2*v
    surface_6 = 610000003 + 2*(Ny-1) + 2*v

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
surface_6 = 610000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

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
surface_5 = 610000001
surface_6 = 610000001 + 4 * (Ny-1)

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
    surface_1 += 2
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 610000001 + 4 * (Ny-1) + 2*v
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
surface_6 = 610000001 + 2*(Ny-1)

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
    surface_1 += 2
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

# Make lines
for p in range(Ny*Nz):
    line_number = p + 30000000
    point_1 = p + 50000000
    point_2 = p + 70000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 31000000
    point_1 = p + 60000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")


for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 31000000
    point_1 = p + 60000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 32000000
    point_1 = p + 60000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 32000000
    point_1 = p + 60000000
    point_2 = p + 80000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(0, Nz*(Ny-1), Nz)):
    line_number = i + 33000000
    point_1 = p + 300000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Ny-1, Ny-1 + Nz*(Ny-1), Nz)):
    line_number = i + (Ny-1)*Nz-Ny+1 + 33000000
    point_1 = p + 300000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz-1)):
    line_number = i + 34000000
    point_1 = p + 300000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

file_object.write("\n\n")

for i, p in enumerate(range(Nz*Ny-Nz, Nz*Ny)):
    line_number = i + (Nz-1)*Ny - Nz + 1 + 34000000
    point_1 = p + 300000000
    point_2 = p + 400000000
    file_object.write(
        f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

    transfinite_line6.append(str(line_number))

# Make surfaces
for zc in range(Nz):
    for yc in range(Ny-1):
        line_loop_number = 2 * (yc + zc*(Ny-1)) + 120000000
        surface = 2 * (yc + zc*(Ny-1)) + 120000001
        line_1 = 30000000 + zc + yc*Nz
        line_2 = 4000000 + yc + zc*(Ny-1)
        line_3 = 30000000 + zc + (yc+1)*Nz
        line_4 = 3000000 + yc + zc*(Ny-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")


for yc in range(Ny):
    for zc in range(Nz-1):
        line_loop_number = 2 * (zc + yc*(Nz-1)) + 220000000
        surface = 2 * (zc + yc*(Nz-1)) + 220000001
        line_1 = 30000000 + zc + yc*Nz
        line_2 = 4100000 + zc + yc*(Nz-1)
        line_3 = 30000001 + zc + yc*Nz
        line_4 = 3100000 + zc + yc*(Nz-1)
        file_object.write(
            f"Line Loop({line_loop_number}) = "
            f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
        file_object.write(
            f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

file_object.write("\n\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 320000000
    surface = 2 * s + 320000001
    line_1 = 31000000 + s
    line_2 = 4200000 + s
    line_3 = 31000001 + s
    line_4 = 3200000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 32000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 31000000 + (Ny-1)*(Nz-1) + s
    line_2 = 4200000 + (Ny-1)*(Nz-1) + s
    line_3 = 31000001 + (Ny-1)*(Nz-1) + s
    line_4 = 3200000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 32000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 31000000
line_2 = 4300000
line_3 = 32000001
line_4 = 3300000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 32000001 + s
    line_2 = 4300001 + s
    line_3 = 32000002 + s
    line_4 = 3300001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 31000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 32000000 + (Ny-1)*(Nz-1) + s
    line_2 = 4300000 + (Ny-1)*(Nz-1) + s
    line_3 = 32000001 + (Ny-1)*(Nz-1) + s
    line_4 = 3300000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 420000000 + 2*s
    surface = 420000001 + 2*s
    line_1 = 3400000 + s
    line_2 = 31000000 + s
    line_3 = 4400000 + s
    line_4 = 30000000 + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 3400000 + (Ny-1)*(Nz-1) + s
    line_2 = 31000000 + (Ny-1)*(Nz-1) + s
    line_3 = 4400000 + (Ny-1)*(Nz-1) + s
    line_4 = 30000000 + (Nz-1) + s*Nz
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 3500001 + s
    line_2 = 32000001 + s
    line_3 = 4500001 + s
    line_4 = 30000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 3500000 + (Ny-1)*(Nz-1) + s
    line_2 = 32000000 + (Ny-1)*(Nz-1) + s
    line_3 = 4500000 + (Ny-1)*(Nz-1) + s
    line_4 = 30000000 + Nz*(Ny-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number = 2 * s + 520000000
    surface = 2 * s + 520000001
    line_1 = 33000000 + s
    line_2 = 4600000 + s
    line_3 = 33000001 + s
    line_4 = 3600000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 34000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-2):
    line_loop_number += 2
    surface += 2
    line_1 = 33000000 + (Ny-1)*(Nz-1) + s
    line_2 = 4600000 + (Ny-1)*(Nz-1) + s
    line_3 = 33000001 + (Ny-1)*(Nz-1) + s
    line_4 = 3600000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 34000000 + (Ny-1)*(Nz-1) + (Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 = 33000000
line_2 = 4700000
line_3 = 34000001
line_4 = 3700000

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-3):
    line_loop_number += 2
    surface += 2
    line_1 = 34000001 + s
    line_2 = 4700001 + s
    line_3 = 34000002 + s
    line_4 = 3700001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

line_loop_number += 2
surface += 2
line_1 += 1
line_2 += 1
line_3 = 33000000 + (Ny-1)*(Nz-1)
line_4 += 1

file_object.write(
    f"Line Loop({line_loop_number}) = "
    f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
file_object.write(
    f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-1):
    line_loop_number += 2
    surface += 2
    line_1 = 34000000 + (Ny-1)*(Nz-1) + s
    line_2 = 4700000 + (Ny-1)*(Nz-1) + s
    line_3 = 34000001 + (Ny-1)*(Nz-1) + s
    line_4 = 3700000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number = 620000000 + 2*s
    surface = 620000001 + 2*s
    line_1 = 3800000 + s
    line_2 = 33000000 + s
    line_3 = 4800000 + s
    line_4 = 31000000 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Ny-1):
    line_loop_number += 2
    surface += 2
    line_1 = 3800000 + (Ny-1)*(Nz-1) + s
    line_2 = 33000000 + (Ny-1)*(Nz-1) + s
    line_3 = 4800000 + (Ny-1)*(Nz-1) + s
    line_4 = 31000000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz-2):
    line_loop_number += 2
    surface += 2
    line_1 = 3900001 + s
    line_2 = 34000001 + s
    line_3 = 4900001 + s
    line_4 = 32000001 + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

for s in range(Nz):
    line_loop_number += 2
    surface += 2
    line_1 = 3900000 + (Ny-1)*(Nz-1) + s
    line_2 = 34000000 + (Ny-1)*(Nz-1) + s
    line_3 = 4900000 + (Ny-1)*(Nz-1) + s
    line_4 = 32000000 + (Ny-1)*(Nz-1) + s
    file_object.write(
        f"Line Loop({line_loop_number}) = "
        f"{{{line_1}, {line_2}, {-line_3}, {-line_4}}};\n")
    file_object.write(
        f"Ruled Surface({surface}) = {{{line_loop_number}}};\n")

# Make volume
volume_tag3 = []

for zc in range(Nz-1):
    for yc in range(Ny-1):
        surface_loop_number = 2 * (yc + zc*(Ny-1)) + 300000
        volume = 2 * (yc + zc*(Ny-1)) + 300001
        surface_1 = 2 * (yc + zc*(Ny-1)) + 50000001
        surface_2 = 2 * (yc + zc*(Ny-1)) + 70000001
        surface_3 = 2 * (yc + zc*(Ny-1)) + 120000001
        surface_4 = 2 * (yc + zc*(Ny-1) + Ny - 1) + 120000001
        surface_5 = 2 * (zc + yc*(Nz-1)) + 220000001
        surface_6 = 2 * (zc + yc*(Nz-1) + Nz - 1) + 220000001

        file_object.write(
            f"Surface Loop({surface_loop_number}) = "
            f"{{{surface_1}, {surface_2},"
            f" {surface_3}, {surface_4},"
            f" {surface_5}, {surface_6}}};\n")
        file_object.write(
            f"Volume({volume}) = {{{surface_loop_number}}};\n")

        volume_tag3.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 120000001 + 2*v
    surface_2 = 320000001 + 2*v
    surface_3 = 51000001 + 2*v
    surface_4 = 71000001 + 2*v
    surface_5 = 420000001 + 2*v
    surface_6 = 420000003 + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 420000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 120000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
    surface_2 = 320000001 + 2*(Ny-1) + 2*v
    surface_3 = 51000001 + 2*(Ny-1) + 2*v
    surface_4 = 71000001 + 2*(Ny-1) + 2*v
    surface_5 = 420000001 + 2*(Ny-1) + 2*v
    surface_6 = 420000003 + 2*(Ny-1) + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 420000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 = 220000001
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 420000001
surface_6 = 420000001 + 4 * (Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Nz-3):
    surface_loop_number += 2
    volume += 2
    surface_1 = 220000003 + 2*v
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 420000001 + 4 * (Ny-1) + 2*v
    surface_6 += 2
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 420000001 + 2*(Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Nz-1):
    surface_loop_number += 2
    volume += 2
    surface_1 = 220000001 + 2*Nz*(Ny-1) - 2*(Ny-1) + 2*v
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

    volume_tag3.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 320000001 + 2*v
    surface_2 = 520000001 + 2*v
    surface_3 = 61000001 + 2*v
    surface_4 = 81000001 + 2*v
    surface_5 = 620000001 + 2*v
    surface_6 = 620000003 + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 620000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Ny-2):
    surface_loop_number += 2
    volume += 2
    surface_1 = 320000001 + 2*(Ny-1) + 2*v
    surface_2 = 520000001 + 2*(Ny-1) + 2*v
    surface_3 = 61000001 + 2*(Ny-1) + 2*v
    surface_4 = 81000001 + 2*(Ny-1) + 2*v
    surface_5 = 620000001 + 2*(Ny-1) + 2*v
    surface_6 = 620000003 + 2*(Ny-1) + 2*v

    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 620000001 + 2*(Ny-1) + 2*(Ny-1) + 2*(Nz-2) + 2*(Nz-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 = 620000001
surface_6 = 620000001 + 4 * (Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Nz-3):
    surface_loop_number += 2
    volume += 2
    surface_1 += 2
    surface_2 += 2
    surface_3 += 2
    surface_4 += 2
    surface_5 = 620000001 + 4 * (Ny-1) + 2*v
    surface_6 += 2
    file_object.write(
        f"Surface Loop({surface_loop_number}) = "
        f"{{{surface_1}, {surface_2},"
        f" {surface_3}, {surface_4},"
        f" {surface_5}, {surface_6}}};\n")
    file_object.write(
        f"Volume({volume}) = {{{surface_loop_number}}};\n")

    volume_tag3.append(str(volume))

surface_loop_number += 2
volume += 2
surface_1 += 2
surface_2 += 2
surface_3 += 2
surface_4 += 2
surface_5 += 2
surface_6 = 620000001 + 2*(Ny-1)

file_object.write(
    f"Surface Loop({surface_loop_number}) = "
    f"{{{surface_1}, {surface_2},"
    f" {surface_3}, {surface_4},"
    f" {surface_5}, {surface_6}}};\n")
file_object.write(
    f"Volume({volume}) = {{{surface_loop_number}}};\n")

volume_tag3.append(str(volume))

for v in range(Nz-1):
    surface_loop_number += 2
    volume += 2
    surface_1 += 2
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

    volume_tag3.append(str(volume))

# -------------------- #
# Set transfinite line #
# -------------------- #

number_of_element_per_wavelength2 = 3

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line1))
file_object.write("} = 1;\n\n")

number_of_element_line2 = int((transducer_radius - yz_b) / wavelength \
    * number_of_element_per_wavelength2) + 1

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line2))
file_object.write("} = ")
file_object.write(f"{number_of_element_line2};\n\n")

number_of_element_line3 = int(
    (domain_radius - transducer_radius) / wavelength 
    * number_of_element_per_wavelength2) + 1

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line3))
file_object.write("} = ")
file_object.write(f"{number_of_element_line3};\n\n")

number_of_element_line4 = int(0.03 / wavelength 
    * number_of_element_per_wavelength2) + 1

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line4))
file_object.write("} = ")
file_object.write(f"{number_of_element_line4};\n\n")

number_of_element_line5 = int(0.015 / wavelength 
    * number_of_element_per_wavelength1) + 1

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line5))
file_object.write("} = ")
file_object.write(f"{number_of_element_line5};\n\n")

number_of_element_line6 = int(
    (domain_length - 0.03) / wavelength 
    * number_of_element_per_wavelength2) + 1

file_object.write("Transfinite Line {")
file_object.write(", ".join(transfinite_line6))
file_object.write("} = ")
file_object.write(f"{number_of_element_line6};\n\n")

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

file_object.write("Physical Volume (3) = {")
file_object.write(", ".join(volume_tag3))
file_object.write("};\n\n")

# ------------ #
# Create hexes #
# ------------ #

file_object.write("Transfinite Surface \"*\";\n")
file_object.write("Recombine Surface \"*\";\n")

file_object.write("Transfinite Volume \"*\";\n")

file_object.close()