extends Node
@export var http_request : HTTPRequest
@export var text_response : Label
@export var prompt:String
@export var type:String
var result
var current_response = ""
var response_chunk = ""
var is_generating = false
var response_message


func _ready():
	$JobDescription.text = "Loading A Breif Description..."
	$JobTitle.text = get_meta("JobName")
	#send_to_ollama(get_meta("JobName"))
	send_to_ollama(get_meta("JobName"))
	#add_child(http_request) #Theres an error here pookie
	$HTTPRequest.request_completed.connect(_on_http_request_request_completed)
	
func _physics_process(delta):
	pass
	

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


func _on_http_request_request_completed(result, response_code, headers, body):
	print("Response Code: ", response_code)
	if response_code == 200:
		var body_string = body.get_string_from_utf8()
		
		var json_instance = JSON.new()
		var parse_result = json_instance.parse(body_string)
		
		if parse_result == OK:
			var json_response = json_instance.get_data()
			var response_message = json_response.get("response", "No response key")
	
			$JobDescription.text = response_message
			print(response_message)
		else:
			print("Failed to parse JSON response.")
	else:
		print("Request failed with response code: ", response_code)
		is_generating = false
