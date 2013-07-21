class app.view.NavbarView extends Backbone.View

  events:
    'click #playnow': 'startPlayer'

  initialize: ->
    @decksView = new app.view.DecksView collection: @collection

  render: ->
    @$el.append @decksView.render().el
    @$el.append H.compile '#playnowTemplate'
    @

  startPlayer: =>
    app.router.navigate "player/#{$('select').val()}", trigger: true
