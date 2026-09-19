extends Enemy

@onready var timer_hit : Timer = $TimerHit
@onready var sprite : AnimatedSprite2D = $sprite

func _ready() -> void:
	super._ready()
	sprite.play("idle")

func setHP(amount : float) -> void:
	super.setHP(amount)
	sprite.play("hit")

func _on_timer_hit_timeout() -> void:
	sprite.play("idle")
