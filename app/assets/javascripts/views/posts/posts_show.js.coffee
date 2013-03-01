class Lightoak.Views.PostsShow extends Backbone.View
  template: JST['posts/show']

  render: ->
  	$(@el).html(@template(post:@model))
  	@