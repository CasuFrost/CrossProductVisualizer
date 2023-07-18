extends Node3D
func line(pos1: Vector3, pos2: Vector3, color = Color.WHITE_SMOKE) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	#mesh_instance.cast_shadow = false

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(pos1)
	immediate_mesh.surface_add_vertex(pos2)
	immediate_mesh.surface_end()	
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().get_root().add_child(mesh_instance)
	
	return mesh_instance
	

func point(pos:Vector3, radius = 0.05, color = Color.WHITE_SMOKE) -> MeshInstance3D:
	var mesh_instance := MeshInstance3D.new()
	var sphere_mesh := SphereMesh.new()
	var material := ORMMaterial3D.new()
		
	mesh_instance.mesh = sphere_mesh
	#mesh_instance.cast_shadow = false
	mesh_instance.position = pos
	
	sphere_mesh.radius = radius
	sphere_mesh.height = radius*2
	sphere_mesh.material = material
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().get_root().add_child(mesh_instance)
	
	return mesh_instance
	
func triangle(pos:Vector3,color= Color.WHITE_SMOKE,b = false)-> MeshInstance3D:
	var mesh_instance :MeshInstance3D 
	#var cone_mesh := load("res://cone.obj")
	mesh_instance=get_parent().get_node("cone").duplicate()
	#mesh_instance=get_parent().get_node("pyramid").duplicate()
	if abs(pos.x)>0 or abs(pos.y)>0 or abs(pos.z)>0:
		mesh_instance.visible=true
	var newMaterial = StandardMaterial3D.new() #Make a new Spatial Material
	newMaterial.shading_mode=BaseMaterial3D.SHADING_MODE_UNSHADED
	newMaterial.albedo_color = color
	mesh_instance.material_override=newMaterial
	get_tree().get_root().add_child(mesh_instance)
	mesh_instance.position = Vector3()
	mesh_instance.look_at(pos)
	if pos.y!=0 and pos.z==0 and pos.x==0:
		if pos.y>0:
			mesh_instance.rotation_degrees=Vector3(90,0,0)
		else:
			mesh_instance.rotation_degrees=Vector3(-90,0,0)
	var Scale = get_parent().get_node("center/ortCamera").size
	mesh_instance.scale=Vector3(Scale,Scale,Scale)
	mesh_instance.position = pos
	return mesh_instance
func pir(pos:Vector3,color= Color.WHITE_SMOKE,b = false)-> MeshInstance3D:
	var mesh_instance :MeshInstance3D 
	#var cone_mesh := load("res://cone.obj")
	
	mesh_instance=get_parent().get_node("pyramid").duplicate()
	if abs(pos.x)>0 or abs(pos.y)>0 or abs(pos.z)>0:
		mesh_instance.visible=true
	var newMaterial = StandardMaterial3D.new() #Make a new Spatial Material
	#newMaterial.shading_mode=BaseMaterial3D.SHADING_MODE_UNSHADED
	newMaterial.albedo_color = color
	mesh_instance.material_override=newMaterial
	get_tree().get_root().add_child(mesh_instance)
	mesh_instance.position = Vector3()
	mesh_instance.look_at(pos)
	if pos.y!=0 and pos.z==0 and pos.x==0:
		if pos.y>0:
			mesh_instance.rotation_degrees=Vector3(90,0,0)
		else:
			mesh_instance.rotation_degrees=Vector3(-90,0,0)
	var Scale = get_parent().get_node("center/ortCamera").size*0.8
	mesh_instance.scale=Vector3(Scale,Scale,Scale)
	mesh_instance.position = pos
	return mesh_instance
