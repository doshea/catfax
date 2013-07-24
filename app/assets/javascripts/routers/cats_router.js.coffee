class Catfax.Routers.Cats extends Backbone.Router
  # These are Backbone routes, so when the Router is initialized
  # or when you navigate to a 'new' page, Backbone figures out which
  # Backbone page you navigated to by its suffix and triggers the appropriate
  # router function. That function should render the appropriate view.
  routes:
    '': 'index'
    'cats/:id': 'show'

  # Called when you first navigate to a truly new page that uses Backbone
  # Loads in the collection of cats (initially empty) and then fetches the
  # server data for all cats so that the Collection populates
  initialize: ->
    #  Makes an empty collection of Cat models
    this.collection = new Catfax.Collections.Cats()
    # Asynchronously fetches the cats from /api/cats
    this.collection.fetch({reset: true})

  # Called when the user navigates to localhost:3000. Renders
  # the CatsIndex view and whatever HTML it renders it replaces the
  # contents of the #container element with those contents
  index: ->
    #
    view = new Catfax.Views.CatsIndex(collection: this.collection)
    $('#container').html(view.render().el)

  # Called when the user navigates to localhost:3000/#cats/4
  # (or whatever id they used). Makes sure the collection is fetched
  # and then renders the CatsShow view for that cat
  show: (id) ->
    ctx = this #Saves the 'this' variable for use inside the success callback
    this.collection.fetch(
      reset: true
      success: ->
        view = new Catfax.Views.CatsShow(model: ctx.collection.get(id))
        $('#container').html(view.render().el)
    ) if this.collection.length == 0
    # We have to use the above workaround rather than the code below
    # because the fetch in initialize is asynchronous and if we don't wait
    # for the fetch to complete, we'll perform the get on an empty collection
    # view = new Catfax.Views.CatsShow(model: this.collection.get(id))
    # $('#container').html(view.render().el)