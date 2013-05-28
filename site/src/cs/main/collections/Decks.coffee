class app.collection.Decks extends Backbone.Collection

  url: () -> "/flashcard/decks"

  initialize: (options) ->
    _.extend @, options

  model: (attributes, options) -> new app.model.Deck attributes, options