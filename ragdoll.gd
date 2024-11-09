extends Node2D

#@onready var worm_body_knot: RigidBody2D = $WormBodyKnot
#linear_velocity = Vector2.Right + 50
@onready var body = get_tree().get_first_node_in_group("worm_body")

func move_left() -> void:
	body.linear_velocity = -50
		
func  _physics_process(delta: float) -> void:
		if Input.is_action_just_released("left"):
			move_left()

