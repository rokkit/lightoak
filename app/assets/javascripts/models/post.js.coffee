class Lightoak.Models.Post extends Backbone.Model
	url: ->
	    if this.isNew()
	      return "/api/posts.json"
	    else 
	      return "/api/posts/" + this.id
	initialize: ->
		@maxResults = 30
		@page = 0
		@loading = false
		@totalItems = null
