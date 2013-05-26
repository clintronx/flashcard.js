class app.view.CardView extends Backbone.View

  tagName: 'canvas'
  id: -> @model.get 'name'
  className: 'small'
  attributes: ->
    "data-view": @model.get 'viewing'

  render: -> 
    @_renderText()  
    @
  
  initialize: ->
    @model.on 'change', @render, @

  _renderText: ->
      ctx = @el.getContext '2d'
      ctx.setTransform 1, 0, 0, 1, 0, 0
      ctx.clearRect 0, 0, @el.width, @el.height
      
      padding = 15
      maxWidth = @el.width - padding
      lineHeight = 25
      x = (@el.width - maxWidth) / 2
      y = padding
      ctx.font = '12pt Times'
      ctx.fillStyle = '#333'

      words = @model.get('back').split(' ') if @model.isViewing 'back'
      words = @model.get('front').split(' ') if @model.isViewing 'front'

      line = ''
      for word in words
        testLine = "#{line}#{word} "
        metrics = ctx.measureText(testLine)
        testWidth = metrics.width
        if(testWidth > maxWidth) 
          ctx.fillText(line, x, y)
          line = "#{word} "
          y += lineHeight          
        else 
          line = testLine
        
      
      ctx.fillText(line, x, y)
    @
    
  events:
    "click": "toggleCard"

  toggleCard: ->
    @model.toggleCard()
    @render()
