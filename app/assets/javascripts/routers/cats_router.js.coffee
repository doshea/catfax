class Catfax.Routers.Cats extends Backbone.Router
  routes:
    '': 'index'
    'cats/:id': 'show'


  index: ->
    alert('INDEX!')


  show: ->
    alert('SHOW!')