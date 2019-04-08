extends SpotLight

func _ready():
	hide()
	
func goal_scored(goal_id):
	var Player1 = get_parent().get_parent().find_node("Player1")
	var Player2 = get_parent().get_parent().find_node("Player2")
	var target
	
	if goal_id != 1:
		target = Player1.translation
	else:
		target = Player2.translation
	
	look_at(target, Vector3(0, 1, 0))
	show()
	
func reset():
	hide()
