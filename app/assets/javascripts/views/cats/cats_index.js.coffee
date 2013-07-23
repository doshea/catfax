class Catfax.Views.CatsIndex extends Backbone.View
  tagName: 'ul'
  className: 'cats'

  template: JST['cats/index']

  initialize: ->
    this.collection.on('reset', this.render, this)

  events: ->
    'submit form' : this.newCat

  # Custom events for the view
  render: ->
    # $(this.el).html(this.template(cats: this.collection))
    # this.$el.html(this.template(cats: this.collection))
    # @$el.html(this.template(cats: this.collection))
    this.$el.html(this.template())
    this.collection.forEach(this.addOne, this)
    this

  newCat: (e) ->
    e.preventDefault()
    name = $('input[name=name]').val()
    breed = $('input[name=breed]').val()
    new_cat = new Catfax.Models.Cat(
      name: name
      breed: breed
    )
    new_cat.save()
    this.collection.add(new_cat)
    this.addOne(new_cat)

  addOne: (cat) ->
    cat_view = new Catfax.Views.CatsShow({model: cat})
    this.$el.append(cat_view.render().el)


















