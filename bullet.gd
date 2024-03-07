extends RigidBody2D
var shoot = false
const Damage = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		body.health = body.health-Damage
		queue_free()
	else:
		queue_free() 
