(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.CardView = (function(_super) {

    __extends(CardView, _super);

    function CardView() {
      this.render = __bind(this.render, this);
      CardView.__super__.constructor.apply(this, arguments);
    }

    CardView.prototype.tagName = 'section';

    CardView.prototype.id = 'view';

    CardView.prototype.template = _.template('' + '<p id="card">' + '<% if(current === "front"){ %>' + '<%= front %>' + '<% }else{ %><' + '%= back %><% } %>' + '</p>');

    CardView.prototype.render = function() {
      return this.$el.html(this.template(this.model.toJSON()));
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
