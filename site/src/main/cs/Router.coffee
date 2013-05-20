class app.Router extends Backbone.Router

  routes:
    "": "index"
    "flashcard/decks" : "decks"

  index: ->

  # decks: ->
    # var card = new app.model.Card({'front': 'front', 'back': 'back'});
    # var cardView = new app.view.CardView({model: card});

    # var advanceDeckView = new app.view.AdvanceDeckView({});
    decks = new app.view.DecksPropertiesView()
    # var deck = new app.view.DeckView();

    # $('body').append(cardView.render());
    # $('body').append(deck.render().el);
    # $('body').append(advanceDeckView.render());
    $('body').append decks.render().el
    # $('#decks li').on('click', function(e){ console.log("clicked "+e.currentTarget.innerText); });