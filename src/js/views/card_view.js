(function() {

  app.CardView = Backbone.View.extend({
    tagName: 'section',
    id: 'view',
    template: _.template('<p id="card"><% if(current === "front"){ %> <%= front %><% }else{ %><%= back %><% } %></p>'),
    render: function() {
      return this.$el.html(this.template(this.model.toJSON()));
    },
    initialize: function() {
      return this.model.on('change', this.render, this);
    },
    events: {
      "click #card": "toggleCard"
    },
    toggleCard: function() {
      return this.model.toggleCard();
    }
  });

}).call(this);
