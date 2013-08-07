define [
  "jquery"
  "lodash"
  "backbone"
], ($, _, Backbone) ->

  class CardView extends Backbone.View

    id: 'card'
    className: 'small'
    attributes:
      "data-view": "default"

    events:
      "click": "toggle"

    initialize: ->
      @listenTo @model, 'change', @render
      @_flipCard = _.debounce @_flipCard, 250

    render: ->
      @$el.empty()
      @_renderText()
      @

    _renderText: ->
      div = $ '<div>'
      div.addClass("text-center") if @model.get('viewing') is 'front'
      @$el.append div.append @model.getText()

    enterScreenAnimation: ->
      setTimeout =>
        @$el.attr 'data-enterscreen', ''
      , 20

    toggle: =>
      @_handleCardFlip()
      @render()

    _handleCardFlip: =>
      @$el.attr 'data-view', 'z-perspective'
      @_flipCard()

    _flipCard: =>
      @model.toggle()
      @$el.attr 'data-view', @model.get 'viewing'

    advance: (direction) =>
      @$el.attr 'data-advance', direction
      @render()
