extends Area2D

var fall_speed = 200.0

func _physics_process(delta):
	position.y += fall_speed * delta
	#print(position.y)
	#print(get_viewport_rect().size.y)
	if position.y > get_viewport_rect().size.y:
		var bucket = get_tree().get_first_node_in_group("bucket")
		if bucket:
			bucket.lose_life()
			queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		body.increaseScore()
		$AudioStreamPlayer2D.play()
		queue_free()
