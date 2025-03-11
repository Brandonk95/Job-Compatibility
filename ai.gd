extends Node
@export var input : TextEdit
@export var http_request : HTTPRequest
@onready var text_response : Label = $ColorRect/response
@export var prompt:String
@export var type:String
var result
var current_response = ""
var response_chunk = ""
var is_generating = false
var job
signal close

#connects to API
func _ready():
	http_request.connect("request_completed", Callable(self, "_on_request_completed"))

#checks if enter key was pressed, if it was then it will send the message
func _physics_process(delta):
	if Input.is_action_just_pressed("enter"):
		send_to_ollama(input.text)
		print("sent: " + input.text)
		input.clear()

#sets the response to the AIs response when learn more is started
func startLearnMore(text: String):
	text_response.text = text
	

#Sends the message to ollama (my home AI service) creates a prompt for it, allowing context and sends it off on an HTTP request to my API
func send_to_ollama(message):
	$ColorRect/response.text = "Loading AI Response..."
	message = "Prompt: \n" + prompt + "\n" + type + "\nusers job context is " + job + "\nMessage:" + message

	var url = "https://ollama.brandonspg.com/api/generate" 
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({
		"model": "llama3.2",
		"prompt": message,
		"stream": false
	})
	is_generating = true	
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	print(error)
	if error != OK:
		print("An error occurred in the HTTP request.")

#when send button is pressed, the message will be sent to ollama
func _on_button_pressed():
	send_to_ollama(input.text)
	print("sent: " + input.text)
	input.clear()

#When the AI request is completed and has a full response, the code will check to make sure there is no error codes, it will then load the resposnse into a JSON, parse it, then change the 'response' label to match the actual AI response
func _on_http_request_request_completed(result, response_code, headers, body):
	print("Response Code: ", response_code)
	if response_code == 200:
		var body_string = body.get_string_from_utf8()
		
		var json_instance = JSON.new()
		var parse_result = json_instance.parse(body_string)
		
		if parse_result == OK:
			var json_response = json_instance.get_data()
			var response_message = json_response.get("response", "No response key")
			text_response.text = response_message
		else:
			print("Failed to parse JSON response.")
	else:
		print("Request failed with response code: ", response_code)
		is_generating = false




#when the learn more button is first used, it tells the AI to introduce itself and do any explanations on the job
func _on_job_puck_start_chat(currentResponse):
	print(currentResponse)
	job = currentResponse
	send_to_ollama(currentResponse + "\nsidenote: please introduce yourself at the beginning but still explain the job")

#sends a setter to another script telling it to close
func _on_close_pressed():
	close.emit()
