# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@RoomModule = do ->
	session = undefined
	publisher = undefined
	subscribers = {}
	VIDEO_WIDTH = 320
	VIDEO_HEIGHT = 240
	apiKey = '23302352'
	connect = (token) ->
		session.connect apiKey, token
	startPublishing = ->
	  unless publisher
	    parentDiv = document.getElementById("self_video") #video publisher
	    publisherDiv = document.createElement("div") # Create a div for the publisher to replace
	    publisherDiv.setAttribute "id", "opentok_publisher"
	    parentDiv.appendChild publisherDiv
	    publisherProps =
	      width: VIDEO_WIDTH
	      height: VIDEO_HEIGHT
	    publisher = TB.initPublisher(apiKey, publisherDiv.id, publisherProps) # Pass the replacement div id and properties
	    session.publish publisher
	stopPublishing = ->
	  session.unpublish publisher  if publisher
	  publisher = null
	  	#--------------------------------------
		#  OPENTOK EVENT HANDLERS
		#--------------------------------------
	sessionConnectedHandler = (event) ->
		console.log 'connectd'
		  # Subscribe to the newly created streams
		i = 0
		while i < event.streams.length
		   addStream event.streams[i]
		   i++
		startPublishing()
	streamCreatedHandler = (event) ->
		  # Subscribe to the newly created streams
		i = 0
		while i < event.streams.length
		   addStream event.streams[i]
		   i++
	exceptionHandler = (event) ->
	  alert "Exception: " + event.code + "::" + event.message
	init =  (room_id, token) ->
		TB.addEventListener "exception", exceptionHandler
		console.log "room init: "+room_id
		unless TB.checkSystemRequirements() is TB.HAS_REQUIREMENTS
		  alert "You don't have the minimum requirements to run this application." + "Please upgrade to the latest version of Flash."
		else
		  session = TB.initSession(room_id)
		  session.addEventListener "sessionConnected", sessionConnectedHandler
		  session.addEventListener "streamCreated", streamCreatedHandler
		  connect(token)
	addStream = (stream) ->  
	  # Check if this is the stream that I am publishing, and if so do not publish.
	  return  if stream.connection.connectionId is session.connection.connectionId
	  subscriberDiv = document.createElement("div") # Create a div for the subscriber to replace
	  subscriberDiv.setAttribute "id", stream.streamId # Give the replacement div the id of the stream as its id.
	  document.getElementById("subscribers").appendChild subscriberDiv
	  subscriberProps =
	    width: VIDEO_WIDTH
	    height: VIDEO_HEIGHT
	  subscribers[stream.streamId] = session.subscribe(stream, subscriberDiv.id, subscriberProps)
	init:init
