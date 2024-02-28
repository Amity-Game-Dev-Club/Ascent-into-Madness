extends MeshInstance2D
var gunPos = 1
@export var mousePos = 1

var mouse_pos = 1




func _input(event):
	if event is InputEventMouseMotion:
		mousePos = event.position


func input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		look_at(Vector2(mouse_pos.x, mouse_pos.y))
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	print("X position of mouse in viewport:", mouse_pos.x)
	print("Y position of mouse in viewport:", mouse_pos.y)
