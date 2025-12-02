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
	if Input.is_action_pressed("up"):
		animated_sprite_2d.play("walk_up")
	if Input.is_action_pressed("down"):
		animated_sprite_2d.play("walk_down")
	if Input.is_action_pressed("left"):
		animated_sprite_2d.play("walk_left")
	if Input.is_action_pressed("right"):
		animated_sprite_2d.play("walk_right")
