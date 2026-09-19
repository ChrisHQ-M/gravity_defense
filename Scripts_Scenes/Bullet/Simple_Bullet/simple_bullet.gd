extends AnimatedSprite2D

var target : CharacterBody2D

const SPEED : float = 100.0

func setTarget(body : CharacterBody2D) -> void:
	target = body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target != null:
		global_position += SPEED * delta * (target.global_position - global_position).normalized()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
