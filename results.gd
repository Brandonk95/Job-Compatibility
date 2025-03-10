extends CanvasLayer

# Hides all pucks and AI window on start
func _ready() -> void:
	for puck in $Pucks.get_children():
		puck.hide()
	$AI.hide()
	
#Gets puck at number and adjusts metadata for job
func passJobIntoAI(job: String, number: int):
	var currentPuck = $Pucks.get_child(number)
	currentPuck.adjustMetaData(job)

#Hides all pucks
func hidePucks():
	var iteration: int = 0
	$Title.hide()
	for puck in $Pucks.get_children():
		puck.hide()
		
#Shows a certain amount of pucks (max of 6)
func showPucks(amount: int):
	var iteration: int = 0
	for puck in $Pucks.get_children():
		if iteration >= amount:
			break
		iteration += 1
		puck.show()

#hides all pucks passes in the current job title for ai prompting
#shows AI chat
func openAiChat(text: String):
	hidePucks()
	$AI.startLearnMore(text)
	$AI.show()
