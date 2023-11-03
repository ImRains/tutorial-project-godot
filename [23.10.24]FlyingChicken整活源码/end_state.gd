extends Control


func _on_restart_button_down() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://home.tscn")
	pass # Replace with function body.
