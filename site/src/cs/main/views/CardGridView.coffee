class app.view.CardGridView extends Backbone.View

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
    $(document).on 'keydown', @keydown
    @model.on 'change', @render, @

  _renderText: ->
    div = $ '<div>'
    div.addClass("text-center") if @model.get('viewing') is 'front'
    @$el.append div.append @model.getText()

  toggleCard: =>
    @_handleCardFlip()
    @render()

  keydown: (event) =>
    @_handleKeydown() if event.which is 32 #space

  _handleKeydown: (event) =>
    @toggleCard()
    return false

  _handleCardFlip: =>
    @$el.attr 'data-view', 'z-perspective'
    setTimeout =>
      @model.toggleCard()
      @$el.attr 'data-view', @model.get 'viewing'
    , 250
