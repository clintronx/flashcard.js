class app.model.Deck extends Backbone.Model

  defaults:
    name: ""
    size: "0"
    starred: []
    current: 0

  initialize: (models, options) ->
    _.extend @, models, options
    @cards = new app.collection.Deck [], name: @name
    @cards.fetch reset: true
