class app.DeckPropertiesView extends Backbone.View

  tagName: "li"

  template: _.template "<%= name %> [<%= size %>]"

  render: ->
    @$el.html @template(@model.toJSON())
    @