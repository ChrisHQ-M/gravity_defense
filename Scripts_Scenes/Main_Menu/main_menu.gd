extends Control

@onready var blackhole_sprite : AnimatedSprite2D = $Visuals/blackhole_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blackhole_sprite.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
