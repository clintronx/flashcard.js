class app.DecksPropertiesView extends Backbone.View

  tagName: "ul"
  id: "input"
  className: "show"

  events:
    "click li": "loadDeck"

  initialize: ->
    @collection = new app.DecksProperties()
    @collection.fetch reset: true
    @render()

    @listenTo @collection, 'reset', this.render

  render: ->
    @collection.each (deck) ->
      @renderDeck deck
    ,@
    @

  renderDeck: (deck) ->
    deckView = new app.DeckPropertiesView model: deck
    @$el.append deckView.render().el

  loadDeck: (event) ->
    card = new app.Card name: event.currentTarget.innerText.split(' ')[0]
    card.fetch()
    view = new app.CardView model: card
    $('body').append view.render().el
