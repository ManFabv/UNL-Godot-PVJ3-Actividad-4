extends AnimatedSprite


export var weapon_1_tint : Color;
export var weapon_2_tint : Color;
export var weapon_3_tint : Color;

export var first_charge_velocity : float = 5;
export var second_charge_velocity : float = 40;

export var weapon_charge_1_tint : Color;
export var weapon_charge_2_tint : Color;

onready var sprite_material = get_material();
onready var start_charge_timer = $StartSecondChargeTimer

const APPLY_TINT_SHADER_VAR = "apply_tint"
const TINT_COLOR_SHADER_VAR = "tint_color"
const APPLY_CHARGE_SHADER_VAR = "apply_charge"

const CHARGE_COLOR_SHADER_VAR = "charge_color"
const CHARGE_OSCILATION_SHADER_VAR = "charge_oscilation_velocity"


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
		start_charge()
	elif(event.is_action_released("select_weapon_charge")):
		stop_charge()


func _on_StartSecondChargeTimer_timeout():
	set_second_charge_params()
	
	
func start_charge() -> void:
	start_charge_timer.start()
	sprite_material.set_shader_param(APPLY_CHARGE_SHADER_VAR, true)
	set_first_charge_params()
	
	
func stop_charge() -> void:
	start_charge_timer.stop()
	sprite_material.set_shader_param(APPLY_CHARGE_SHADER_VAR, false)
	set_first_charge_params()


func set_first_charge_params() -> void:
	sprite_material.set_shader_param(CHARGE_OSCILATION_SHADER_VAR, first_charge_velocity)
	sprite_material.set_shader_param(CHARGE_COLOR_SHADER_VAR, weapon_charge_1_tint)


func set_second_charge_params() -> void:
	sprite_material.set_shader_param(CHARGE_OSCILATION_SHADER_VAR, second_charge_velocity)
	sprite_material.set_shader_param(CHARGE_COLOR_SHADER_VAR, weapon_charge_2_tint)
