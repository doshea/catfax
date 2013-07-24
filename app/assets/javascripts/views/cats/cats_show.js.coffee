class Catfax.Views.CatsShow extends Backbone.View
  # This view's el into which it renders will be an <li> element
  tagName: 'li'

  # Again, templates are not *necessary* but they are
  # extremely helpful in terms of keeping our content
  # out of our logic
  template: JST['cats/show']

  #
  # BUILT-IN FUNCTIONS
  #

  # When the view is made, render it (think about
  # why this might cause problems...what if the collection hasn't
  # been fetched and the model isn't defined)
  initialize: ->
    this.render
    this.model.on('change', this.render, this)

  events: ->
    'click button' : this.erase
    # e.g. 'event_name css_selector' : this.defined_function_name

  #
  # CUSTOM FUNCTIONS
  #

  #  Sets the contents of the <li> element generated
  #  by this view to its template
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    # this.$el.html(this.template(cat: this.model))
    this

  # Called when a button (any button!) is clicked in the
  # show view. Fades out the DOM element, destroys the model
  # Destroying the model removes it from its collection as well
  # as deleting the back-end data in our db associated
  # with the front-end model
  erase: (e) ->
    this.$el.fadeOut()
    this.model.destroy()
