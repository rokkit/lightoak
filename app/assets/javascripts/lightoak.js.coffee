window.Lightoak =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new Lightoak.Routers.Posts()
  	Backbone.history.start()

$(document).ready ->
  Lightoak.initialize()
