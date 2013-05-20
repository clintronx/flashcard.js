class app.collection.DecksProperties extends Backbone.Collection

  url: '/decks'

  model: (attrs, options) -> new app.model.DeckProperties attrs, options