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
    $('body').empty()
    $('body').append H.compile '#scaffolding'

    decksView = new app.view.DecksView collection: @decksProperties
    $('.navbar').append decksView.render().el 

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
          
          cardView = new app.view.CardView options        
          $('.container').append cardView.render().el