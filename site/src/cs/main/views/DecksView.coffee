class app.view.DecksView extends Backbone.View

  tagName: "select"
  id: "input"
  className: "decks span5"

  events:
    "change": "_changeSelected"

  initialize: (options) ->
    @render()

    @collection.fetch reset: true
    @listenTo @collection, 'reset', this.render

  render: ->
    @$el.empty()
    @$el.append H.compile('#decksOptions') decks: @collection.toJSON()
    @

  _changeSelected: () ->
    app.router.navigate("flashcard/deck/#{$(@el).val()}", trigger: true); 