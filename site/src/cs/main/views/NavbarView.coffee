define [
  "backbone"
  "DecksView"
  "hbs!../../../templates/PlayNow"
], (Backbone, DecksView, template) ->

  class NavbarView extends Backbone.View

    events:
      'click #playnow': 'startPlayer'

    initialize: ->
      @listenTo @collection, 'reset', @render

    render: =>
      @$el.empty()
      decksView = new DecksView collection: @collection
      @$el.append decksView.render().el
      @

    renderPlayNow: ->
      @$el.append template
      @

    setSelected: (name) ->
      $('select').val name
      $('select').change() unless name

    startPlayer: =>
      window.app.router.navigate "player/#{$('select').val()}", trigger: true
