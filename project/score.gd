extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.score_updated.connect(update_score)

func update_score():
	text = "Score: " + str(Globals.score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
