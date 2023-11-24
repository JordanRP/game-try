extends CharacterBody2D

const move_speed = 100
const dash_speed = 400
const dash_duration = 0.2

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var dash = $Dash

#player_stats
var health=100
var defense = 10
var speed_attack=10
var damage= 20
var evasion = 10
var crit_damage=1
var prob_crit= 10
var prob_stun=1

var player_alive=true

func _physics_process(delta):
	var move_direction = get_move_direction() 
	play_animation(move_direction)
	if Input.is_action_just_pressed("dash") && !dash.is_dashing() && dash.can_dash:
		dash.start_dash(dash_duration)
	var speed = dash_speed if dash.is_dashing() else move_speed
	var velocity = move_direction.normalized() * speed * delta
	move_and_collide(velocity)
	
func get_move_direction():
		return Vector2(
		int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")),
		int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
		)
		
func play_animation(move_direction):
	if move_direction == Vector2.ZERO:
		sprite.flip_h = move_direction.x < 0
		animation_player.play("Idle")
	elif !Vector2.ZERO && !dash.is_dashing():
		sprite.flip_h = move_direction.x < 0
		animation_player.play("Walk")
	elif !Vector2.ZERO && dash.is_dashing():
		sprite.flip_h = move_direction.x < 0
		animation_player.play("Dash")
	else:
		pass
	
		
func _on_Hurtbox_area_entered(area: Area2D) -> void:
	if dash.is_dashing(): return
	print("ouch!")


	
