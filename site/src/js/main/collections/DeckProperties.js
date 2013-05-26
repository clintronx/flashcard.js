(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.collection.Decks = (function(_super) {

    __extends(Decks, _super);

    function Decks() {
      Decks.__super__.constructor.apply(this, arguments);
    }

    Decks.prototype.defaults = {
      name: ""
    };

    Decks.prototype.url = function() {
      return "decks";
    };

    Decks.prototype.initialize = function(options) {
      return _.extend(this, options);
    };

    Decks.prototype.model = function(attributes, options) {
      return new app.model.Deck(attributes, options);
    };

    return Decks;

  })(Backbone.Collection);

}).call(this);
