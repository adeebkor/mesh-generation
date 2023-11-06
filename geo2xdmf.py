#
# .. _geo2xdmf:
#
# A script to generate the XDMF mesh file from gmsh GEO file
# ==========================================================
# Copyright (C) 2023 Adeeb Arif Kor

import sys
import gmsh

from dolfinx.io import XDMFFile, gmshio
from mpi4py import MPI

# Initialization
fname = sys.argv[1]
gmsh.initialize()
gmsh.open(f"{fname}.geo")

mesh_comm = MPI.COMM_WORLD
model_rank = 0

geom_dim = int(sys.argv[2])
geom_ord = int(sys.argv[3])

if mesh_comm.rank == model_rank:
    gmsh.model.mesh.generate(geom_dim)

    if geom_ord > 1:
        gmsh.model.mesh.setOrder(geom_ord)
        gmsh.model.mesh.optimize("HighOrder")

msh, ct, ft = gmshio.model_to_mesh(
    gmsh.model, mesh_comm, model_rank, gdim=geom_dim)

msh.name = fname
ct.name = f"{msh.name}_cells"
ft.name = f"{msh.name}_facets"

with XDMFFile(msh.comm, "mesh.xdmf", "w") as file:
    file.write_mesh(msh)
    msh.topology.create_connectivity(geom_dim-1, geom_dim)
    file.write_meshtags(
        ct, msh.geometry, 
        geometry_xpath=f"/Xdmf/Domain/Grid[@Name='{msh.name}']/Geometry")
    file.write_meshtags(
        ft, msh.geometry,
        geometry_xpath=f"/Xdmf/Domain/Grid[@Name='{msh.name}']/Geometry")
