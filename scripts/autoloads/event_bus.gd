extends Node


# Combat signals
signal entity_destroyed(attacker, destroyed_entity)
signal entity_damaged(attacker, damaged_entity)


# Structure signals
signal structure_built(structure)


# Game state signals
signal game_state_changed(new_state)
signal wave_started
signal game_won
signal game_lost
signal turn_ended


# Resources signals
signal resource_changed(resource)
