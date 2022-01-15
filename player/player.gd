extends Node2D

var color setget set_color

func _network_ready(is_source):
	if is_source:
		set_color(Color.from_hsv(rand_range(1, 360), 1, 1))
		position = Vector2(rand_range(0, 600), rand_range(0, 400))
	# same value on all clients now!
	print(color)

func set_color(c: Color):
	color = c
	$token.color = c

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-400, 0) * delta
	if Input.is_action_pressed("ui_right"):
		position += Vector2(400, 0) * delta
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0, -400) * delta
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0, 400) * delta
