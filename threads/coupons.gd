class_name CouponsThread
extends ThreadPassive

@export_range(1, 100) var discount := 50


func initialize_thread(owner: ThreadUI) -> void:
	Events.shop_entered.connect(add_shop_modifier.bind(owner))


func deactivate_thread(_owner: ThreadUI) -> void:
	Events.shop_entered.disconnect(add_shop_modifier)


func add_shop_modifier(shop: Shop, owner: ThreadUI) -> void:
	owner.flash()
	
	var shop_cost_modifier := shop.modifier_handler.get_modifier(Modifier.Type.SHOP_COST)
	assert(shop_cost_modifier, "No shop cost modifier in shop!")
	
	var coupons_modifier_value := shop_cost_modifier.get_value("coupons")
	
	if not coupons_modifier_value:
		coupons_modifier_value = ModifierValue.create_new_modifier("coupons", ModifierValue.Type.PERCENT_BASED)
		coupons_modifier_value.percent_value = -1 * discount / 100.0
		shop_cost_modifier.add_new_value(coupons_modifier_value)
