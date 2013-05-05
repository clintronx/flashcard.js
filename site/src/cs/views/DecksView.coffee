class app.DecksView extends Backbone.View 

  initialize: (options) ->
    _.extend @, options
    @collection = new app.Decks name: @name
    @collection.fetch reset: true
    @render()

    @listenTo @collection, 'reset', this.render

  render: ->
    @$el.empty()

    card = @collection.filter (card) -> card.get "focus" is true
    card = @collection.first() unless card.length

    @renderCard card
    @

  renderCard: (card) ->
    cardView = new app.CardView model: card
    @$el.html cardView.render().el
