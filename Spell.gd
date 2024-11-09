extends Node2D

@export var speed := 500.0

var spell_direction := Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += spell_direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("boundary"):
		queue_free()
		#print("bullet deleted")
