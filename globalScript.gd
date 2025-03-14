extends Node



"""
These are the 4 things the entire algorithm functions on here i will explain what they do
and how to add new things

Questions: These are the questions actually asked
	- the key is the question number and the value is the question
		- Originally iplemented this way because we didnt orignally plan
		on randomizing the questions a list would be more efficient now
	- when you add a new question you start here
	- When you add a question make sure you have the following
		- The job it coralates to (make sure it dosent conflict with one present)
		- The career cluster it will be apart (same as above)
	- ex: 1 : "blah blah blah"

Careers: This holds the question and its coralating job
	- The key is the question and the value is the job
	- When adding something make sure its not conflicting
	- ex: Creating a video game: Game Developer
	
Clusters: This holds the clusters relating to the question for point counting
	- The key is the question and value is the cluster
	- This is used to keep track of the cluster associated with the 
	question
	- ex: "Acting in a play" : The arts
	
ClusterValues: These hold the cluster and their point value (default 0)
	- The key is the career cluster and the value is its point value
	- ex: "Information Technology" : 0
"""
var Questions: Dictionary = {1: 'Creating and managing science education programs for communities', 2: 'Configuring and maintaining software applications', 3: 'Designing and implementing network security systems', 4: 'Developing a game', 5: 'Fixing computer problems for your family', 6: 'Creating and managing cloud-based data storage solutions', 7: "Managing a farm's crop rotation and soil quality", 8: 'Conducting animal health checks and developing vaccination plans', 9: 'Designing and implementing irrigation systems for crops', 10: 'Developing sustainable farming practices using permaculture techniques', 11: 'Developing sustainable farming practices using Agricultural techniques', 12: 'Designing energy-efficient building systems for commercial spaces', 13: 'Coordinating construction schedules and budgets for large projects', 14: 'Selecting and specifying materials for building renovations', 15: 'Conducting site surveys to identify potential design flaws', 16: 'Developing and implementing accessibility standards in buildings', 17: 'Editing and color-correcting footage for film or television productions', 18: 'Designing graphic elements for advertising campaigns', 19: 'Producing live events such as concerts or theater performances', 20: 'Acting in a school play', 21: 'Mixing and mastering audio tracks for music releases', 22: 'Developing strategic plans for company growth and expansion', 23: 'Managing budgets and financial reports for a medium-sized business', 24: 'Coordinating employee onboarding and training programs', 25: 'Conducting market research to inform product development', 26: 'Creating and implementing performance metrics to measure business success', 27: 'Designing lesson plans for adult education classes', 28: 'Developing curricula for special needs students', 29: 'Teaching a class of small children', 30: 'Teaching more advanced topics to high schoolers', 31: 'Creating and delivering training sessions on industry-specific skills', 32: 'Analyzing financial data to inform investment decisions', 33: 'Developing and implementing budgeting systems for small businesses', 34: 'Conducting credit analysis for potential clients or partners', 35: 'Evaluating the financial impact of new business ventures', 36: 'Creating and managing investment portfolios for individuals or companies', 37: 'Developing and implementing treatment plans for patients', 38: 'Conducting medical research to inform treatment options', 39: 'Evaluating the effectiveness of new medical devices or treatments', 40: 'Coordinating patient care services in hospitals or clinics', 41: 'Creating and managing health education programs for communities', 42: 'Developing and implementing policy initiatives to address social issues', 43: 'Conducting research on emerging trends in government agencies', 44: 'Evaluating the effectiveness of public programs or services', 45: 'Spending your day reviewing and resolving disputes or cases between people', 46: 'Leading a major group or country', 47: 'Developing and implementing employee training programs', 48: 'Conducting performance evaluations for employees', 49: 'Evaluating the effectiveness of workplace safety protocols', 50: 'Coordinating employee benefits and compensation packages', 51: 'Creating and managing diversity and inclusion initiatives in the workplace', 52: 'Developing and implementing marketing campaigns for new products or services', 53: 'Conducting deep market research to inform product development', 54: 'Evaluating the effectiveness of advertising efforts', 55: 'Coordinating social media content and engagement initiatives', 56: 'Creating and managing public relations strategies for small businesses', 57: 'Developing and implementing sales strategies to meet customer needs', 58: 'Conducting product demonstrations or trials for potential clients', 59: 'Evaluating the effectiveness of sales teams or territory performance', 60: 'Coordinating customer service and support initiatives', 61: 'Creating and managing sales proposals for new business opportunities', 62: 'Conducting research on emerging trends in scientific fields', 63: 'Developing and implementing experiments to test hypotheses', 64: 'Evaluating the effectiveness of scientific equipment or devices', 65: 'Coordinating fieldwork operations for environmental research projects'}

