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
      "deck/:name": "deck"
      "decks": "decks"
      "player/:name": "player"

    initialize: ->
      $('body').append template
      @decks = new Decks()
      @decks.fetch
        success: =>
          @navbar = new NavbarView el: $('.navbar'), collection: @decks
          Backbone.history.start pushState: true

    deck: (@currentDeck) ->
      @_prepareView()
      @navbar.renderPlayNow()
      gridView = new GridView collection: @cards
      $('.flashcardjs').append gridView.render().el

    player: (@currentDeck) ->
      @_prepareView()
      playerView = new PlayerView collection: @cards
      $('.flashcardjs').append playerView.render().el

    _prepareView: ->
      @navbar.render()
      @navbar.setSelected @currentDeck
      $('.flashcardjs').empty()
      @cards = new Cards [], name: @currentDeck
