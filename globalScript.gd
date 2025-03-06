extends Node


var Questions: Dictionary = {1: "Developing a game"}
var Careers: Dictionary = {"Developing a game": "Game Dev"}
var Clusters: Dictionary = {"Developing a game": "IT"}
var ClusterValues: Dictionary = {"IT": 0}



func getQuestion(number: int):
	return Questions[number]
	
	
func updateCareerCluster(question: String, amount: int):
	changeValue(question, amount)
	
	
func changeValue(question: String, amount: int):
	var newValue = ClusterValues[Clusters[question]] + 2
	ClusterValues[Clusters[question]] = newValue

func test():
	print(Questions)
	print(Careers)
	print(Clusters)
	print(ClusterValues["IT"])
