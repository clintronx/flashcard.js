class app.Router extends Backbone.Router

  routes:
    "": "index"
    "deck/:name": "deck"
    "decks": "decks"
    "player/:name": "player"

  initialize: ->
    $('body').empty()
    $('body').append H.compile '#scaffolding'
    @decksProperties = new app.collection.Decks()
    decksView = new app.view.DecksView collection: @decksProperties
    $('.navbar').append decksView.render().el

  index: ->

  deck: (name) ->
    $('.container').empty()
    cards = new app.collection.Cards [], name: name
    cards.fetch
      reset: true
      success: (collection, response, options) =>
        collection.each (card) =>
          options =
            model: card
            attributes:
              "data-view": card.get 'viewing'
          cardView = new app.view.CardGridView options
          $('.container').append cardView.render().el

  player: (name) ->
    $('.container').empty()
    cards = new app.collection.Cards [], name: name
    @playerView = new app.view.PlayerView collection: cards
    $('.container').append @playerView.render().el
