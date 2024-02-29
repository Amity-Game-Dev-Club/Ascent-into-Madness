extends Sprite2D

var gunPos = 1
@export var mousePos = 1
var mouse_pos = 1

func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos =   get_global_mouse_position() 
		look_at(Vector2(mouse_pos.x, mouse_pos.y))
# func _process(delta):

