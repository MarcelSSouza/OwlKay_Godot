extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scripts/fase.tscn")


func _on_button_pressed_exit():
	get_tree().quit()


func _on_button_pressed_controls():
	get_tree().change_scene_to_file("res://Scripts/controls.tscn")
