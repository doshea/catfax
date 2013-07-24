class Catfax.Models.Cat extends Backbone.Model
  # Tells a Cat that if it has, say, id of 37, it can get info
  # about that Cat on the back end or change that Cat
  # on the back end at '/api/cats/37'
  # Can perform GET (show), PUT/PATCH (update), DELETE (destroy)
  # using this URL
  urlRoot: '/api/cats'