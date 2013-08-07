define [
  "jquery"
  "backbone"
  "CardView"
], ($, Backbone, CardView) ->

  class GridView extends Backbone.View

    className: 'flashcardjs'

    initialize: ->
      @cardViews = []
      @_registerEventHandlers()

    _registerEventHandlers: ->
      $(document).on 'keydown', @handleKeydownEvents
      @listenTo @collection, 'reset', @renderDeck

    render: ->
      @

    renderDeck: =>
      @collection.each (card) =>
        options =
          model: card
          attributes:
            "data-view": card.get 'viewing'
        cardView = new CardView options
        @cardViews.push cardView
        @$el.append cardView.render().el
      @

    remove: ->
      $(document).off 'keydown', @handleKeydownEvents
      cardView.remove() for cardView in @cardViews
      super

    handleKeydownEvents: (event) =>
      switch event.which
        when 32 #space
          for view in @cardViews
            view.toggle()
          return false
