extends Resource

class_name ITEM

@export var ITEM_NAME: String
@export var ITEM_TEXTURE: Texture
@export_multiline var HOVER_TEXT: String
@export var rarity: int

func _get_item_texture():
	return ITEM_TEXTURE

