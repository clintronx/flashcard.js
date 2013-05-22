class app.view.DecksView extends Backbone.View

  tagName: "select"
  id: "input"
  className: "show decks"

  events:
    "change select": "_alert"

  initialize: ->
    @collection = new app.collection.Decks()
    @collection.fetch reset: true
    @render()

    @listenTo @collection, 'reset', this.render

  render: ->
    @$el.empty()
    @$el.append H.compile('#decksOptions') decks: @collection.toJSON()
    @

  _alert: (event) ->
    alert("selected = #{event.currentTarget}")