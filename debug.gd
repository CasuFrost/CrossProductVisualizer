@tool
extends MeshInstance3D

func _ready():
	var surface_array = []
	surface_array.resize(ArrayMesh.ARRAY_MAX)
	surface_array[ArrayMesh.ARRAY_VERTEX] = PackedVector3Array([
		Vector3(0,0,0),
		Vector3(1,0,0),
		Vector3(0,1,0)
	])
	surface_array[ArrayMesh.ARRAY_INDEX] = PackedInt32Array([
		0,1,2
	])
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES,surface_array)
