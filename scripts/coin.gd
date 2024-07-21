extends Area2D

var levels = ['res://Scenes/level_1.tscn']

func _on_body_entered(body):
	queue_free()
	get_tree().change_scene_to_file(levels[Variables.character_level])
	Variables.character_level += 1
