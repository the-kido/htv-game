extends StaticBody2D

@export var type: GlobalData.GarbageType

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if type == GlobalData.GarbageType.TRASH:
		trash_type_string = "trash"
	else:
		trash_type_string = "recycling"


@export var speed = 500

var trash_type_string: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(trash_type_string + "_left"):
		position += speed * delta * Vector2.LEFT
	if Input.is_action_pressed(trash_type_string + "_right"):
		position += speed * delta * Vector2.RIGHT
		 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is Falling:
		return
	
	print("yippe")
	if body.type == type:
		print("Correct!")
		Globals.change_score(3)
	else:
		print("NOT CORRECR!")
		Globals.change_score(-3)
	body.queue_free()
