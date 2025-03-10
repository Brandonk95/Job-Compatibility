extends Node2D

#Gets all the nodes and connects the button clicking to the nextQuestion function
func _ready():
	var questions = $CanvasLayer.get_children()
	for Q in questions:
		Q.connect("nextQuestion", nextQuestion)
		Q.hide()
		#Connect the signals and hide the node
	$CanvasLayer/Q1.show()
	$Results/CanvasLayer.hide()

"""
The next question function takes an index and hides that question
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

#This calls the GLobalScript to get the top cluster values
# GET TOP CLUSTERS RETURNS NOTHING RN CHANGE TO RETURN FOR PRACTICAL USE
func readyResults():
	GlobalScript.getTopClusters()
	$CanvasLayer.hide()
	var jobMatches = GlobalScript.getTopCareers()
	sendResults(jobMatches)
	
	

func sendResults(results: Array):
	var iteration = 0
	for item in results:
		if iteration >= 6:
			break
		$Results/CanvasLayer.passJobIntoAI(item, iteration)
		iteration += 1
	$Results/CanvasLayer.show()
	$Results/CanvasLayer.showPucks(iteration)
