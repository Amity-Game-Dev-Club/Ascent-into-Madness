extends Node2D



func _on_button_2_pressed():get_tree().quit()


#Make sure its going to the right place. ive had to fix this like 3 times 
func _on_button_pressed(): get_tree().change_scene_to_file("res://Home Screen JACK/quit_waffling.tscn")



func _on_button_3_pressed():  get_tree().change_scene_to_file("res://Home Screen JACK/settings.tscn")

