# This is basically the ringmaster of the whole show.
# It keeps track of all the JS Objects you will be creating.
# You can see (using the JS console) that any Backbone
# objects you create will be stored in this globally-accessible variable.
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
  # When the document finishes loading, this creates the Router
  # and starts the "history". Backbone's history fixes the otherwise
  # bad interactions between the Back button and Backbone routing
