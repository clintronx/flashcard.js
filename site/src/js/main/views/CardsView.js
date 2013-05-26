(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.view.CardView = (function(_super) {

    __extends(CardView, _super);

    function CardView() {
      CardView.__super__.constructor.apply(this, arguments);
    }

    CardView.prototype.tagName = 'canvas';

    CardView.prototype.id = function() {
      return this.model.get('name');
    };

    CardView.prototype.attributes = function() {
      return {
        "data-view": this.model.get('viewing'),
        'height': 200,
        'width': 200
      };
    };

    CardView.prototype.render = function() {
      return this;
    };

    CardView.prototype.initialize = function() {
      return this.model.on('change', this.render, this);
    };

    CardView.prototype.events = {
      "click #card": "toggleCard"
    };

    CardView.prototype.toggleCard = function() {
      return this.model.toggleCard();
    };

    return CardView;

  })(Backbone.View);

}).call(this);
