extends Node
class_name GameController


var ggs: PackedScene
func _ready() -> void:
	ggs = load("res://game_over.tscn")

@export var timer: Timer
@export var falling: PackedScene


var game_over_time = 60

var game_time: float

func _process(delta: float) -> void:
	game_time += delta
	
	if (game_time >= game_over_time):
		print("GAME OVER!")
		get_tree().change_scene_to_packed(ggs)
	
	get_game_speed(delta)

var dist = 200

func _on_timer_timeout() -> void:
	var new = falling.instantiate()
	add_child(new)
	new.position.y = -100
	new.position.x = randf_range(dist, 1920 - dist)


func get_game_speed(delta: float):
	var v_scale = 0.258198889747
	var time = v_scale * sqrt(-game_time + 60) + 3
	timer.wait_time = time
	
