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
    @model.on 'change', @render, @

  _renderText: ->
    pTag = $ '<p>'
    pTag.addClass("text-center") if @model.get('viewing') is 'front'
    @$el.append pTag.append @model.getText()

  toggleCard: ->
    @_handleCardFlip()
    @render()

  _handleCardFlip: ->
    @$el.attr 'data-view', 'z-perspective'
    setTimeout =>
      @model.toggleCard()
      @$el.attr 'data-view', @model.get 'viewing'
    , 250
