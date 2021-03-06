define [
  "jquery"
  "backbone"
  "CardView"
], ($, Backbone, CardView) ->

  class PlayerView extends Backbone.View

    className: 'flashcardjs'
    id: 'player'

    events:
      'click .card': 'handleToggle'

    initialize: ->
      @current = 0
      @advance = _.throttle @advance, 500, trailing: false
      $(document).on 'keydown', @advance
      @listenTo @collection, 'reset', @render

    remove: ->
      $(document).off 'keydown', @advance
      @cardView?.remove()
      super

    render: =>
      @$el.empty()
      @card = @collection.at @current
      if @card
        options =
          model: @card
          attributes:
            "data-view": @card.get 'viewing'
            "data-enterscreen": @enterScreen if @enterScreen
        @cardView?.remove()
        @cardView = new CardView options
        @$el.append @cardView.render().el
        @cardView.enterScreenAnimation()
      @

    _incrementCard: ->
      @current++
      @current = 0 if @current >= @collection.length

    _decrementCard: ->
      @current--
      @current = @collection.length - 1 if @current <= 0

    advance: (event) =>
      switch event.which
        when 32 #space
          @cardView.toggle()
          return false
        when 37 #left
          @_decrementCard()
          @advance = 'right'
          @enterScreen = 'left'
          @cardView.advance @advance
          window.setTimeout @_handleAdvance, 230
          return false
        when 39 #right
          @_incrementCard()
          @advance = 'left'
          @enterScreen = 'right'
          @cardView.advance @advance
          window.setTimeout @_handleAdvance, 230
          return false

    handleToggle: (event) =>
      @cardView?.toggle()

    _handleAdvance: =>
      @$el.empty()
      @render()
