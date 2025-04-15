extends ThreadPassive

@export var damage := 2


func activate_thread(owner: ThreadUI) -> void:
	var enemies := owner.get_tree().get_nodes_in_group("enemies")
	var damage_effect := DamageEffect.new()
	damage_effect.amount = damage
	damage_effect.execute(enemies)
	
	owner.flash()
