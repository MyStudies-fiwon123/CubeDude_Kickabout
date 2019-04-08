extends Spatial

onready var Ball = get_tree().get_root().find_node("Ball", true, false)

var Player1_score = 0
var Player2_score = 0

export var maximum_score = 5

func _ready():
	reset_pitch()
	
func reset_pitch():
	var BallSpawn = get_tree().get_root().find_node("BallSpawn", true, false)
	Ball.translation = BallSpawn.translation
	Ball.axis_lock_linear_x = false
	Ball.axis_lock_linear_y = false
	Ball.axis_lock_linear_z = false
	get_tree().call_group("celebrant", "reset")

func _on_GoalDetection_body_entered(body, goal_id):
	Ball.axis_lock_linear_x = true
	Ball.axis_lock_linear_y = true
	Ball.axis_lock_linear_z = true
	get_tree().call_group("celebrant", "goal_scored", goal_id)
	
	update_score(goal_id)
	$Timer.start()
	if not $Airhom.playing:
		$Airhom.play()
	


func _on_Timer_timeout():
	reset_pitch()
	
func update_score(goal_id):
	var new_score
	var player
	
	if goal_id == 2:
		player = 1
		Player1_score += 1
		new_score = Player1_score
	else:
		player = 2
		Player2_score += 1
		new_score = Player2_score
		
	$GUI.update_score(player, new_score)
	check_game_over(player, new_score)

func check_game_over(player, score):
	if score == maximum_score:
		$Timer.queue_free()
		$GUI.game_over(player)
	
func restart_game():
	get_tree().reload_current_scene()