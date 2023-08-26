extends Node2D

const MAX_HEALTH= 100
var health= MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for spike in $spikes.get_children():
		spike.player_collision.connect(_on_player_collision_with_spike)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.initialDialogue == true:
		DialogueManager.show_example_dialogue_balloon(load("res://Scripts/main.dialogue"), "main")
		Global.initialDialogue = false;
		


func _on_door_body_entered(body: Node2D):
	if body == $Player:
		get_tree().change_scene_to_file("res://Scripts/fase2.tscn")


func _on_coin_gem_collected_by_player():
	$CanvasCoins/CoinsText.text = "Coins: " + str(Global.coins_collected)
	
func set_health_bar():
	$ProgressBar.text = Global.health
	



func _on_player_collision_with_spike():
	get_tree().reload_current_scene()
