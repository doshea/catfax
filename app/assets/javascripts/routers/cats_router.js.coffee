class Catfax.Routers.Cats extends Backbone.Router
  routes:
    '': 'index'
    'cats/:id': 'show'

  initialize: ->
    #  Makes an empty collection of Cat models
    this.collection = new Catfax.Collections.Cats()
    # Asynchronously fetches the cats from /api/cats
    this.collection.fetch({reset: true})

  index: ->
    view = new Catfax.Views.CatsIndex(collection: this.collection)
    $('#container').html(view.render().el)

  show: (id) ->
    ctx = this
    this.collection.fetch(
      reset: true
      success: ->
        view = new Catfax.Views.CatsShow(model: ctx.collection.get(id))
        $('#container').html(view.render().el)
    ) if this.collection.length == 0
    # This doesn't work because the fetch in initialize is asynchronous
    # view = new Catfax.Views.CatsShow(model: this.collection.get(id))
    # $('#container').html(view.render().el)