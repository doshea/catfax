class Catfax.Views.CatsIndex extends Backbone.View
  # These options modify the DOM element that this view
  # will be creating when it renders (this.el). Rather than
  # making a boring <div>, we are making a <ul> with a class.
  tagName: 'ul'
  className: 'cats'

  # We specify here which template we will be using to render
  # the HTML code for this.el. Note that a template is not mandatory
  # but if we don't use one, we'd have to write out jQuery statements
  # in our render() function which would get really messy.
  template: JST['cats/index']

  #
  # BUILT-IN FUNCTIONS
  #

  # When the view is made, tell it that if its collection is reset,
  # the view should re-render
  initialize: ->
    this.collection.on('reset', this.render, this)

  # Here, you can set up any events that you'd like to trigger when
  # interacting with the el (DOM element) that this view renders
  events: ->
    'submit form' : this.newCat
    # e.g. 'event_name css_selector' : this.defined_function_name

  #
  # CUSTOM FUNCTIONS
  #

  #
  render: ->
    # FYI, this.$el is shorthand for $(this.el)
    # First, we set the <ul> that we're building to have HTML content
    # equal to this view's template (puts the <form> on). Then we loop
    # through the collection of Cats and append a CatsShow view for
    # each of the Cats in the collection to the <ul>. In the end, the <ul>
    # we're building will have a form at the top, followed by a list of Cats.
    this.$el.html(this.template())
    this.collection.forEach(this.addOne, this)
    this

  # Called when a form in this view's element is submitted
  # Grabs the name and breed from the form and makes
  # a new Cat on both front and back ends with those attrs
  newCat: (e) ->
    # stop the form from submitting as a GET, and snag its input values
    e.preventDefault()
    name = $('input[name=name]').val()
    breed = $('input[name=breed]').val()

    new_cat = new Catfax.Models.Cat(
      name: name
      breed: breed
    )
    # When making the new Model, we need to
    # 1. Save it to the database so the data persists (back end)
    # 2. Add the new Model to our Backbone Collection of Cats (front end, logic)
    # 3. Update our DOM list, appending the new cat's view (front end, DOM)
    new_cat.save()
    this.collection.add(new_cat)
    this.addOne(new_cat)

  # Called while rendering and when adding a new Cat via the form
  # Takes an instance of the Cat model and adds its rendered CatsShow
  # view to the DOM, appended to the <ul> (this.el)
  addOne: (cat) ->
    cat_view = new Catfax.Views.CatsShow({model: cat})
    this.$el.append(cat_view.render().el)
