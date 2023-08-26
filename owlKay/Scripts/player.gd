extends CharacterBody2D

var SPEED = 100.0

var JUMP_VELOCITY = -250.0

signal collisionWithSpike;

var jumpBuffer = 0.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation := $anim as AnimatedSprite2D

@onready var jumpsound := $jump as AudioStreamPlayer2D

@onready var life = 100

var jump_count =0;

@onready var coyoteTime := $coyote as Timer 

func _physics_process(delta):

	if not is_on_floor():
		
		velocity.y += gravity * delta

	if jumpBuffer > 0 and (is_on_floor() ||  !coyoteTime.is_stopped()):
		
		jump_count +=1
		
		animation.play("jump")
		
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_accept"):
		
		jumpBuffer = 0.1;
		
	jumpBuffer -= delta
	
	if not is_on_floor():
		
			animation.play("jump")
			
	if is_on_floor():
		
		jump_count = 0
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		
		velocity.x = direction * SPEED
		
		animation.play("walk")
		
		animation.scale.x = direction
		
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		animation.play("idle")
		
	var was_on_floor = is_on_floor()
	
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		
		coyoteTime.start()

func _on_collision_with_spike():
	
	emit_signal("colisionPlayer")


