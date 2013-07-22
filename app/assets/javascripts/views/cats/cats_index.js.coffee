class Catfax.Views.CatsIndex extends Backbone.View

  template: JST['cats/index']

  render: ->
    $(this.el).html(this.template(cats: @collection))
    this