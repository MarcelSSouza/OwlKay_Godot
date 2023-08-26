extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var direction := 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation := $EnemySprite as AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if $wallDetector.is_colliding():
		direction *=-1
		$wallDetector.scale.x *= -1
		$EnemySprite.scale.x *= -1
		
	velocity.x = direction * SPEED + delta
	move_and_slide()



