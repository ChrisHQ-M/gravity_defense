extends AnimatedSprite2D

@export var speed : float

var init_position : Vector2
const DISTANCE_RANGE : float = 10.0

var target : Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target != null:
		global_position = target.global_position
	else:
		if global_position.distance_to(init_position) < DISTANCE_RANGE:
			global_position += speed * delta * (init_position - global_position).normalized()
			
func setTarget(tar : Node2D) -> void:
	target = tar
	
func setInitPosition(init : Vector2) -> void:
	init_position = init
