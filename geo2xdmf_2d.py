import gmsh

from dolfinx.io import XDMFFile, gmshio
from mpi4py import MPI

# Initialization
fname = "planewave_2d_4"
gmsh.initialize()
gmsh.open(f"{fname}.geo")

mesh_comm = MPI.COMM_WORLD
model_rank = 0

if mesh_comm.rank == model_rank:
    gmsh.model.mesh.generate(2)
    # gmsh.model.mesh.setOrder(1)
    # gmsh.model.mesh.optimize("HighOrder")

msh, ct, ft = gmshio.model_to_mesh(gmsh.model, mesh_comm, model_rank, gdim=2)
msh.name = fname
ct.name = f"{msh.name}_cells"
ft.name = f"{msh.name}_facets"

with XDMFFile(msh.comm, "mesh.xdmf", "w") as file:
    file.write_mesh(msh)
    msh.topology.create_connectivity(1, 2)
    file.write_meshtags(ct, 
        geometry_xpath=f"/Xdmf/Domain/Grid[@Name='{msh.name}']/Geometry")
    file.write_meshtags(ft, 
        geometry_xpath=f"/Xdmf/Domain/Grid[@Name='{msh.name}']/Geometry")
