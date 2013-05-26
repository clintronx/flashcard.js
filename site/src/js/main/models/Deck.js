(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.model.Deck = (function(_super) {

    __extends(Deck, _super);

    function Deck() {
      Deck.__super__.constructor.apply(this, arguments);
    }

    Deck.prototype.defaults = {
      name: "",
      size: "0",
      starred: [],
      current: 0
    };

    Deck.prototype.initialize = function(models, options) {
      return _.extend(this, models, options);
    };

    return Deck;

  })(Backbone.Model);

}).call(this);
