extends Control

signal start_game

func show_game_over():
	show_message("Hilje zauz marika!")
	await get_tree().create_timer(3.0).timeout
	$start.show()
	
func show_message(text):
	$message.text = text
	$message.show()
	
func update_score(score):
	$score.text = str(score)

func _on_start_pressed():
	$start.hide()
	$message.hide()
	start_game.emit()
