extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")

func changePosition() -> void:
	GlobalSignal.blackhole_position_changed.emit(global_position)
	global_position = Vector2(randf() * 320.0, randf() * 180.0)
