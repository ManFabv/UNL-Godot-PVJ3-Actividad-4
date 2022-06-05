extends AnimatedSprite


export var weapon_1_tint : Color;
export var weapon_2_tint : Color;
export var weapon_3_tint : Color;

onready var sprite_material = get_material();

const APPLY_TINT_SHADER_VAR = "apply_tint"
const TINT_COLOR_SHADER_VAR = "tint_color"
const APPLY_CHARGE_SHADER_VAR = "apply_charge"


func _input(event):
	if(event.is_action_pressed("select_weapon_1")):
		sprite_material.set_shader_param(APPLY_TINT_SHADER_VAR, true)
		sprite_material.set_shader_param(TINT_COLOR_SHADER_VAR, weapon_1_tint)
	elif(event.is_action_pressed("select_weapon_2")):
		sprite_material.set_shader_param(APPLY_TINT_SHADER_VAR, true)
		sprite_material.set_shader_param(TINT_COLOR_SHADER_VAR, weapon_2_tint)
	elif(event.is_action_pressed("select_weapon_3")):
		sprite_material.set_shader_param(APPLY_TINT_SHADER_VAR, true)
		sprite_material.set_shader_param(TINT_COLOR_SHADER_VAR, weapon_3_tint)
	elif(event.is_action_pressed("select_weapon_default")):
		sprite_material.set_shader_param(APPLY_TINT_SHADER_VAR, false)
	
	if(event.is_action_pressed("select_weapon_charge")):
		sprite_material.set_shader_param(APPLY_CHARGE_SHADER_VAR, true)
	elif(event.is_action_released("select_weapon_charge")):
		sprite_material.set_shader_param(APPLY_CHARGE_SHADER_VAR, false)
