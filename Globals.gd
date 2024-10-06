extends Node
class_name GlobalData

enum GarbageType {
	TRASH,
	RECYCLING
}

var recycling_sprites: Array[Texture2D]
var trash_sprites: Array[Texture2D]

var score = 0
signal score_updated

func change_score(change: int):
	score = max(score + change, 0)
	score_updated.emit()

var void_distance : int = 1290

# Called when the node enters the scene tree for the first time.
var recycling_texture_dir = "res://assets/recycling-textures/"
var trash_texture_dir = "res://assets/trash-textures/"


func _ready() -> void:
	recycling_sprites.append(load("res://assets/recycling-textures/ryc_1.png"))
	recycling_sprites.append(load("res://assets/recycling-textures/ryc_2.png"))
	recycling_sprites.append(load("res://assets/recycling-textures/ryc_3.png"))
	recycling_sprites.append(load("res://assets/recycling-textures/ryc_4.png"))	
	recycling_sprites.append(load("res://assets/recycling-textures/ryc_5.png"))
	
	
	trash_sprites.append(load("res://assets/trash-textures/trash_1.png"))
	trash_sprites.append(load("res://assets/trash-textures/trash_2.png"))
	trash_sprites.append(load("res://assets/trash-textures/trash_3.png"))
	trash_sprites.append(load("res://assets/trash-textures/trash_4.png"))
	
	#recycling_sprites = load_textures(recycling_texture_dir)
	#trash_sprites = load_textures(trash_texture_dir)

func load_textures(dir: String):
	var textures: Array[Texture2D]
	
	var dir_access = DirAccess.open(dir)
	for file in dir_access.get_files():
		if file.ends_with(".png"):
			textures.append(load(dir + file) as Texture2D)
	return textures
