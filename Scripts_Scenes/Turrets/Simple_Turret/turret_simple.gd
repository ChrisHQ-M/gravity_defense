extends CharacterBody2D

signal activate_atk
signal disable_atk

var bullet : PackedScene = preload("res://Scripts_Scenes/Bullet/Simple_Bullet/simple_bullet.tscn")
var list_targets : Array[CharacterBody2D] = []
@onready var timer_fire_rate : Timer = $TimerFireRate

@onready var sprite_animation : AnimatedSprite2D = $sprite_animation
@onready var radius_sprite : Sprite2D = $AreaDetection/radius_sprite

func _ready() -> void:
	sprite_animation.play("default")
	radius_sprite.visible = false
	
	activate_atk.connect(_on_activate_atk_signal)
	disable_atk.connect(_on_disable_atk_signal)

func shootBullet() -> void:
	if list_targets != null:
		instantiate_bullet(bullet, global_position).setTarget(list_targets[0])

func _on_area_detection_mouse_entered() -> void:
	radius_sprite.visible = true

func _on_area_detection_mouse_exited() -> void:
	radius_sprite.visible = false

func _on_area_detection_body_entered(body: Node2D) -> void:
	if body != null && body.is_in_group("Enemy"):
		if list_targets.is_empty():
			activate_atk.emit()
		
		list_targets.append(body)

func _on_area_detection_body_exited(body: Node2D) -> void:
	if body != null && body.is_in_group("Enemy"):
		list_targets.erase(body)
		
		if list_targets.is_empty():
			disable_atk.emit()

func instantiate_bullet(obj : PackedScene, pos : Vector2) -> Node2D:
	var object = obj.instantiate()
	object.global_position = pos
	get_tree().current_scene.add_child(object)
	return object

func _on_activate_atk_signal() -> void:
	timer_fire_rate.start()
	
func _on_disable_atk_signal() -> void:
	timer_fire_rate.stop()

func _on_timer_fire_rate_timeout() -> void:
	shootBullet()
