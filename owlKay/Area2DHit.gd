extends Area2D

func _on_body_entered(body):
	if body.name=="Player":
		print("Player inside")
		Global.health -= 25
		print(body.life)
