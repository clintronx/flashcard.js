(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.collection.Cards = (function(_super) {

    __extends(Cards, _super);

    function Cards() {
      Cards.__super__.constructor.apply(this, arguments);
    }

    Cards.prototype.defaults = {
      name: ""
    };

    Cards.prototype.url = function() {
      return "/deck/" + this.name;
    };

    Cards.prototype.initialize = function(models, options) {
      return _.extend(this, options);
    };

    Cards.prototype.model = function(attributes, options) {
      return new app.model.Card(attributes, options);
    };

    return Cards;

  })(Backbone.Collection);

}).call(this);
