class Lightoak.Views.Post extends Backbone.View

  template: JST['posts/post']
  tagName: 'div'

  events:
  	'click':'showPost'
  initialize: ->
  			@model.bind('change', @render, this)

  render: ->
  	$(@el).html(@template(post: @model))
  	@

  showPost: ->
  	Backbone.history.navigate("posts/#{@model.get('id')}",true)