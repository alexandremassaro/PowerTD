extends Node3D


func _input(event: InputEvent) -> void:
	if event.is_action_released("play"):
		GameManager.change_game_state(GameManager.GameState.PLAYING)
	elif event.is_action_released("pause"):
		GameManager.change_game_state(GameManager.GameState.PAUSED)
	elif event.is_action_released("game_over"):
		GameManager.change_game_state(GameManager.GameState.GAME_OVER)
	elif event.is_action_released("menu"):
		GameManager.change_game_state(GameManager.GameState.MENU)

