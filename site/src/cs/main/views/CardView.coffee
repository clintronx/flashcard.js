class app.view.CardView extends Backbone.View

  id: 'card'
  className: 'small'
  attributes:
    "data-view": "default"

  events:
    "click": "toggle"

  render: ->
    @$el.empty()
    @_renderText()
    @

  initialize: ->
    @listenTo @model, 'change', @render

  _renderText: ->
    div = $ '<div>'
    div.addClass("text-center") if @model.get('viewing') is 'front'
    @$el.append div.append @model.getText()

  toggle: =>
    @_handleCardFlip()
    @render()

  _handleCardFlip: =>
    @$el.attr 'data-view', 'z-perspective'
    setTimeout =>
      @model.toggle()
      @$el.attr 'data-view', @model.get 'viewing'
    , 250
