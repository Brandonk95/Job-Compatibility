extends Node2D


func _ready():
	var questions = $CanvasLayer.get_children()
	for Q in questions:
		Q.connect("nextQuestion", nextQuestion)
		Q.hide()
		#Connect the signals and hide the node
	$CanvasLayer/Q1.show()

"""
The newx question function takes an index and hides that question
and shows the next question

The reason it subtracts 1 from the index is becasue the question passes
its question number in which is 1 more than its actual index in the tree
"""
func nextQuestion(index: int):
	var node = $CanvasLayer.get_child(index - 1)
	if index == 65:
		node.hide()
		readyResults()
		return
	var newNode = $CanvasLayer.get_child(index)
	node.hide()
	newNode.show()

func readyResults():
	GlobalScript.getTopClusters()
