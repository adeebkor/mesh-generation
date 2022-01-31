import numpy as np
import gmsh

from mpi4py import MPI

from dolfinx.graph import create_adjacencylist
from dolfinx.io import (cell_perm_gmsh, extract_gmsh_geometry,
                        ufl_mesh_from_gmsh, distribute_entity_data,
                        extract_gmsh_topology_and_markers, XDMFFile)
from dolfinx.mesh import CellType, create_mesh, create_meshtags

# Initialization
gmsh.initialize()
gmsh.open("circular_scatterer_structured_2d.geo")

if MPI.COMM_WORLD.rank == 0:
    gmsh.model.mesh.generate(2)

    x = extract_gmsh_geometry(gmsh.model)
    gmsh_cell_id = MPI.COMM_WORLD.bcast(
        gmsh.model.mesh.getElementType("Quadrangle", 1), root=0)
    topologies = extract_gmsh_topology_and_markers(gmsh.model)
    cells = topologies[gmsh_cell_id]["topology"]
    cell_data = topologies[gmsh_cell_id]["cell_data"]

    num_nodes = MPI.COMM_WORLD.bcast(cells.shape[1], root=0)
    gmsh_facet_id = gmsh.model.mesh.getElementType("Line", 1)
    marked_facets = topologies[gmsh_facet_id]["topology"].astype(np.int64)
    facet_values = topologies[gmsh_facet_id]["cell_data"].astype(np.int32)

else:
    gmsh_cell_id = MPI.COMM_WORLD.bcast(None, root=0)
    num_nodes = MPI.COMM_WORLD.bcast(None, root=0)
    cells, x = np.empty([0, num_nodes]), np.empty([0, 3])
    marked_facets = np.empty((0, 3), dtype=np.int64)
    facet_values = np.empty((0, ), dtype=np.int32)

domain = ufl_mesh_from_gmsh(gmsh_cell_id, 3)
gmsh_quadrangle4 = cell_perm_gmsh(CellType.quadrilateral, 4)
cells = cells[:, gmsh_quadrangle4]

mesh = create_mesh(MPI.COMM_WORLD, cells, x[:, :2], domain)
mesh.name = "sound_soft"

gmsh_line2 = cell_perm_gmsh(CellType.interval, 2)
marked_facets = marked_facets[:, gmsh_line2]

entities, values = distribute_entity_data(mesh, 1, marked_facets, facet_values)
mesh.topology.create_connectivity(1, 0)
mt = create_meshtags(mesh, 1, create_adjacencylist(entities), np.int32(values))
mt.name = "sound_soft_surface"

with XDMFFile(MPI.COMM_WORLD, "mesh.xdmf", "w") as file:
    file.write_mesh(mesh)
    mesh.topology.create_connectivity(1, 2)
    file.write_meshtags(
        mt, geometry_xpath="/Xdmf/Domain/Grid[@Name='sound_soft']/Geometry")
