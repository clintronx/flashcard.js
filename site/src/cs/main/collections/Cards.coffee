class app.collection.Cards extends Backbone.Collection

  defaults:
    name: ""

  url: ->  
    "/flashcard/deck/#{@name}"

  initialize: (models, options) ->
    _.extend @, options

  model: (attributes, options) -> 
    new app.model.Card attributes, options