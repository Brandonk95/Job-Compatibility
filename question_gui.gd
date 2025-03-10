extends Control


var question: String = ""
signal nextQuestion(index: int)

#Calls global script to get question, then sets the label text
func _ready() -> void:
	question = GlobalScript.getQuestion()
	$Question.text = question

# Sends the value associated with a certain button to the global script
# Then emits itself to nextQuestion function for further use
func pushValueGlobal(amount: int):
	GlobalScript.updateCareerCluster(question, amount)
	nextQuestion.emit(self)

#Adds job results as result of Love being pressed
#adds 2 to cluster value
func _on_love_pressed() -> void:
	GlobalScript.addJobResult(question)
	pushValueGlobal(2)
	

#adds 1 to cluster value
func _on_like_pressed() -> void:
	pushValueGlobal(1)

#adds nothing to cluster value
func _on_unsure_pressed() -> void:
	pushValueGlobal(0)

#subtractes 1 from cluster value
func _on_dislike_pressed() -> void:
	pushValueGlobal(-1)

#subtractes 2 from cluster value
func _on_hate_pressed() -> void:
	pushValueGlobal(-2)
