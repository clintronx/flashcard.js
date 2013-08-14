define [
  "backbone"
  "DecksView"
  "hbs!../../../templates/PlayNow"
], (Backbone, DecksView, template) ->

  class NavbarView extends Backbone.View

    className: 'navbar'

    events:
      'click #playnow': 'startPlayer'

    initialize: ->
      @listenTo @collection, 'reset', @render
      @decksView = new DecksView collection: @collection

    render: =>
      @$el.html @decksView.render().el
      @$el.append template
      @

    remove: =>
      @decksView?.remove()
      super

    renderPlayNow: ->
      @$el.addClass 'playnow'

    removePlayNow: ->
      @$el.removeClass 'playnow'

    setSelected: (name) ->
      @$('select').val name
      @$('select').change() unless name

    startPlayer: =>
      Backbone.history.navigate "/player/#{$('select').val()}", true
