(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.model.Card = (function(_super) {

    __extends(Card, _super);

    function Card() {
      this.isViewing = __bind(this.isViewing, this);
      Card.__super__.constructor.apply(this, arguments);
    }

    Card.prototype.defaults = {
      name: "",
      front: 'front',
      back: 'back',
      viewing: 'front'
    };

    Card.prototype.initialize = function(options) {
      return _.extend(this, options);
    };

    Card.prototype.toggleCard = function() {
      switch (this.get('viewing')) {
        case 'front':
          return this.set({
            viewing: 'back'
          });
        case 'back':
          return this.set({
            viewing: 'front'
          });
      }
    };

    Card.prototype.isViewing = function(guess) {
      if (this.get('viewing') === guess) {
        return true;
      }
      return false;
    };

    return Card;

  })(Backbone.Model);

}).call(this);
