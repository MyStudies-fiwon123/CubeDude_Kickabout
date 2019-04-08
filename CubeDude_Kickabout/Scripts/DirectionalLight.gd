extends DirectionalLight

func _ready():
	reset()
	
func goal_scored(goal_id):
	$AnimationPlayer.play("Dim_Light")
	
func reset():
	light_energy = 1