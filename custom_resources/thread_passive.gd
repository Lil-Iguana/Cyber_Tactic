class_name ThreadPassive
extends Resource

enum Type {START_OF_TURN, START_OF_COMBAT, END_OF_TURN, END_OF_COMBAT, EVENT_BASED}
enum CharacterType {ALL, ASSASSIN, WARRIOR, WIZARD}

@export var thread_name: String
@export var id: String
@export var type: Type
@export var character_type: CharacterType
@export var starter_thread: bool = false
@export var icon: Texture
@export_multiline var tooltip: String
