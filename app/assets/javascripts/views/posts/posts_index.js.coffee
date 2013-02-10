class Lightoak.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  events:
  	'submit #new_post': 'createPost'

  initialize: ->
  	@collection.on('reset',@render, this)
  	@collection.on('add',@appendPost, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendPost)
  	@

  appendPost: (post) ->
  	view = new Lightoak.Views.Post(model:post)
  	$("#posts").append(view.render().el)

  createPost: (event) ->
  	event.preventDefault()
  	attributes = content: $('#new_post_content').val(), price: $("#new_post_price").val()
  	@collection.create attributes,
  		wait:true
  		success: @handleSuccess
  		error: @handleError
  
  handleSuccess: ->
  handleError: (post,response) ->
  	if response.status == 422
  		errors = $.parseJSON(response.responseText).errors
  		for attribute, messages of errors
  			alert "#{attribute} #{message}" for message in messages
