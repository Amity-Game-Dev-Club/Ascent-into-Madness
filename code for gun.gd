extends Sprite2D
#useless vars that we wont change
@onready var aimcast = $"aiming go brrr"
var gunPos = 1
@export var mousePos = 1
var mouse_pos = 1
@onready var muzzle = $"gun sprite/muzzle"
@onready var bullet = preload("res://bullet.gd")
#gun stats
var damage = 25
var firerate = 14 #fire rate is in rounds per second 
var magsize = 30 


#gun rotation
func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos =   get_global_mouse_position() 
		look_at(Vector2(mouse_pos.x, mouse_pos.y))

# right now im just going to try and use hitscan wepons for now. later i will fix this and mak it into projectile wepons
func _physics_process(delta: float) -> void:
	if aimcast.is_colliding():
		if Input.is_action_pressed("mouseL"):
			var b = bullet.instantiate()
			muzzle.add_child(b)
			b.look_at(aimcast.get_collision_point())
			b.shoot = true
