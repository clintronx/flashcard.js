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
          @_renderNavbar()
          Backbone.history.start pushState: true

    index: ->
      location.replace "/deck/#{@decks.at(0).get 'name'}"

    deck: (@currentDeck) ->
      document.title = "Deck: #{@currentDeck}"
      @_prepareView()
      @navbar.renderPlayNow()
      @gridView = new GridView collection: @cards
      $('body').append @gridView.render().el
      @navbar.setSelected @currentDeck

    player: (@currentDeck) ->
      document.title = "Play: #{@currentDeck}"
      @_prepareView()
      @navbar.removePlayNow()
      @playerView = new PlayerView collection: @cards
      $('body').append @playerView.render().el
      @navbar.setSelected @currentDeck

    _prepareView: ->
      @gridView?.remove()
      @playerView?.remove()
      unless @cards?.name is @currentDeck
        @cards?.remove()
        @cards = new Cards [], name: @currentDeck
        @cards.fetch reset:true

    _renderNavbar: ->
      @navbar = new NavbarView collection: @decks
      $('body').append @navbar.render().el
