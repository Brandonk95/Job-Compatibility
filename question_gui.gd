extends Control

@export var questionNumber: int = 1
var question: String = ""
signal nextQuestion(index: int)
func _ready() -> void:
	question = GlobalScript.getQuestion(questionNumber)
	$Question.text = question

func pushValueGlobal(amount: int):
	GlobalScript.updateCareerCluster(question, amount)
	nextQuestion.emit(questionNumber)


func _on_love_pressed() -> void:
	pushValueGlobal(2)


func _on_like_pressed() -> void:
	pushValueGlobal(1)


func _on_unsure_pressed() -> void:
	pushValueGlobal(0)


func _on_dislike_pressed() -> void:
	pushValueGlobal(-1)


func _on_hate_pressed() -> void:
	pushValueGlobal(-2)
