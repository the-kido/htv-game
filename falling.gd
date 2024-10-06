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
		
	#angular_velocity = randf_range(-100, 100)
	constant_force = Vector2( randf_range(-30,30), 0)
	rotation_degrees = randf_range(0,360)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y >= Globals.void_distance:
		Globals.change_score(-1)
		queue_free()
