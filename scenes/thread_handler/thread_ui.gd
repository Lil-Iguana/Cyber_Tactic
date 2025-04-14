class_name ThreadUI
extends Control


@export var threads: Threads : set = set_thread

@onready var icon: TextureRect = $Icon
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func set_thread(new_thread: Threads) -> void:
	if not is_node_ready():
		await ready
	
	threads = new_thread
	icon.texture = threads.icon


func flash() -> void:
	animation_player.play("flash")


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		print("Thread tooltip")
