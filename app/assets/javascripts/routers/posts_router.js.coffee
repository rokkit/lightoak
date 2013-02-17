class Lightoak.Routers.Posts extends Backbone.Router
	routes:
		'':'index'
		'posts/:id':'show'
	initialize: ->
		@collection = new Lightoak.Collections.Posts()

	index: ->
		@collection.fetch()
		view = new Lightoak.Views.PostsIndex(collection: @collection)
		$('#container').html(view.render().el)
	show: (id) ->
		view = new Lightoak.Views.PostsShow(model: @collection.get(id))
		$('#container').html(view.render().el)
