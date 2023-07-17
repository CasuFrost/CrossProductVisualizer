extends MeshInstance3D
var surface_array = []
var u =Vector3()
var w =Vector3()
var z =Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	surface_array.resize(ArrayMesh.ARRAY_MAX)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible=get_parent().showArea
	z=u+w
	surface_array.clear()
	surface_array.resize(ArrayMesh.ARRAY_MAX)
	gen_mesh()
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES,surface_array)
	
func gen_mesh():
	surface_array[ArrayMesh.ARRAY_VERTEX] = PackedVector3Array([
		Vector3(),
		u,
		w,
		z
	])
	surface_array[ArrayMesh.ARRAY_INDEX] = PackedInt32Array([
		0,1,2,
		1,2,3,
		2,1,0,
		3,2,1
	])
	
	
func set_u(value):
	u=value
func set_v(value):
	w=value
