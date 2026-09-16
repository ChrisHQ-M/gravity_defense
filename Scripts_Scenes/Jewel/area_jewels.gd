extends AnimatedSprite2D

@onready var timer_animation : Timer = $TimerAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_animation.start()


func _on_timer_animation_timeout() -> void:
	play("default")
	
