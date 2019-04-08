extends CanvasLayer

func update_score(player, score):
	var score_label = get_node("Banner/HBoxContainer/TextureRect%s/Player%sScore" % [player, player])
	score_label.text = str(score)
	
func game_over(player):
	$Popup.popup_centered()
	$Popup/NinePatchRect/VBoxContainer/Label.text = "Player %s" %player + " Win" 

func _on_Button_pressed():
	get_parent().restart_game()
