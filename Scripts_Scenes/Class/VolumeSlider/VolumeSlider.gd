class_name VolumeSlider
extends VSlider

@export var bus_name : String
var bus_index : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	value = AudioServer.get_bus_volume_linear(bus_index) * 100.0
	
func _on_value_changed(values : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(values / 100.0))
