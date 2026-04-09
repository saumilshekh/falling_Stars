extends Sprite2D

var scroll_speed = 50.0
var screen_height = 648.0

func _ready():
	# Create a duplicate of this sprite stacked above
	var copy = duplicate()
	copy.position.y = position.y - screen_height
	get_parent().add_child(copy)

func _process(delta):
	position.y += scroll_speed * delta
	if position.y >= screen_height:
		position.y -= screen_height * 2
