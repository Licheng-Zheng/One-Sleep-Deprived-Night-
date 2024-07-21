extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("start")
	timer.start()

func _on_timer_timeout():
	print("are you wokring")
	get_tree().change_scene_to_file("res://Scenes/game_scene1.tscn")
