# main.gd
extends Node

@export var star_scene: PackedScene

var elapsed_time = 0.0
var spawn_timer = 0.0

func _ready():
	randomize()

func _process(delta):
	elapsed_time += delta
	spawn_timer += delta
	if elapsed_time >= 60:
		get_tree().change_scene_to_file("res://levelClear.tscn")

	# Spawn interval shrinks over time (starts at 2s, floors at 0.2s)
	var spawn_interval = max(0.2, 2.0 - elapsed_time * 0.05)

	if spawn_timer >= spawn_interval * 2:
		spawn_timer = 0.0
		spawn_star()

func spawn_star():
	var star = star_scene.instantiate()
	var screen_width = get_tree().root.size.x
	star.position = Vector2(randf_range(20, screen_width - 20), -30)
	add_child(star)
