extends Node2D

const dash_delay = 1

@onready var duration_timer = $DurationTimer
var can_dash=true
# Called when the node enters the scene tree for the first time.
func start_dash(duration):
	duration_timer.wait_time= duration
	duration_timer.start()
	end_dash()
	
func is_dashing():
	return !duration_timer.is_stopped()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func end_dash():
	can_dash=false
	await(get_tree().create_timer(dash_delay).timeout)
	can_dash=true

#investrigar como llamar a esta funcion
func _on_DurationTimer_timeout() -> void:
	end_dash()	
