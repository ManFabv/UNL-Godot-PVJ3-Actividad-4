extends AnimatedSprite


export var weapon_1_tint : Color;
export var weapon_2_tint : Color;
export var weapon_3_tint : Color;

onready var sprite_material = get_material();


func _input(event):
	if(event.is_action_pressed("select_weapon_1")):
		sprite_material.set_shader_param("apply_tint", true)
		sprite_material.set_shader_param("tint_color", weapon_1_tint)
	elif(event.is_action_pressed("select_weapon_2")):
		sprite_material.set_shader_param("apply_tint", true)
		sprite_material.set_shader_param("tint_color", weapon_2_tint)
	elif(event.is_action_pressed("select_weapon_3")):
		sprite_material.set_shader_param("apply_tint", true)
		sprite_material.set_shader_param("tint_color", weapon_3_tint)
	elif(event.is_action_pressed("select_weapon_default")):
		sprite_material.set_shader_param("apply_tint", false)
	
	if(event.is_action_pressed("select_weapon_charge")):
		print("space pressed")
	elif(event.is_action_released("select_weapon_charge")):
		print("space released")
