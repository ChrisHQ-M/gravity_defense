extends Control

@onready var blackhole_sprite : AnimatedSprite2D = $Visuals/blackhole_sprite

@onready var sound_btn : TextureButton = $Visuals/Buttons/sound_btn
var btn_pressed : bool = false
var sound_btn_active : CompressedTexture2D = preload("res://Game_Sprites/Buttons/Sound_btn/sound_btn_active.png")
var sound_btn_inactive : CompressedTexture2D = preload("res://Game_Sprites/Buttons/Sound_btn/sound_btn_inactive.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blackhole_sprite.play("default")
	SoundManager.play_music(preload("res://Sounds/Musics/Gravity_Defense.mp3"), true)
	sound_btn.texture_normal = sound_btn_active


func _on_play_btn_pressed() -> void:
	if btn_pressed == false:
		btn_pressed = true
		
		SoundManager.play_click_enter_sfx(0.0, 0.0)
		
		TransitionEffects.transition()
		await TransitionEffects.on_transition_finished

		get_tree().change_scene_to_file("res://Scripts_Scenes/Level/level_scene.tscn")


func _on_sound_btn_pressed() -> void:
	var master = AudioServer.get_bus_index("Master")
	var muted : bool = AudioServer.is_bus_mute(master)
	AudioServer.set_bus_mute(master, not muted)
	sound_btn.texture_normal = sound_btn_active if muted else sound_btn_inactive
