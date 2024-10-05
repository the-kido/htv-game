extends RigidBody2D
class_name Falling

var type: GlobalData.GarbageType
@export var sprite : Sprite2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type = GlobalData.GarbageType.TRASH if randi_range(0, 1) == 0  else GlobalData.GarbageType.RECYCLING
	if type == GlobalData.GarbageType.TRASH:
		sprite.texture = Globals.trash_sprites.pick_random()
	else:
		sprite.texture = Globals.recycling_sprites.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y >= Globals.void_distance:
		Globals.change_score(-1)
		queue_free()
