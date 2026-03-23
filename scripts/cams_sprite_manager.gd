extends Node2D

@onready var char1 = get_node("/root/Office/Char1")
@onready var char2 = get_node("/root/Office/Char2")
@onready var freddy = get_node("/root/Office/Freddy")
@onready var steven = get_node("/root/Office/Steven")

# Sprites per character per room
@export var char1_stage: Sprite2D
@export var char1_dining: Sprite2D
@export var char1_backstage: Sprite2D
@export var char1_kitchen: Sprite2D
@export var char1_lefthall: Sprite2D
@export var char1_righthall: Sprite2D

@export var char2_stage: Sprite2D
@export var char2_dining: Sprite2D
@export var char2_backstage: Sprite2D
@export var char2_kitchen: Sprite2D
@export var char2_lefthall: Sprite2D
@export var char2_righthall: Sprite2D

@export var freddy_stage: Sprite2D
@export var freddy_dining: Sprite2D
@export var freddy_backstage: Sprite2D
@export var freddy_kitchen: Sprite2D
@export var freddy_lefthall: Sprite2D
@export var freddy_righthall: Sprite2D

@export var steven_stage: Sprite2D
@export var steven_dining: Sprite2D
@export var steven_backstage: Sprite2D
@export var steven_kitchen: Sprite2D
@export var steven_lefthall: Sprite2D
@export var steven_righthall: Sprite2D

var char1_sprites: Dictionary = {}
var char2_sprites: Dictionary = {}
var freddy_sprites: Dictionary = {}
var steven_sprites: Dictionary = {}

func _ready() -> void:
	char1_sprites = {
		"stage": char1_stage,
		"dining": char1_dining,
		"backstage": char1_backstage,
		"kitchen": char1_kitchen,
		"lefthall": char1_lefthall,
		"righthall": char1_righthall
	}
	char2_sprites = {
		"stage": char2_stage,
		"dining": char2_dining,
		"backstage": char2_backstage,
		"kitchen": char2_kitchen,
		"lefthall": char2_lefthall,
		"righthall": char2_righthall
	}
	freddy_sprites = {
		"stage": freddy_stage,
		"dining": freddy_dining,
		"backstage": freddy_backstage,
		"kitchen": freddy_kitchen,
		"lefthall": freddy_lefthall,
		"righthall": freddy_righthall
	}
	steven_sprites = {
		"stage": steven_stage,
		"dining": steven_dining,
		"backstage": steven_backstage,
		"kitchen": steven_kitchen,
		"lefthall": steven_lefthall,
		"righthall": steven_righthall
	}

func _process(_delta: float) -> void:
	update_character(char1, char1_sprites)
	update_character(char2, char2_sprites)
	update_character(freddy, freddy_sprites)
	update_character(steven, steven_sprites)

func update_character(character: Node, sprites: Dictionary) -> void:
	for room in sprites:
		var sprite = sprites[room]
		if sprite != null:
			sprite.visible = (character.char_position == room)
