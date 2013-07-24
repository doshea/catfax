class Catfax.Collections.Cats extends Backbone.Collection
  # Tells each Collection of Cats that it can fetch its contents
  # from a GET to '/api/cats' (cats#index in our CatsController in Rails)
  url: '/api/cats'
  model: Catfax.Models.Cat
