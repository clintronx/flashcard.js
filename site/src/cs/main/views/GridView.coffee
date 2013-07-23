class app.view.GridView extends Backbone.View

  initialize: ->
    @cardViews = []
    @_registerEventHandlers()

  _registerEventHandlers: ->
    $(document).on 'keydown', @handleKeydownEvents

  render: ->
    @collection.fetch
      reset: true
      success: (collection, response, options) =>
        collection.each (card) =>
          options =
            model: card
            attributes:
              "data-view": card.get 'viewing'
          cardView = new app.view.CardView options
          @cardViews.push cardView
          @$el.append cardView.render().el
    @

  remove: ->
    super
    $(document).off 'keydown', @handleKeydownEvents

  handleKeydownEvents: (event) =>
    switch event.which
      when 32 #space
        for view in @cardViews
          view.toggle()
        return false
