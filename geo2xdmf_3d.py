import numpy as np
import gmsh

from mpi4py import MPI

from dolfinx.graph import create_adjacencylist
from dolfinx.io import (cell_perm_gmsh, extract_gmsh_geometry,
                        ufl_mesh_from_gmsh, distribute_entity_data,
                        extract_gmsh_topology_and_markers, XDMFFile)
from dolfinx.mesh import CellType, create_mesh, meshtags_from_entities

# Initialization
source_type = "planar"
fname = f"{source_type}_3d.geo"
gmsh.initialize()
gmsh.open(fname)

if MPI.COMM_WORLD.rank == 0:
    gmsh.model.mesh.generate(3)

    x = extract_gmsh_geometry(gmsh.model)
    gmsh_cell_id = MPI.COMM_WORLD.bcast(
        gmsh.model.mesh.getElementType("Hexahedron", 1), root=0)
    topologies = extract_gmsh_topology_and_markers(gmsh.model)
    cells = topologies[gmsh_cell_id]["topology"]
    cell_data = topologies[gmsh_cell_id]["cell_data"]

    num_nodes = MPI.COMM_WORLD.bcast(cells.shape[1], root=0)
    gmsh_facet_id = gmsh.model.mesh.getElementType("Quadrangle", 1)
    marked_facets = topologies[gmsh_facet_id]["topology"].astype(np.int64)
    facet_values = topologies[gmsh_facet_id]["cell_data"].astype(np.int32)

else:
    gmsh_cell_id = MPI.COMM_WORLD.bcast(None, root=0)
    num_nodes = MPI.COMM_WORLD.bcast(None, root=0)
    cells, x = np.empty([0, num_nodes]), np.empty([0, 3])
    marked_facets = np.empty((0, 3), dtype=np.int64)
    facet_values = np.empty((0, ), dtype=np.int32)

domain = ufl_mesh_from_gmsh(gmsh_cell_id, 3)
gmsh_hexahedron8 = cell_perm_gmsh(CellType.hexahedron, 8)
cells = cells[:, gmsh_hexahedron8]

mesh = create_mesh(MPI.COMM_WORLD, cells, x, domain)
mesh.name = f"{source_type}3d"

gmsh_quadrangle4 = cell_perm_gmsh(CellType.quadrilateral, 4)
marked_facets = marked_facets[:, gmsh_quadrangle4]

entities, values = distribute_entity_data(mesh, 2, marked_facets, facet_values)
mesh.topology.create_connectivity(2, 0)
mt = meshtags_from_entities(
    mesh, 2, create_adjacencylist(entities), np.int32(values))
mt.name = f"{source_type}3d_boundaries"

with XDMFFile(MPI.COMM_WORLD, "mesh.xdmf", "w") as file:
    file.write_mesh(mesh)
    mesh.topology.create_connectivity(2, 3)
    file.write_meshtags(
        mt, geometry_xpath=f"/Xdmf/Domain/Grid[@Name='{source_type}3d']/Geometry")
