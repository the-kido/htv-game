extends Label

@export var controller: GameController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Time: " + str(int(controller.game_over_time - controller.game_time)) + "s"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Time: " + str(int(controller.game_over_time - controller.game_time)) + "s"
