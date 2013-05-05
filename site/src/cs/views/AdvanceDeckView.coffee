class app.AdvanceDeckView extends Backbone.View

  initialize: ->
    @activeID = {}

  template: -> _.template '' +
    '<div id="prev_card"></div>' +
    '<div id="next_card"></div>'

  render: ->
    @$el.append @template()

  events: ->
    "click #next_card": "next"
    "click #prev_card": "prev"
    "mouseover #next_card": "showNext"
    "mouseover #prev_card": "showPrev"

  advance: =>

  showNext: => @show $('#next_card'), 'next_background'

  showPrev: => @show $('#prev_card'), 'prev_background'

  show: (el, className, delay = 750) =>
    console.log "show #{className}"
    el.addClass className
    clearTimeout @activeID[className]
    @activeID[className] = setTimeout (() => @cleanup(el, className)), delay

  next: ->
    console.log "next"

  prev: ->
    console.log "prev"

  cleanup: (el, className) =>
    console.log "cleanup #{className}"
    el.removeClass className
    delete @activeID[className]