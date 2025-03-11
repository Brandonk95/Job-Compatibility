extends Node
@export var http_request : HTTPRequest
@export var text_response : Label
@export var prompt:String
@export var type:String
var result
var is_generating = false
var response_message
signal startChat(currentResponse: String)

#Loads in basic necessites 
func _ready():
	$ColorRect/JobDescription.text = "Loading A Breif Description..."
	$HTTPRequest.request_completed.connect(_on_http_request_request_completed)
	
#Sets JobName meta data to job input, changes puck title, sends query to llama
func adjustMetaData(job: String):
	set_meta("JobName",job)
	$ColorRect/JobTitle.text = get_meta("JobName")
	send_to_ollama(get_meta("JobName"))

#Sends the message to ollama (my home AI service) creates a prompt for it, allowing context and sends it off on an HTTP request to my API
func send_to_ollama(message):
	message = "Prompt: \n" + prompt + "\n" + type + "\nMessage:" + message

	var url = "https://ollama.brandonspg.com/api/generate" 
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({
		"model": "llama3.2",
		"prompt": message,
		"stream": false
	})
	is_generating = true	
	var error = $HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, body)
	print(error)
	if error != OK:
		print("An error occurred in the HTTP request.")

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
	
			$ColorRect/JobDescription.text = response_message
			print(response_message)
		else:
			print("Failed to parse JSON response.")
	else:
		print("Request failed with response code: ", response_code)
		is_generating = false

#Sends the signal to start learn more chat, passes in the title for prompt
func _on_button_pressed() -> void:
	startChat.emit($ColorRect/JobTitle.text)
