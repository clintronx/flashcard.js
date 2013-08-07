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
      @$el.empty()
      @$el.append @decksView.render().el
      @

    remove: =>
      @decksView?.remove()
      super

    renderPlayNow: ->
      @$el.append template
      @

    setSelected: (name) ->
      $('select').val name
      $('select').change() unless name

    startPlayer: =>
      window.app.router.navigate "player/#{$('select').val()}", trigger: true
