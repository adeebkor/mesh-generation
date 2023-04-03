import numpy as np

# Parameters
speed_of_sound = 1500
source_frequency = 1.1E6

wavelength = speed_of_sound / source_frequency
number_of_extra_wavelength = 7
number_of_element_per_wavelength = 16
domain_radius = 0.02 + number_of_extra_wavelength*wavelength
domain_length = 0.08 + number_of_extra_wavelength*wavelength

# ----------------------------------- #
# Generate points at the focal region #
# ----------------------------------- #

yz_a, yz_b = -0.001, 0.001
yz_radius = yz_b - yz_a
number_of_elements = int(np.ceil(
    number_of_element_per_wavelength * yz_radius / wavelength))

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
        f"Point({p + 100000}) = {{{xp_i}, {yp_i}, {zp_i}, 1.0}};\n")

file_object.write("\n\n")

# Create lines along the y-axis
for zl in range(Nz):
    for yl in range(Ny-1):
        line_number = yl + zl*(Ny-1) + 1000000
        point_1 = yl*Nz + zl + 100000
        point_2 = yl*Nz + zl + Nz + 100000

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        # transfinite_line1.append(str(line_number))

file_object.write("\n\n")

# Create lines along the z-axis
for yl in range(Ny):
    for zl in range(Nz - 1):
        line_number = zl + yl*(Nz-1) + 1100000
        point_1 = zl + yl*Nz + 100000
        point_2 = zl + yl*Nz + 100001

        file_object.write(
            f"Line({line_number}) = {{{point_1}, {point_2}}};\n")

        # transfinite_line1.append(str(line_number))

file_object.write("\n\n")


file_object.close()