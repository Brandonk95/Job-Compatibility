extends Node2D

#Gets all the nodes and connects the button clicking to the nextQuestion function
func _ready():
	var questions = $Questions.get_children() #get all questions in array
	for Q in questions: # Iterate over questions
		#Connect the nextQuestion signal to appropriate function
		Q.connect("nextQuestion", nextQuestion) 
		Q.hide() #Hide question
	$Numbers.text = "1/30" #Set text to first question
	
	$Results/CanvasLayer.hide() #hide results page

"""
The nextQuestion takes in a question node "theNode" as input, hides it then 
shows the next question and adjusts the question counter

If the question is the last question it hides that question and readys the
results
"""
func nextQuestion(theNode):
	var index = theNode.get_index() #get index of node in relation to parent
	var allChildren = $Questions.get_children()
	#get amt of question to determine the total amount of questions
	var finalIndex = allChildren.size() 
	#change question counter
	$Numbers.text = str(index + 1) + "/" + str(finalIndex - 1) 
	
	#If its the last question hide it and ready results
	if index >= finalIndex - 1:
		theNode.hide()
		readyResults()
		return
	# gets the next question node 
	var newNode = $Questions.get_child(index + 1)
	
	# Hides current question and shows next question 
	theNode.hide()
	newNode.show()

#Readys and sends results
func readyResults():
	GlobalScript.getTopClusters() #tells GlobalScript to sort top clusters
	$Questions.hide() # hide all questions
	var jobMatches = GlobalScript.getTopCareers() # get the top careers
	sendResults(jobMatches) #Send the results for further use
	
	

#Takes array results and iterates over it to pass into pucks & AI
func sendResults(results: Array):
	var iteration = 0 #set iteration variable
	for item in results: #iterate over items in results array
		if iteration >= 6: #Since there are only 6 pucks stop at 6
			break
		$Results/CanvasLayer.passJobIntoAI(item, iteration) #Passes job into AI
		iteration += 1 
	$Results/CanvasLayer.show()
	#Show results and show amount of pucks depending on iteration
	$Results/CanvasLayer.showPucks(iteration)


func _on_main_menu_start() -> void:
	nextQuestion($Questions/Q1) #starts the first question
