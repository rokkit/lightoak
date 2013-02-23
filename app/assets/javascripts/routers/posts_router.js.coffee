class Lightoak.Routers.Posts extends Backbone.Router
	routes:
		'':'index'
		'posts/:id':'show'
	initialize: ->
		console.log "router init"

	index: ->
		collection = new Lightoak.Collections.Posts()
<<<<<<< HEAD
		collection.fetch()
=======
		#collection.pager()
		#collection.fetch()
		console.log collection
>>>>>>> backend
		view = new Lightoak.Views.PostsIndex(collection: collection)
		$('#container').html(view.render().el)
	show: (id) ->
		post = new Lightoak.Models.Post({id:id})
		post.fetch
			wait:true
			success: @showPost
<<<<<<< HEAD

	showPost: (model, response) ->
		view = new Lightoak.Views.PostsShow(model: model)
		$('#container').html(view.render().el)
=======
		console.log post

	showPost: (model, response) ->
		view = new Lightoak.Views.PostsShow(model: model)
		$('#container').html(view.render().el)
>>>>>>> backend