var Careers: Dictionary = {"Configuring and maintaining software applications": "Software Engineer", "Designing and implementing network security systems": "Network Security Architect", "Developing a game": "Game Developer", "Fixing computer problems for your family": "IT Technician", "Creating and managing cloud-based data storage solutions": "Cloud Solutions Engineer", "Managing a farm's crop rotation and soil quality": "Agronomist", "Conducting animal health checks and developing vaccination plans": "Veterinarian", "Designing and implementing irrigation systems for crops": "Irrigation Specialist", "Developing sustainable farming practices using permaculture techniques": "Sustainable Farm Manager", "Developing sustainable farming practices using Agricultural techniques": "Agricultural Economist", "Designing energy-efficient building systems for commercial spaces": "Building Services Engineer", "Coordinating construction schedules and budgets for large projects": "Project Manager (Construction)", "Selecting and specifying materials for building renovations": "Materials Specialist", "Conducting site surveys to identify potential design flaws": "Site Surveyor", "Developing and implementing accessibility standards in buildings": "Accessibility Consultant", "Editing and color-correcting footage for film or television productions": "Video Editor", "Designing graphic elements for advertising campaigns": "Graphic Designer", "Producing live events such as concerts or theater performances": "Event Producer", "Acting in a school play": "Actor", "Mixing and mastering audio tracks for music releases": "Music Mixer", "Developing strategic plans for company growth and expansion": "Strategic Planning Manager", "Managing budgets and financial reports for a medium-sized business": "Financial Controller", "Coordinating employee onboarding and training programs": "HR Generalist", "Conducting market research to inform product development": "Market Research Analyst", "Creating and implementing performance metrics to measure business success": "Performance Metrics Analyst", "Designing lesson plans for adult education classes": "Curriculum Developer", "Developing curricula for special needs students": "Special Education Teacher", "Teaching a class of small children": "Elementary Teacher", "Teaching more advanced topics to high schoolers": "High School Teacher", "Creating and delivering training sessions on industry-specific skills": "Training Manager", "Analyzing financial data to inform investment decisions": "Financial Analyst", "Developing and implementing budgeting systems for small businesses": "Accountant", "Conducting credit analysis for potential clients or partners": "Credit Specialist", "Evaluating the financial impact of new business ventures": "Financial Consultant", "Creating and managing investment portfolios for individuals or companies": "Portfolio Manager", "Developing and implementing treatment plans for patients": "Physician Assistant", "Conducting medical research to inform treatment options": "Research Scientist", "Evaluating the effectiveness of new medical devices or treatments": "Clinical Trials Coordinator", "Coordinating patient care services in hospitals or clinics": "Nurse Manager", "Creating and managing health education programs for communities": "Health Educator", "Developing and implementing policy initiatives to address social issues": "Policy Analyst", "Conducting research on emerging trends in government agencies": "Research Associate (Government)", "Evaluating the effectiveness of public programs or services": "Program Evaluator", "Spending your day reviewing and resolving disputes or cases between people": "Judge", "Leading a major group or country": "President", "Developing and implementing employee training programs": "HR Trainer", "Conducting performance evaluations for employees": "Performance Manager", "Evaluating the effectiveness of workplace safety protocols": "Safety Specialist", "Coordinating employee benefits and compensation packages": "Benefits Administrator", "Creating and managing diversity and inclusion initiatives in the workplace": "Diversity and Inclusion Specialist", "Developing and implementing marketing campaigns for new products or services": "Marketing Manager", "Conducting deep market research to inform product development": "Advanced Market Research Analyst", "Evaluating the effectiveness of advertising efforts": "Advertising Specialist", "Coordinating social media content and engagement initiatives": "Social Media Coordinator", "Creating and managing public relations strategies for small businesses": "Public Relations Manager", "Developing and implementing sales strategies to meet customer needs": "Sales Manager", "Conducting product demonstrations or trials for potential clients": "Sales Representative", "Evaluating the effectiveness of sales teams or territory performance": "Territory Manager", "Coordinating customer service and support initiatives": "Customer Service Manager", "Creating and managing sales proposals for new business opportunities": "Sales Consultant", "Conducting research on emerging trends in scientific fields": "Research Scientist", "Developing and implementing experiments to test hypotheses": "Laboratory Technician", "Evaluating the effectiveness of scientific equipment or devices": "Quality Control Specialist", "Coordinating fieldwork operations for environmental research projects": "Field Technician", "Creating and managing science education programs for communities": "Science Educator" }

