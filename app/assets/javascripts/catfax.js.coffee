# This is basically the ringmaster of the whole show.
# It keeps track of all the JS Objects you will be creating
window.Catfax =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

$(document).ready ->
  Catfax.initialize()
