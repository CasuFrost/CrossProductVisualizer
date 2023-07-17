extends Node3D
@onready var drawer = get_node("3Drawer")
const SCALING = 0.1
var ogLines : Array
var lines : Array
var areaLines : Array
var time = 0
var rotateU : bool= false
var rotateW : bool= false
var showArea : bool = false
var u : Vector3 = Vector3()
var w : Vector3 = Vector3()
var originDrawed : bool = false
var rotateScene : bool = false
var rotateSpeed=0.6
var module=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if rotateScene:
		$center.rotation_degrees.y+=rotateSpeed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	time+=delta
	if !originDrawed:
		drawOrigin()
		originDrawed=true
	clearRedraw()
	
	getValues()
	
	var v = crossProdutct(w,u)
	
	var l1=drawer.line(Vector3(),u,Color.CORNSILK)
	var l2=drawer.line(Vector3(),w,Color.CORNSILK)
	var l3=drawer.line(Vector3(),v,Color.HOT_PINK)
	var point1 = drawer.triangle(v,0.005,Color.HOT_PINK,true)
	
	if showArea:
		var point2 = drawer.point(u,0.01,Color.CORNSILK)
		var point3 = drawer.point(w,0.01,Color.CORNSILK)
		lines.append(point2)
		lines.append(point3)
	else:
		var point2 = drawer.triangle(u,0.005,Color.CORNSILK)
		var point3 = drawer.triangle(w,0.005,Color.CORNSILK)
		lines.append(point2)
		lines.append(point3)
		
	lines.append(l1)
	lines.append(l2)
	lines.append(l3)
	lines.append(point1)
	
	
	showCrossProductArea()
	module=sqrt(v.x*v.x/SCALING+v.y*v.y/SCALING+v.z*v.z/SCALING)
	
	$CanvasLayer/module.text="Module of the cross product : "+str(module)
func showCrossProductArea():
	get_node("Area").set_u(u)
	get_node("Area").set_v(w)
	if showArea:
		var l1=drawer.line(u,u+w,Color.CORNSILK)
		var l2=drawer.line(w,u+w,Color.CORNSILK)
		areaLines.append(l1)
		areaLines.append(l2)
	
func clearRedraw():
	for i in lines:
		i.queue_free()
	lines.clear()
	for i in areaLines:
		i.queue_free()
	areaLines.clear()
	
func drawOrigin():
	var a = drawer.line(Vector3.ZERO,Vector3(SCALING*8,0,0),Color.RED)
	var b = drawer.line(Vector3.ZERO,Vector3(0,SCALING*8,0),Color.BLUE)
	var c = drawer.line(Vector3.ZERO,Vector3(0,0,SCALING*8),Color.GREEN)
	ogLines.append(a)
	ogLines.append(b)
	ogLines.append(c)
	
func getValues():
	if !rotateU:
		$CanvasLayer/u/rotateU.text="Rotate"
		u.x=float($CanvasLayer/u/x.text)*SCALING
		u.z=float($CanvasLayer/u/y.text)*SCALING
		u.y=float($CanvasLayer/u/z.text)*SCALING
	else:
		$CanvasLayer/u/rotateU.text="Stop"
		u.y=0
		u.x=sin(time)*SCALING*2
		u.z=cos(time)*SCALING*2
	if !rotateW:
		$CanvasLayer/w/rotateW.text="Rotate"
		w.x=float($CanvasLayer/w/x.text)*SCALING
		w.z=float($CanvasLayer/w/y.text)*SCALING
		w.y=float($CanvasLayer/w/z.text)*SCALING
	else:
		$CanvasLayer/w/rotateW.text="Stop"
		w.y=0
		w.x=cos(time)*SCALING*2
		w.z=sin(time)*SCALING*2
		
func crossProdutct(v : Vector3,w: Vector3) -> Vector3:
	return Vector3(v.y*w.z-v.z*w.y,v.z*w.x-v.x*w.z,v.x*w.y-v.y*w.x)/SCALING

func _on_rotate_u_button_down():
	rotateU = !rotateU


func _on_rotate_w_button_down():
	rotateW=!rotateW


func _on_button_button_down():
	return
	$center/ortCamera.current=!$center/ortCamera.current
	$center/Camera3D2.current=!$center/ortCamera.current
	if $center/ortCamera.current:
		$CanvasLayer/CameraSettings/TextEdit.text="Orthogonal"
	else:
		$CanvasLayer/CameraSettings/TextEdit.text="Prospective"


func _on_show_area_button_down():
	showArea=!showArea


func _on_rotate_button_button_down():
	#$center.rotation_degrees.y=0
	rotateScene=!rotateScene
	$CanvasLayer/rotateButton.text="rotate scene"
	if rotateScene:
		$CanvasLayer/rotateButton.text="stop"

func _on_rotate_button_pressed():
	pass


func _on_reset_rotation_button_down():
	$center.rotation_degrees.y=0
	rotateScene=false
	$CanvasLayer/rotateButton.text="rotate scene"


func _on_zoom_in_button_down():
	if $center/ortCamera.size>1:
		$center/ortCamera.size-=0.1


func _on_zoom_out_button_down():
	if $center/ortCamera.size<6:
		$center/ortCamera.size+=0.1
