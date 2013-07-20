class app.view.PlayerView extends Backbone.View

  id: 'player'

  initialize: () ->
    $(document).on 'keydown', @advance
    @collection.fetch reset: true
    @current = 0
    @collection.on 'reset', @render

  render: =>
    @$el.empty()
    card = @collection.at @current
    if card
      options =
        model: card
        attributes:
          "data-view": card.get 'viewing'
      cardView = new app.view.CardGridView options
      @$el.append cardView.render().el
    @

  _incrementCard: ->
    @current++
    @current = 0 if @current >= @collection.length

  _decrementCard: ->
    @current--
    @current = @collection.length - 1 if @current <= 0

  advance: (event) =>
    console.log event.which
    @_handleAdvance @_decrementCard() if event.which is 37
    @_handleAdvance @_incrementCard() if event.which is 39

  _handleAdvance:  =>
    @render()
    return false
