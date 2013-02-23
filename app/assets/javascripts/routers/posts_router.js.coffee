class Lightoak.Routers.Posts extends Backbone.Router
	routes:
		'':'index'
		'posts/:id':'show'
	initialize: ->
		console.log "router init"

	index: ->
		collection = new Lightoak.Collections.Posts()
		collection.fetch()
		view = new Lightoak.Views.PostsIndex(collection: collection)
		$('#container').html(view.render().el)
	show: (id) ->
		post = new Lightoak.Models.Post({id:id})
		post.fetch
			wait:true
			success: @showPost

	showPost: (model, response) ->
		view = new Lightoak.Views.PostsShow(model: model)
		$('#container').html(view.render().el)