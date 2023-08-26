extends Node
var coins_collected = -1;
var initialDialogue = false;
var health = 100;


func collect_coin():
	coins_collected = coins_collected + 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(event):
	if event.is_action("sair"):
		get_tree().change_scene_to_file("res://Scripts/menu.tscn")
		
		
