define [
  "jquery"
  "backbone"
  "Decks"
  "Cards"
  "NavbarView"
  "GridView"
  "PlayerView"
], ($, Backbone, Decks, Cards, NavbarView, GridView, PlayerView) ->

  class Router extends Backbone.Router

    routes:
      "": "index"
      "deck/:name": "deck"
      "decks": "decks"
      "player/:name": "player"

    initialize: ->
      @decks = new Decks()
      @decks.fetch
        success: =>
          Backbone.history.start pushState: true

    index: ->
      @_renderNavbar()

    deck: (@currentDeck) ->
      @_prepareView()
      @_renderNavbar()
      @navbar.renderPlayNow()
      @gridView = new GridView collection: @cards
      $('body').append @gridView.render().el

    player: (@currentDeck) ->
      @_prepareView()
      @_renderNavbar()
      @playerView = new PlayerView collection: @cards
      $('body').append @playerView.render().el

    _prepareView: ->
      @navbar?.remove()
      @gridView?.remove()
      @playerView?.remove()
      $('body').empty()
      unless @cards?.name is @currentDeck
        @cards?.remove()
        @cards = new Cards [], name: @currentDeck
        @cards.fetch reset:true

    _renderNavbar: ->
      @navbar = new NavbarView collection: @decks
      $('body').append @navbar.render().el
      @navbar.setSelected @currentDeck
