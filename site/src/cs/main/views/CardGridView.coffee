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
    $(document).on 'keydown', @handleKeydownEvents
    @listenTo @model, 'change', @render

  remove: ->
    super
    $(document).off 'keydown', @handleKeydownEvents

  _renderText: ->
    div = $ '<div>'
    div.addClass("text-center") if @model.get('viewing') is 'front'
    @$el.append div.append @model.getText()

  toggleCard: =>
    @_handleCardFlip()
    @render()

  handleKeydownEvents: (event) =>
    switch event.which
      when 32 #space
        @toggleCard()
        return false

  _handleCardFlip: =>
    @$el.attr 'data-view', 'z-perspective'
    setTimeout =>
      @model.toggleCard()
      @$el.attr 'data-view', @model.get 'viewing'
    , 250
