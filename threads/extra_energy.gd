extends ThreadPassive


func activate_thread(owner: ThreadUI) -> void:
	_add_mana(owner)


func _add_mana(owner: ThreadUI) -> void:
	owner.flash()
	var player := owner.get_tree().get_first_node_in_group("player") as Player
	if player:
		player.stats.mana += 1
