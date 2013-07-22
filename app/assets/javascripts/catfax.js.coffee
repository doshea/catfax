# This is basically the ringmaster of the whole show.
# It keeps track of all the JS Objects you will be creating
window.Catfax =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Catfax.Routers.Cats
    Backbone.history.start()

$(document).ready ->
  Catfax.initialize()