var Clusters: Dictionary = {"Configuring and maintaining software applications": "Information Technology", "Designing and implementing network security systems": "Information Technology", "Developing a game": "Information Technology", "Fixing computer problems for your family": "Information Technology", "Creating and managing cloud-based data storage solutions": "Information Technology","Managing a farm's crop rotation and soil quality": "Agriculture, Food, And Natural Resources", "Conducting animal health checks and developing vaccination plans": "Agriculture, Food, And Natural Resources", "Designing and implementing irrigation systems for crops": "Agriculture, Food, And Natural Resources", "Developing sustainable farming practices using permaculture techniques": "Agriculture, Food, And Natural Resources", "Developing sustainable farming practices using Agricultural techniques": "Agriculture, Food, And Natural Resources","Designing energy-efficient building systems for commercial spaces": "Architecture and Construction", "Coordinating construction schedules and budgets for large projects": "Architecture and Construction", "Selecting and specifying materials for building renovations": "Architecture and Construction", "Conducting site surveys to identify potential design flaws": "Architecture and Construction", "Developing and implementing accessibility standards in buildings": "Architecture and Construction","Editing and color-correcting footage for film or television productions": "Arts, Audio/Visual Tech, and Communications", "Designing graphic elements for advertising campaigns": "Arts, Audio/Visual Tech, and Communications", "Producing live events such as concerts or theater performances": "Arts, Audio/Visual Tech, and Communications", "Acting in a school play": "Arts, Audio/Visual Tech, and Communications", "Mixing and mastering audio tracks for music releases": "Arts, Audio/Visual Tech, and Communications","Developing strategic plans for company growth and expansion": "Business Management and Administration", "Managing budgets and financial reports for a medium-sized business": "Business Management and Administration", "Coordinating employee onboarding and training programs": "Business Management and Administration", "Conducting market research to inform product development": "Business Management and Administration", "Creating and implementing performance metrics to measure business success": "Business Management and Administration","Designing lesson plans for adult education classes": "Education and Training", "Developing curricula for special needs students": "Education and Training", "Teaching a class of small children": "Education and Training", "Teaching more advanced topics to high schoolers": "Education and Training", "Creating and delivering training sessions on industry-specific skills": "Education and Training","Analyzing financial data to inform investment decisions": "Finance", "Developing and implementing budgeting systems for small businesses": "Finance", "Conducting credit analysis for potential clients or partners": "Finance", "Evaluating the financial impact of new business ventures": "Finance", "Creating and managing investment portfolios for individuals or companies": "Finance","Developing and implementing treatment plans for patients": "Healthcare", "Conducting medical research to inform treatment options": "Healthcare", "Evaluating the effectiveness of new medical devices or treatments": "Healthcare", "Coordinating patient care services in hospitals or clinics": "Healthcare", "Creating and managing health education programs for communities": "Healthcare","Developing and implementing policy initiatives to address social issues": "Government", "Conducting research on emerging trends in government agencies": "Government", "Evaluating the effectiveness of public programs or services": "Government", "Spending your day reviewing and resolving disputes or cases between people": "Government", "Leading a major group or country": "Government","Developing and implementing employee training programs": "Human Resources", "Conducting performance evaluations for employees": "Human Resources", "Evaluating the effectiveness of workplace safety protocols": "Human Resources", "Coordinating employee benefits and compensation packages": "Human Resources", "Creating and managing diversity and inclusion initiatives in the workplace": "Human Resources","Developing and implementing marketing campaigns for new products or services": "Marketing", "Conducting deep market research to inform product development": "Marketing", "Evaluating the effectiveness of advertising efforts": "Marketing", "Coordinating social media content and engagement initiatives": "Marketing", "Creating and managing public relations strategies for small businesses": "Marketing","Developing and implementing sales strategies to meet customer needs": "Sales", "Conducting product demonstrations or trials for potential clients": "Sales", "Evaluating the effectiveness of sales teams or territory performance": "Sales", "Coordinating customer service and support initiatives": "Sales", "Creating and managing sales proposals for new business opportunities": "Sales","Conducting research on emerging trends in scientific fields": "Science", "Developing and implementing experiments to test hypotheses": "Science", "Evaluating the effectiveness of scientific equipment or devices": "Science", "Coordinating fieldwork operations for environmental research projects": "Science", "Creating and managing science education programs for communities": "Science"}

