extends Node2D

@export var max_health := 50

var current_health: int:
	set(health_in):
		current_health = health_in
		if current_health < 1:
			queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
