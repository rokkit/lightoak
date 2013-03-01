class Lightoak.Collections.Posts extends Backbone.Paginator.requestPager
  model: Lightoak.Models.Post
  url: '/api/posts'
  paginator_core: {
			url: '/api/posts'
			dataType: 'json'
		},
  paginator_ui: {
			# the lowest page index your API allows to be accessed
			firstPage: 0
		
			# which page should the paginator start from 
			# (also, the actual page the paginator is on)
			currentPage: 1
			
			# how many items per page should be shown
			perPage: 3
			
			# a default number of total pages to query in case the API or 
			# service you are using does not support providing the total 
			# number of pages for us.
			# 10 as a default in case your service doesn't return the total
			totalPages: 10
		},
		server_api: {
			# the query field in the request
			# 'filter': ''
			
			# number of items to return per request/page
			'per_page': ->  @perPage 
			'page': -> @currentPage    
		}
	 parse: (response) ->
	 	response
