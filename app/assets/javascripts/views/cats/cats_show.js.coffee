class Catfax.Views.CatsShow extends Backbone.View
  # This view's el will be an <li> element
  tagName: 'li'

  template: JST['cats/show']

  initialize: ->
    this.render
    this.model.on('change', this.render, this)

  events: ->
    'click button' : this.erase
    # 'mouseover' : this.highlight

  #  Sets the contents of the <li> element generated
  #  by this view to its template
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
    # this.$el.html(this.template(cat: this.model))
    this

  erase: (e) ->
    this.$el.fadeOut()
    this.model.destroy()

  #  example hover event function
  # highlight: (e) ->
  #   this.$el.css(
  #     'backgroundColor' : 'red'
  #   )



















