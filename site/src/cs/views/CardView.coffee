class app.CardView extends Backbone.View

  tagName: 'section'
  id: 'view'
  
  template: _.template '' +
    '<p id="card">' + 
      '<% if(viewing === "front"){ %>' +
        '<%= front %>' + 
      '<% }else{ %><'+
        '%= back %><% } %>' +
    '</p>'

  render: =>
    @$el.html @template(@model.toJSON())
    @
  
  initialize: ->
    @model.on 'change', @render, @
  
  events:
    "click #card": "toggleCard"

  toggleCard: ->
    @model.toggleCard()
