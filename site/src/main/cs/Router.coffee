class app.Router extends Backbone.Router

  routes:
    "": "index"
    "flashcard/decks" : "decks"

  index: ->
    decks = new app.view.DecksView()
    $('body').append decks.render().el    