var ClusterValues: Dictionary = {"Information Technology": 0, "Agriculture, Food, And Natural Resources": 0,"Architecture and Construction": 0, "Arts, Audio/Visual Tech, and Communications": 0,"Business Management and Administration": 0, "Education and Training": 0,"Finance": 0, "Healthcare": 0,"Government": 0, "Human Resources": 0,"Marketing": 0, "Sales": 0,"Science": 0}


"""
This array holds the questions that the user "Loves" for comparison to the 
cluster values later to deterimine the recommended jobs

"""
var possibleCareerQuestions: Array = []


"""
Upon completion of the quiz the ClusterValues are sorted least to greatest
then thee Clusters that each possibleCarreerQuestion is apart of is checked to
see if it is in that list if so then the associated job is stored here
"""
var topCareers: Array = []

"""
This holds the top pairs after being sorted in the format
Key":"Value 
ex: Information Technology:2
"""
var theTopPairs: Array = []

"""
This holds the name of the top clusters for use when determining
topCareers
"""
var theTopClusters: Array = []

"""
This holds the usable indexes for question randomization
"""
var usableIndexes: Array = []


#Readys the usableIndexes Array with indices
func _ready() -> void:
	for i in range(Questions.size()):
		usableIndexes.append(i + 1)

#This function returns a random question from the question bank
func getQuestion():
	# Get the random number based on usableIndexes size
	var randomNumber = randi_range(0, usableIndexes.size())
	# get the index going to be used
	# subtract 1 because godots .size function dosent start at 0
	var theNumber = usableIndexes[randomNumber - 1]
	
	# get the corosponding random question 
	var theQuestion = Questions[theNumber]
	
	# erases the index from usable Indexes to prevent repeats
	usableIndexes.erase(theNumber)
	# does the same for Questions just in case 
	Questions.erase(theNumber)
	
	
	return theQuestion # return the question
	
	
# Returns the length of the dictionary Questions
func getLengthQuestions():
	return Questions.size()


#Updates the career cluster value by calliing change value
func updateCareerCluster(question: String, amount: int):
	changeValue(question, amount)
	
	
#changes the value in ClusterValues by the paramater "amount"
func changeValue(question: String, amount: int):
	var newValue = ClusterValues[Clusters[question]] + amount
	ClusterValues[Clusters[question]] = newValue

# This takes the cluster values and sorts them
func getTopClusters():
	var keys = ClusterValues.keys() #Get ClusterValues keys
	var values = ClusterValues.values()#Get ClusterValues values
	
	var keyValuePairs = []
	var topPairs = []
	for i in range(keys.size()):
		#Store the pairs of keys and values in Arrays then appends them to
		#the keyValuePairs array
		
		keyValuePairs.append([keys[i], values[i]])
	keyValuePairs.sort_custom(func(a, b):
		"""
		This function compares 2 elements based on their second element
		which coresponds to the value from the dictonary
		
		Sorts in ascending order
		"""
		return a[1] - b[1]
	)
	
	var sorted = {}
	for pair in keyValuePairs:
		sorted[pair[0]] = pair[1]
		# Creates the dictonary so now we have a sorted dictionary
		
	# Grabs the last 3 elements because its sorted in ascending order
	var top_3 = keyValuePairs.slice(10,13) 
	
	
	for pair in top_3:
		# gives theTopClusters, and topPairs their appropriate values see
		# documentation above
		theTopClusters.append(str(pair[0]))
		topPairs.append(str(pair[0]) + ':' + str(pair[1]))
	
	topPairs.reverse() # reverses topPairs so its in ascending order
	theTopPairs = topPairs # assigns theTopPairs variable
	assignTopCareers()
	return topPairs

# Adds question that was loved to possibleCareerQuestions
func addJobResult(question: String):
	possibleCareerQuestions.append(question)
	
func assignTopCareers():
	"""
	Iterates over ever question in possibleCareerQuestions pulling its
	appropriate job cluster and checking to see if it's in the top clusters
	if it is it appends it to topCareers
	"""
	for Question in possibleCareerQuestions:
		var jobCluster = Clusters[Question]
		if jobCluster in theTopClusters:
			topCareers.append(Careers[Question])
		
# Returns topCareers array
func getTopCareers():
	return topCareers
