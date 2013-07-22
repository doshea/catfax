class Catfax.Views.CatsIndex extends Backbone.View
  tagName: 'ul'
  className: 'cats'

  template: JST['cats/index']

  initialize: ->
    this.collection.on('reset', this.render, this)

  render: ->
    $(this.el).html(this.template(cats: @collection))
    this