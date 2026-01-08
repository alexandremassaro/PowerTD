extends Node


enum GameState {MENU, PLAYING, PAUSED, GAME_OVER}
enum ResourceType {GOLD}


var is_debug_mode: bool = true
var current_game_state: GameState = GameState.PLAYING
var previous_game_states: Array[GameState] = []

var _resources: Dictionary = {}

var current_wave: int = 0:
	set(value):
		current_wave = clampi(value, 0, 999999)


func change_game_state(new_game_state: GameState):
	var change_state_ok: bool = false

	match new_game_state:
		GameState.MENU:
			if current_game_state == GameState.PAUSED or current_game_state == GameState.GAME_OVER:
					change_state_ok = true
		GameState.PLAYING:
			if current_game_state == GameState.MENU or current_game_state == GameState.PAUSED:
					change_state_ok = true
		_:
			if current_game_state == GameState.PLAYING:
					change_state_ok = true

	if change_state_ok:
		previous_game_states.push_front(current_game_state)
		previous_game_states.resize(3)
		current_game_state = new_game_state
		EventBus.game_state_changed.emit(current_game_state)

	debug_text("Game state changed: ", change_state_ok, " : ", GameState.keys()[current_game_state])


func start_game():
	change_game_state(GameState.PLAYING)


func pause_game():
	change_game_state(GameState.PAUSED)


func resume_game():
	change_game_state(GameState.PLAYING)


func debug_text(...text) -> void:
	var output = ""
	if is_debug_mode:
		for t in text:
			output += str(t)
		print(output)


func add_resource(resource_type: ResourceType, value: int):
	_resources[resource_type] = value
	EventBus.resource_changed.emit(resource_type)


func spend_resource(resource_type: ResourceType, value: int):
	if _resources[resource_type] >= value:
		_resources[resource_type] -= value
		EventBus.resource_changed.emit(resource_type)


func lose_life():
	pass
