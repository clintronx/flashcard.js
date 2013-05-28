class app.Router extends Backbone.Router

  routes:
    "": "index"

    "deck/:name": "deck"

    "decks" : "decks"

  events:
    ""

  initialize: ->
    @decksProperties = new app.collection.Decks()

  index: ->
    decksView = new app.view.DecksView collection: @decksProperties
    $('body').append decksView.render().el 

  deck: (name) ->
    $('.deck').remove()

    cards = new app.collection.Cards [], name: name    
    cards.fetch reset: true, success: (collection, response, options) =>
      el = $ '<div class="deck">'
      
      collection.each (card) =>
        cardView = new app.view.CardView model: card, attributes: "data-view": card.get 'viewing'
        el.append cardView.render().el
      
      $('body').append el