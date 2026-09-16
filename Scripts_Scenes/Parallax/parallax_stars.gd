extends Node2D

@onready var parallax_layer_stars : ParallaxLayer = $ParallaxBackground/ParallaxLayerStars
@export var speed_scrolling : float = 10.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parallax_layer_stars.motion_offset.x -= speed_scrolling * delta
