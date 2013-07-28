define [
  "backbone"
  "hbs!../../../templates/DeckOptions"
], (Backbone, template) ->

  class DecksView extends Backbone.View

    tagName: "select"
    id: "input"
    className: "decks span5"

    events:
      "change": "_changeSelected"

    initialize: (options) ->
      @render()
      @collection.fetch reset: true
      @listenTo @collection, 'reset', this.render

    render: ->
      @$el.empty()
      @$el.append template decks: @collection.toJSON()
      @

    _changeSelected: (event) ->
      deck = event.currentTarget.value
      app.router.navigate "deck/#{deck}", trigger: true
