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



func _ready():
	#var scene = scene
	#$JobTitle.text = get_meta("JobName")
	#send_to_ollama(get_meta("JobName"))
	send_to_ollama("cum")
	#add_child(http_request) #Theres an error here pookie
	http_request.connect("request_completed", Callable(self, "_on_request_completed"))
	
func _physics_process(delta):

	if Input.is_action_just_pressed("enter"):
		send_to_ollama(input.text)
		print("sent: " + input.text)
		input.clear()
		
	if is_generating:
		if response_chunk != "":
			current_response += response_chunk
			text_response.text = current_response
			response_chunk = "" 

func startLearnMore(text: String):
	text_response.text = text
	

func add_message(text):
	text_response.append_text(text + "\n")

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
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	print(error)
	if error != OK:
		print("An error occurred in the HTTP request.")


func _on_button_pressed():
	send_to_ollama(input.text)
	print("sent: " + input.text)
	input.clear()


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
