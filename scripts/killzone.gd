extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	Variables.character_deaths[Variables.character_level] += 1
	print(Variables.character_deaths)
	timer.start()
	
func _on_timer_timeout():
	get_tree().reload_current_scene()
