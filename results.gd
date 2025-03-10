extends CanvasLayer


func _ready() -> void:
	for puck in $Pucks.get_children():
		puck.hide()
	$AI.hide()
func passJobIntoAI(job: String, number: int):
	var currentPuck = $Pucks.get_child(number)
	currentPuck.adjustMetaData(job)

func hidePucks():
	var iteration: int = 0
	$Title.hide()
	for puck in $Pucks.get_children():
		puck.hide()
func showPucks(amount: int):
	var iteration: int = 0
	for puck in $Pucks.get_children():
		if iteration >= amount:
			break
		iteration += 1
		puck.show()

func openAiChat(text: String):
	hidePucks()
	$AI.startLearnMore(text)
	$AI.show()
