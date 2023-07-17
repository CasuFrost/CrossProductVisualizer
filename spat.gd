@tool
extends Node3D

@export var xsize = 20
@export var zsize = 20

var current_size_x = xsize
var current_size_z = zsize

var mesh_instance = MeshInstance3D.new()
var surface_tool = SurfaceTool.new()
var mesh = Mesh.new()

func _ready():
	if get_child_count() > 0:
		for child in get_children():
			remove_child(child)
	generate_plane()
func _process(delta):
	if(current_size_x != xsize or current_size_z != zsize):
		if get_child_count() > 0:
			for child in get_children():
				remove_child(child)

		current_size_x = xsize
		current_size_z = zsize
		
		mesh = Mesh.new()
		surface_tool = SurfaceTool.new()
		mesh_instance = MeshInstance3D.new()
		add_child(mesh_instance)
		mesh_instance.translation = Vector3(0,0,0)
		mesh_instance.mesh = mesh
		mesh_instance.owner = self
		generate_plane()
func generate_plane():
	
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	for x in xsize:
		for z in zsize +1:
			surface_tool.add_vertex(Vector3(x * 10, 0, z * 10))
			surface_tool.add_vertex(Vector3((x + 1) * 10, 0, z * 10))
	surface_tool.index()
	surface_tool.commit(mesh)
