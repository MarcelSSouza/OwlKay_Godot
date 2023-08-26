extends Node2D
signal player_collision


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass





func _on_spike_area_body_entered(body: Node2D):
	if body.name == "Player":
		get_tree().reload_current_scene()
		Global.coins_collected = -1;

