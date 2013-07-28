define [
  "lodash"
  "backbone"
  "Card"
], (_, Backbone, Card) ->

  class Cards extends Backbone.Collection

    defaults:
      name: ""

    url: ->  
      "/flashcard/deck/#{@name}"

    model: Card

    initialize: (models, options) ->
      _.extend @, options

    toggle: =>
      @each (card) =>
        card.toggle()
