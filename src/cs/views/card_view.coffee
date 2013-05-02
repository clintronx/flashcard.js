#jslint nomen: true
#global Backbone,_,$,console
app.CardView = Backbone.View.extend
  tagName: 'section'
  id: 'view'
  
  template: _.template('<p id="card"><% if(current === "front"){ %> <%= front %><% }else{ %><%= back %><% } %></p>')
  
  render: ->
    @$el.html this.template(this.model.toJSON())
  
  initialize: ->
    @model.on 'change', @render, @
  
  events:
    "click #card": "toggleCard"
  
  toggleCard: ->
    @model.toggleCard()
