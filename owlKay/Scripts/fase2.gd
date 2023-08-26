extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasCoins/CoinsText.text = "Coins: " + str(Global.coins_collected)
	
func _on_door_body_entered(body: Node2D):
	if body == $Player:
		get_tree().change_scene_to_file("res://Scripts/fase3.tscn")

func _on_coin_gem_collected_by_player():
	$CanvasCoins/CoinsText.text = "Coins: " + str(Global.coins_collected)
	
