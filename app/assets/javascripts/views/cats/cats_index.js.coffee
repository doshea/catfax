class Catfax.Views.CatsIndex extends Backbone.View
  tagName: 'ul'
  className: 'cats'

  # template: JST['cats/index']

  initialize: ->
    this.collection.on('reset', this.render, this)

  events: ->
    'click button' : this.erase

  # Custom events for the view
  render: ->
    # $(this.el).html(this.template(cats: this.collection))
    # this.$el.html(this.template(cats: this.collection))
    # @$el.html(this.template(cats: this.collection))
    this.collection.forEach(this.addOne, this)
    this

  addOne: (cat) ->
    cat_view = new Catfax.Views.CatsShow({model: cat})
    this.$el.append(cat_view.render().el)

  erase: (e) ->
    # alert('Should be erasing!')
    $(e.target).parent().fadeOut()













