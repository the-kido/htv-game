extends Control
class_name GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Your score: " + str(Globals.score)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Globals.score = 0
	get_tree().change_scene_to_file("res://main.tscn")
