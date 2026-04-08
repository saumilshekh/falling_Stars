extends CharacterBody2D


var SPEED = 500.0
var lives = 5
var score = 0
const gravity = 980
# in bucket.gd

func increaseScore():
	score += 1
	var hud = get_tree().get_first_node_in_group("hud")
	if hud:
		hud.update_score(score)

func lose_life():
	lives -= 1
	var hud = get_tree().get_first_node_in_group("hud")
	if hud:
		hud.update_lives(lives)
	if lives <= 0:
		print("Game over!")

# bucket.gd

func _ready():
	var hud = get_tree().get_first_node_in_group("hud")
	if hud:
		print("HUD found!")
		hud.update_score(0)
		hud.update_lives(lives)
	else:
		print("HUD not found!")

var speed = 400
var base_speed = 300.0
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	var main = get_tree().get_first_node_in_group("main")
	speed = base_speed
	
	if main:
		print("elapsed: ", main.elapsed_time)
		speed = base_speed + main.elapsed_time * 10.0
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("default")
