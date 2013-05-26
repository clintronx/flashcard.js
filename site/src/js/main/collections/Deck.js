(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.collection.Deck = (function(_super) {

    __extends(Deck, _super);

    function Deck() {
      Deck.__super__.constructor.apply(this, arguments);
    }

    Deck.prototype.defaults = {
      name: ""
    };

    Deck.prototype.url = function() {
      return "deck/" + this.name;
    };

    Deck.prototype.initialize = function(models, options) {
      return _.extend(this, options);
    };

    Deck.prototype.model = function(attributes, options) {
      return new app.model.Card(attributes, options);
    };

    return Deck;

  })(Backbone.Collection);

}).call(this);
