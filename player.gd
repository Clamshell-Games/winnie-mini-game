extends Node2D

# Speed of movement
@export var speed: float = 200.0

func _process(delta: float):
	# Movement vector
	var direction = Vector2.ZERO
	
	# Check for WASD input
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("move_right"):
		direction.x += 1
	
	# Normalize direction for consistent speed and apply movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	position += direction * speed * delta

func _ready():
	var collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(50, 25)  # Width and height divided by 2
	collision_shape.shape = shape
	add_child(collision_shape)
