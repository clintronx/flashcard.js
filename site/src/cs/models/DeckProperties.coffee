class app.DeckProperties extends Backbone.Model

  defaults:
    name: ""
    size: "0"
    starred: []
    current: 0

  initialize: (options) ->
    _.extend @, options
