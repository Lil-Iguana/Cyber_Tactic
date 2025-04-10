extends Card

const VULNERABLE_STATUS = preload("res://statuses/vulnerable.tres")

var base_damage := 4
var vulnerable_duration := 2


func apply_effects(targets: Array[Node], modifiers: ModifierHandler) -> void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = modifiers.get_modified_value(base_damage, Modifier.Type.DMG_DEALT)
	damage_effect.sound = sound
	damage_effect.execute(targets)
	
	var status_effect := StatusEffect.new()
	var vulnerable := VULNERABLE_STATUS.duplicate()
	vulnerable.duration = vulnerable_duration
	status_effect.status = vulnerable
	status_effect.execute(targets)
	
