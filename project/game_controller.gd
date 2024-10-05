extends Node

func _ready() -> void:
	pass # Replace with function body.

@export var timer: Timer
@export var falling: PackedScene


var game_over_time = 60

var game_time: float

func _process(delta: float) -> void:
	game_time += delta
	
	if (game_time >= game_over_time):
		print("GAME OVER!")
		return
	
	get_game_speed(delta)

func _on_timer_timeout() -> void:
	var new = falling.instantiate()
	add_child(new)
	new.position.y = -10
	new.position.x = randf_range(100, 1820)


func get_game_speed(delta: float):
	var v_scale = 0.258198889747
	var time = v_scale * sqrt(-game_time + 60) + 3
	timer.wait_time = time
	
