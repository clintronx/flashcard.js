define [
  "backbone"
  "Deck"
], (Backbone, Deck) ->

  class Decks extends Backbone.Collection

    url: "/flashcard/decks"

    model: Deck
