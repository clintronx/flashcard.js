class app.view.CardView extends Backbone.View

  id: 'card'
  className: 'small'
  attributes:
    "data-view": "default"

  events:
    "click": "toggleCard"

  render: -> 
    @$el.empty()
    @_renderText()  
    @
  
  initialize: ->
    @model.on 'change', @render, @

  _renderText: ->
    @$el.append @model.getText()    

  toggleCard: ->
    @model.toggleCard()
    @$el.attr 'data-view', @model.get 'viewing'
    @render()
