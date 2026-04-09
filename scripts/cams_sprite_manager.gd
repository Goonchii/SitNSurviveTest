extends Node2D

@onready var char1 = get_node("/root/Office/Char1")
@onready var char2 = get_node("/root/Office/Char2")
@onready var freddy = get_node("/root/Office/Freddy")
@onready var steven = get_node("/root/Office/Steven")

# Sprites per character per room
@export var char1_main: Sprite2D
@export var char1_poobert: Sprite2D
@export var char1_backstage: Sprite2D
@export var char1_edit: Sprite2D
@export var char1_lounge: Sprite2D
@export var char1_toilet: Sprite2D
@export var char1_entrance: Sprite2D
@export var char1_equipa: Sprite2D
@export var char1_equipb: Sprite2D
@export var char1_workshop: Sprite2D
@export var char1_props: Sprite2D

@export var char2_main: Sprite2D
@export var char2_poobert: Sprite2D
@export var char2_backstage: Sprite2D
@export var char2_edit: Sprite2D
@export var char2_lounge: Sprite2D
@export var char2_toilet: Sprite2D
@export var char2_entrance: Sprite2D
@export var char2_equipa: Sprite2D
@export var char2_equipb: Sprite2D
@export var char2_workshop: Sprite2D
@export var char2_props: Sprite2D

@export var freddy_main: Sprite2D
@export var freddy_poobert: Sprite2D
@export var freddy_backstage: Sprite2D
@export var freddy_edit: Sprite2D
@export var freddy_lounge: Sprite2D
@export var freddy_toilet: Sprite2D
@export var freddy_entrance: Sprite2D
@export var freddy_equipa: Sprite2D
@export var freddy_equipb: Sprite2D
@export var freddy_workshop: Sprite2D
@export var freddy_props: Sprite2D

@export var steven_main: Sprite2D
@export var steven_poobert: Sprite2D
@export var steven_backstage: Sprite2D
@export var steven_edit: Sprite2D
@export var steven_lounge: Sprite2D
@export var steven_toilet: Sprite2D
@export var steven_entrance: Sprite2D
@export var steven_equipa: Sprite2D
@export var steven_equipb: Sprite2D
@export var steven_workshop: Sprite2D
@export var steven_props: Sprite2D

var char1_sprites: Dictionary = {}
var char2_sprites: Dictionary = {}
var freddy_sprites: Dictionary = {}
var steven_sprites: Dictionary = {}

func _ready() -> void:
	char1_sprites = {
		"main": char1_main,
		"poobert": char1_poobert,
		"backstage": char1_backstage,
		"edit": char1_edit,
		"lounge": char1_lounge,
		"toilet": char1_toilet,
		"entrance": char1_entrance,
		"equipa": char1_equipa,
		"equipb": char1_equipb,
		"workshop": char1_workshop,
		"props": char1_props
	}
	char2_sprites = {
		"main": char2_main,
		"poobert": char2_poobert,
		"backstage": char2_backstage,
		"edit": char2_edit,
		"lounge": char2_lounge,
		"toilet": char2_toilet,
		"entrance": char2_entrance,
		"equipa": char2_equipa,
		"equipb": char2_equipb,
		"workshop": char2_workshop,
		"props": char2_props
	}
	freddy_sprites = {
		"main": freddy_main,
		"poobert": freddy_poobert,
		"backstage": freddy_backstage,
		"edit": freddy_edit,
		"lounge": freddy_lounge,
		"toilet": freddy_toilet,
		"entrance": freddy_entrance,
		"equipa": freddy_equipa,
		"equipb": freddy_equipb,
		"workshop": freddy_workshop,
		"props": freddy_props
	}
	steven_sprites = {
		"main": steven_main,
		"poobert": steven_poobert,
		"backstage": steven_backstage,
		"edit": steven_edit,
		"lounge": steven_lounge,
		"toilet": steven_toilet,
		"entrance": steven_entrance,
		"equipa": steven_equipa,
		"equipb": steven_equipb,
		"workshop": steven_workshop,
		"props": steven_props
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
