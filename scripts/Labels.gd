extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	if Variables.character_deaths[0] > 1 and Variables.character_level == 0: 
		$FirstHelp.bbcode_text = "[center]Uhm... Maybe get on the platform?[/center]"
	if Variables.character_deaths[1] > 1 and Variables.character_level == 0:
		$SecondHelp.bbcode_text = "[center]You know how to jump... so uh... jump?[/center]"
