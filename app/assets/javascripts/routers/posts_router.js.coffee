class Lightoak.Routers.Posts extends Backbone.Router
	routes:
		'':'index'
		'posts/:id':'show'
	initialize: ->
		console.log "router init"

	index: ->
		collection = new Lightoak.Collections.Posts()
		#collection.pager()
		#collection.fetch()
		console.log collection
		view = new Lightoak.Views.PostsIndex(collection: collection)
		$('#posts_block').html(view.render().el)
	show: (id) ->
		post = new Lightoak.Models.Post({id:id})
		post.fetch
			wait:true
			success: @showPost
		console.log post

	showPost: (model, response) ->
		view = new Lightoak.Views.PostsShow(model: model)
		$('#posts_block').html(view.render().el)
