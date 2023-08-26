extends Area2D
signal gem_collected_by_player;
@onready var sound := $gotcha as AudioStreamPlayer2D
@onready var animation := $animation as AnimatedSprite2D

const SPEED = 100.0
var points = 0;




# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("default") # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body: Node2D):
	sound.play()
	Global.collect_coin()
	gem_collected_by_player.emit()
	animation.play("get")



func _on_gotcha_finished():
	queue_free()
