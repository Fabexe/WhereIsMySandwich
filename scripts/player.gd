extends CharacterBody2D

@export var speed = 50
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Get movement inputs
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

# Set player physics
func _physics_process(_delta):
	get_input()
	move_and_slide()

# Set player animation related to his direction
func _process(_delta):
	var direction = $AnimatedSprite2D
	if Input.is_action_pressed("up"):
		direction.play("walk_up")
	elif Input.is_action_pressed("down"):
		direction.play("walk_down")
	elif Input.is_action_pressed("left"):
		direction.flip_h = true
		direction.play("walk_x")
	elif Input.is_action_pressed("right"):
		direction.flip_h = false
		direction.play("walk_x")
	else:
		direction.stop()
