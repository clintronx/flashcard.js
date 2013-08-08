define [
  "jquery"
  "lodash"
  "backbone"
  "CardView"
], ($, _, Backbone, CardView) ->

  class GridView extends Backbone.View

    className: 'flashcardjs'

    events:
      'click .card': 'handleToggle'

    initialize: ->
      @cardViews = []
      @handleKeydownEvents = _.throttle @handleKeydownEvents, 500, trailing: false
      @_registerEventHandlers()

    _registerEventHandlers: ->
      $(document).on 'keydown', @handleKeydownEvents
      @listenTo @collection, 'reset', @renderDeck

    renderDeck: =>
      @cardViews = @_cleanpCardViews()
      @collection.each (card) =>
        options =
          model: card
          attributes:
            "data-view": card.get 'viewing'
            "id": @cardViews.length
        cardView = new CardView options
        @cardViews.push cardView
        @$el.append cardView.render().el
      @

    remove: ->
      $(document).off 'keydown', @handleKeydownEvents
      @_cleanpCardViews()
      super

    _cleanpCardViews: ->
      cardView.remove() for cardView in @cardViews
      []

    handleToggle: (event) =>
      card = @cardViews[event.currentTarget.id]
      card?.toggle()

    handleKeydownEvents: (event) =>
      switch event.which
        when 32 #space
          for view in @cardViews
            view.toggle()
          return false
