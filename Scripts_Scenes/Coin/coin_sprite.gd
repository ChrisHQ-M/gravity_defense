extends Sprite2D

@onready var nb_coins : Label = $nb_coins


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nb_coins.text = "100"

func setTextNbCoins(txt : String) -> void:
	nb_coins.text = txt
