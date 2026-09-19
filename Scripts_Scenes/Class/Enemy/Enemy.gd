class_name Enemy
extends CharacterBody2D

signal hp_changed

@export var max_hp : float
var hp : float
var big_impact : PackedScene = preload("res://Scripts_Scenes/Impacts/big_impact.tscn")

@export var speed : float = 20.0
var spawner : Vector2
var area_jewels : Vector2

var jewel : Jewel = null

func _ready() -> void:
	hp = max_hp

func setSpawner(pos : Vector2) -> void:
	spawner = pos
	
func setAreaJewels(pos : Vector2) -> void:
	area_jewels = pos

func setJewel(j : Jewel) -> void:
	jewel = j

func _physics_process(delta: float) -> void:
	if jewel == null:
		velocity = speed * delta * (area_jewels - global_position).normalized()
	else:
		velocity = (spawner - global_position).normalized() * speed * delta

func setHP(amount : float) -> void:
	hp += amount
	if hp >= max_hp:
		hp = max_hp
	elif hp <= 0.0:
		hp = 0.0

	hp_changed.emit()

func _on_hp_changed_signal() -> void:
	if hp <= 0.0:
		instantiate_obj(big_impact, global_position, 1.0)
		jewel.setTarget(null)
		queue_free()

func instantiate_obj(obj : PackedScene, pos : Vector2, scl : float) -> Node2D:
	var object = obj.instantiate()
	object.global_position = pos
	object.scale = Vector2(scl, scl)
	get_tree().current_scene.add_child(object)
	return object
