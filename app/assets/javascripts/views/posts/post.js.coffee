class Lightoak.Views.Post extends Backbone.View

  template: JST['posts/post']
  tagName: 'li'

  events:
  	'click':'showPost'

  render: ->
  	$(@el).html(@template(post: @model))
  	@

  showPost: ->
  	Backbone.history.navigate("posts/#{@model.get('id')}",true)