class_name ObjectPooling
extends Node

@export var scene : PackedScene
var object_pool : Array = []
@export var nbBullet : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(nbBullet):
		var obj = scene.instantiate()
		add_child(obj)
		obj.pool = self
		add_to_pool(obj)

func add_to_pool(obj : Node2D) -> void:
	if !object_pool.has(obj):
		obj.disable()
		object_pool.append(obj)
	
func pull_from_pool() -> Node2D:
	var obj : Node2D
	if object_pool.is_empty():
		obj = scene.instantiate()
		add_child(obj)
	else:
		obj = object_pool.pop_back()
		
	obj.pool = self
	obj.activation()
	return obj
