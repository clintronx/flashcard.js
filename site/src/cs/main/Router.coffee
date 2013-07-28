define [
  "jquery"
  "backbone"
  "Decks"
  "Cards"
  "NavbarView"
  "GridView"
  "PlayerView"
  "hbs!../../../templates/Scaffolding"
], ($, Backbone, Decks, Cards, NavbarView, GridView, PlayerView, template) ->

  class Router extends Backbone.Router

    routes:
      "": "index"
      "deck/:name": "deck"
      "decks": "decks"
      "player/:name": "player"

    initialize: ->
      $('body').append template
      @decksProperties = new Decks()
      navbar = new NavbarView el: $('.navbar'), collection: @decksProperties
      navbar.render().el

    index: ->

    deck: (name) ->
      $('.flashcardjs').empty()
      cards = new Cards [], name: name
      gridView = new GridView collection: cards
      $('.flashcardjs').append gridView.render().el

    player: (name) ->
      $('.flashcardjs').empty()
      cards = new Cards [], name: name
      playerView = new PlayerView collection: cards
      $('.flashcardjs').append playerView.render().el
