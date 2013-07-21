class app.Router extends Backbone.Router

  routes:
    "": "index"
    "deck/:name": "deck"
    "decks": "decks"
    "player/:name": "player"

  initialize: ->
    $('body').append H.compile '#scaffolding'
    @decksProperties = new app.collection.Decks()
    navbar = new app.view.NavbarView el: $('.navbar'), collection: @decksProperties
    navbar.render().el

  index: ->
  deck: (name) ->
    $('.flashcardjs').empty()
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
          $('.flashcardjs').append cardView.render().el

  player: (name) ->
    $('.flashcardjs').empty()
    cards = new app.collection.Cards [], name: name
    @playerView = new app.view.PlayerView collection: cards
    $('.flashcardjs').append @playerView.render().el
