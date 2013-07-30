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
      @listenTo @collection, 'reset', @render

    render: ->
      @$el.empty()
      @$el.append template decks: @collection.toJSON()
      @

    _changeSelected: (event) ->
      name = event.currentTarget.value
      return unless name
      @$el.val name
      app?.router.navigate "deck/#{name}", trigger: true
