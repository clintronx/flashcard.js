(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.collection.DecksProperties = (function(_super) {

    __extends(DecksProperties, _super);

    function DecksProperties() {
      DecksProperties.__super__.constructor.apply(this, arguments);
    }

    DecksProperties.prototype.defaults = {
      name: ""
    };

    DecksProperties.prototype.url = function() {
      return "/decks";
    };

    DecksProperties.prototype.initialize = function(options) {
      return _.extend(this, options);
    };

    DecksProperties.prototype.model = function(attributes, options) {
      return new app.model.Deck(attributes, options);
    };

    return DecksProperties;

  })(Backbone.Collection);

}).call(this);
