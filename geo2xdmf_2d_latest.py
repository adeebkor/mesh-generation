import gmsh
from dolfinx.io import XDMFFile, gmshio
from mpi4py import MPI

# Initialization
fname = "planar_2d_1.geo"
gmsh.initialize()
gmsh.open(fname)
model = gmsh.model()

# Generate the mesh
model.mesh.generate(2)

msh, cell_markers, facet_markers = gmshio.model_to_mesh(
    model, MPI.COMM_SELF, 0)

msh.name = "planar2d"
cell_markers.name = f"{msh.name}_cells"
facet_markers.name = f"{msh.name}_facets"

with XDMFFile(msh.comm, f"mesh_2d.xdmf", "w") as file:
    file.write_mesh(msh)
    file.write_meshtags(cell_markers)
    msh.topology.create_connectivity(msh.topology.dim - 1, msh.topology.dim)
    file.write_meshtags(facet_markers)
