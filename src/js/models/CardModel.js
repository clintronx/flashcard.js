(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.Card = (function(_super) {

    __extends(Card, _super);

    function Card() {
      Card.__super__.constructor.apply(this, arguments);
    }

    Card.prototype.defaults = {
      front: 'front',
      back: 'back',
      current: 'front'
    };

    Card.prototype.toggleCard = function() {
      switch (this.get('current')) {
        case 'front':
          return this.set({
            current: 'back'
          });
        case 'back':
          return this.set({
            current: 'front'
          });
      }
    };

    return Card;

  })(Backbone.Model);

}).call(this);
