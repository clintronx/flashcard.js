(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.view.DecksView = (function(_super) {

    __extends(DecksView, _super);

    function DecksView() {
      DecksView.__super__.constructor.apply(this, arguments);
    }

    DecksView.prototype.tagName = "select";

    DecksView.prototype.id = "input";

    DecksView.prototype.className = "decks";

    DecksView.prototype.events = {
      "change": "_changeSelected"
    };

    DecksView.prototype.initialize = function(options) {
      this.render();
      this.collection.fetch({
        reset: true
      });
      return this.listenTo(this.collection, 'reset', this.render);
    };

    DecksView.prototype.render = function() {
      this.$el.empty();
      this.$el.append(H.compile('#decksOptions')({
        decks: this.collection.toJSON()
      }));
      return this;
    };

    DecksView.prototype._changeSelected = function() {
      return app.router.navigate("flashcard/deck/" + ($(this.el).val()), {
        trigger: true
      });
    };

    return DecksView;

  })(Backbone.View);

}).call(this);
