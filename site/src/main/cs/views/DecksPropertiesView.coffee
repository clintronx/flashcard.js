class app.view.DecksPropertiesView extends Backbone.View

  tagName: "select"
  id: "input"
  className: "show decks"

  events:
    "change select": "loadDeck"

  initialize: ->
    @collection = new app.collection.DecksProperties()
    @collection.fetch reset: true
    @render()

    @listenTo @collection, 'reset', this.render

  render: ->
    @$el.empty()
    @$el.append H.compile('#decksOptions') decks: @collection.toJSON()
    @

  renderDeck: (deck) ->
    deckView = new app.view.DeckPropertiesView model: deck
    @$el.append deckView.render().el

  loadDeck: (event) ->
    debugger
    card = new app.model.Card name: event.currentTarget.value
    card.fetch()
    view = new app.view.CardView model: card
    $('body').append view.render().el
