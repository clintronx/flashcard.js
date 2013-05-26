class app.Router extends Backbone.Router

  routes:
    "": "index"

    "flashcard/deck/:name": "deck"

    "flashcard/decks" : "decks"

  events:
    ""

  initialize: ->
    @decksProperties = new app.collection.DecksProperties()

  index: ->
    decksView = new app.view.DecksView collection: @decksProperties
    $('body').append decksView.render().el 

  deck: (name) ->
    $('.deck').remove()

    cards = new app.collection.Cards [], name: name    
    cards.fetch reset: true, success: (collection, response, options) =>
      el = $ '<div class="deck">'
      
      collection.each (card) =>
        cardView = new app.view.CardView model: card
        el.append cardView.render().el
      
      $('body').append el