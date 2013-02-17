window.Lightoak =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new Lightoak.Routers.Posts()
  	Backbone.history.start({pushState:true})

$(document).ready ->
  Lightoak.initialize()
