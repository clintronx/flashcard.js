define [
  "lodash"
  "backbone"
  "Deck"
], (_, Backbone, Deck) ->

  class Decks extends Backbone.Collection

    url: -> "/flashcard/decks"

    model: Deck
