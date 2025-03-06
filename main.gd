extends Node2D


func _on_question_gui_test() -> void:
	$"CanvasLayer/Question Gui".hide()
	GlobalScript.test()
