class app.DecksProperties extends Backbone.Collection

  url: '/decks'

  model: (attrs, options) -> new app.DeckProperties attrs, options