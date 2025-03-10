extends CanvasLayer


func _ready() -> void:
	for puck in $Pucks.get_children():
		puck.hide()
	$AI.hide()
func passJobIntoAI(job: String, number: int):
	var currentPuck = $Pucks.get_child(number)
	currentPuck.adjustMetaData(job)


func showPucks(amount: int):
	var iteration: int = 0
	print(amount)
	for puck in $Pucks.get_children():
		if iteration >= amount:
			break
		iteration += 1
		puck.show()
		print(iteration)

func openAiChat(text: String):
	$AI.startLearnMore(text)
