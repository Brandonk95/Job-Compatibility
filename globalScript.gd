extends Node

"""
These are the 4 things the entire program functions on here i will explain what they do
and how to add new things

Questions: These are the questions actually asked
	- the key is the question number and the value is the question
	- when you add something new you start here
	- When you add a question make sure you have the following
		- The job it coralates to (make sure it dosent conflict with one present)
		- The career cluster it will be apart (same as above)

Careers: This holds the question and its coralating job
	- The key is the question and the value is the job
	- When adding something make sure its not conflicting
	
Clusters: This holds the clusters relating to the question for point counting
	- The key is the question and value is the cluster
	
ClusterValues: These hold the cluster and their point value (default 0)
	- The key is the career cluster and the value is its point value
"""
var Questions: Dictionary = {1: "Developing a game", 2: "Building a house"}
var Careers: Dictionary = {"Developing a game": "Game Dev", "Building a house": "Construction"}
var Clusters: Dictionary = {"Developing a game": "CS", "Building a house": "Technical Skills"}
var ClusterValues: Dictionary = {"CS": 0, "Technical Skills": 0}


# Simply returns the question with the number provided for display and storage
func getQuestion(number: int):
	return Questions[number]
	

#Updates the career cluster value by calliing change value
func updateCareerCluster(question: String, amount: int):
	changeValue(question, amount)
	
	
#changes the value in ClusterValues by the paramater "amount"
func changeValue(question: String, amount: int):
	var newValue = ClusterValues[Clusters[question]] + amount
	ClusterValues[Clusters[question]] = newValue
