extends Area2D

export var speed = 600
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()

	# Handle inputs
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	# Update sprite direction
	if velocity.x != 0:
		get_node("Animated Sprite").flip_h = velocity.x > 0

	# Start/stop animation
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		get_node("Animated Sprite").play()
	else:
		get_node("Animated Sprite").stop()

	# Update position
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
