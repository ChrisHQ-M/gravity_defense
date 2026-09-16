extends CanvasLayer

signal on_transition_finished

@onready var animation : AnimationPlayer = $Animation
@onready var sprite : AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.visible = false
	
	# Connection between the AnimationPlayer and the method that manages it.
	animation.animation_finished.connect(_on_animation_finished)

# Called when an animation from the AnimationPlayer is finished.
func _on_animation_finished(anim_name : String) -> void:
	# At the end of the transition to black, emits a signal and fades back to normal.
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation.play("fade_to_normal")
	# When fading back to normal is over, disable the visibility of the sprite.
	elif anim_name == "fade_to_normal":
		sprite.visible = false

# Starts a fade to black circle transition.
func transition() -> void:
	sprite.visible = true
	animation.play("fade_to_black")
