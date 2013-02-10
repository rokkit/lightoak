class Lightoak.Routers.Posts extends Backbone.Router
	routes:
		'':'index'
		'posts/:id':'show'
	initialize: ->
		@collection = new Lightoak.Collections.Posts()
		@collection.fetch()

	index: ->
		view = new Lightoak.Views.PostsIndex(collection: @collection)
		$('#container').html(view.render().el)
	show: (id) ->
		alert "show"
	