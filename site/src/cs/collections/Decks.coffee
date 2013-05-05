class app.Decks extends Backbone.Collection

  defaults:
    name: ""

  url: () -> "deck/#{@name}"

  initialize: (options) ->
    _.extend @, options

  model: (attrs, options) -> new app.Card attrs, options
