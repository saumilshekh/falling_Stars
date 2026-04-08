# hud.gd
extends CanvasLayer

@onready var score_label = $ScoreLabel
@onready var lives_label = $LivesLabel

func update_score(score: int):
	print("updating score to: ", score)
	score_label.text = "Score: " + str(score)

func update_lives(lives: int):
	print("updating lives to: ", lives)
	lives_label.text = "Lives: " + str(lives)
