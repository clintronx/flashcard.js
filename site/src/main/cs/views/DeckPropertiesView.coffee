class app.view.DeckPropertiesView extends Backbone.View

  tagName: "option"
  

  template: _.template '<option value="<%= name %>"><%= name %> [<%= size %>]</option>'

  render: ->
    @$el.html @template(@model.toJSON())
    @