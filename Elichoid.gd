extends Node3D
var prec : Vector3
const SCALING = 0.1
@export var draw = false
var drawed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draw:
		if !drawed:
			drawHelicoid()
			drawed=true
			
func drawHelicoid():
		prec=Vector3(sin(0),0,cos(0))*SCALING
		var i = 0.1
		while(i<=30):
			var x = sin(i)
			var y = cos(i)
			var z = i*0.1
			get_parent().get_node("3Drawer").line(prec,Vector3(x,z,y)*SCALING)
			prec = Vector3(x,z,y)*SCALING
			i+=0.1
