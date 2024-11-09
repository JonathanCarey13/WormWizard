extends RigidBody2D


@onready var body = get_tree().get_first_node_in_group("worm_body")
@onready var spell = preload("res://Spell.tscn")

@export var thrust_left := -5.0
@export var thrust_right := 5.0
@export var max_health := 50

var current_health: int:
	set(health_in):
		current_health = health_in
		if current_health < 1:
			queue_free()

func _ready() -> void:
	current_health = max_health

func move_left() -> void:
	apply_central_impulse(Vector2(thrust_left, 0))

func move_right() -> void:
	apply_central_impulse(Vector2(thrust_right, 0))

func _process(delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("left"):
		move_left()
	if Input.is_action_pressed("right"):
		move_right()
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot() -> void:
	var spell = spell.instantiate()
	spell.position = position
	spell.spell_direction = (position - get_global_mouse_position()).normalized()
	add_child(spell)
