class app.view.PlayerView extends Backbone.View

  id: 'player'

  initialize: ->
    $(document).on 'keydown', @advance
    @collection.fetch reset: true
    @current = 0
    @collection.on 'reset', @render

  remove: ->
    super
    $(document).off 'keydown', @advance

  render: =>
    @$el.empty()
    @card = @collection.at @current
    if @card
      options =
        model: @card
        attributes:
          "data-view": @card.get 'viewing'
      @cardView = new app.view.CardView options
      @$el.append @cardView.render().el
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
        @render()
        return false
      when 39 #right
        @_incrementCard()
        @render()
        return false
