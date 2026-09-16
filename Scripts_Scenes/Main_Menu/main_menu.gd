extends Control

@onready var blackhole_sprite : AnimatedSprite2D = $Visuals/blackhole_sprite

var btn_pressed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blackhole_sprite.play("default")


func _on_play_btn_pressed() -> void:
	if btn_pressed == false:
		btn_pressed = true
		
		SoundManager.play_click_enter_sfx(0.0, 0.0)
		
		TransitionEffects.transition()
		await TransitionEffects.on_transition_finished

		get_tree().change_scene_to_file("res://Scripts_Scenes/Level/level_scene.tscn")
