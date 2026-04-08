extends Node

func update_score(score: int):
	$ScoreLabel.text = "Score: " + str(score)

func update_lives(lives: int):
	$LivesLabel.text = "Lives: " + str(lives)
