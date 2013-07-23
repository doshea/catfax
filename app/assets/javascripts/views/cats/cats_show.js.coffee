class Catfax.Views.CatsShow extends Backbone.View
  tagName: 'li'
  template: JST['cats/show']

  initialize: ->
    this.render

  #  Sets the contents of the <li> element generated
  #  by this view to its template
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    # this.$el.html(this.template(cat: this.model))
    this