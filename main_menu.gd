extends Node2D

signal start
#pause everything until the quiz is started
func _ready() -> void:
	get_tree().paused = true
	
#hide start screen and show the directions
func _on_button_pressed() -> void:
	$StartScreen.hide()
	$Directions.show()
	


#hide the directions and begin the quiz
func _on_start_pressed() -> void:
	$Directions.hide()
	get_tree().paused = false
	start.emit()

#hide start screen and show credits
func _on_credits_pressed() -> void:
	$StartScreen.hide()
	$Credits.show()

#show start screen and hide credits
func _on_back_pressed() -> void:
	$StartScreen.show()
	$Credits.hide()
