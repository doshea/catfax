class Catfax.Routers.Cats extends Backbone.Router
  routes:
    '': 'index'
    'cats/:id': 'show'

  initialize: ->
    this.collection = new Catfax.Collections.Cats()
    this.collection.fetch({reset: true})

  index: ->
    view = new Catfax.Views.CatsIndex(collection: this.collection)
    $('#container').html(view.render().el)

  show: ->
    alert('SHOW!')