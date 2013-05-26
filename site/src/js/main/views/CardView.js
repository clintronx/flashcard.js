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

    CardView.prototype.className = 'small';

    CardView.prototype.attributes = function() {
      return {
        "data-view": this.model.get('viewing')
      };
    };

    CardView.prototype.render = function() {
      this._renderText();
      return this;
    };

    CardView.prototype.initialize = function() {
      return this.model.on('change', this.render, this);
    };

    CardView.prototype._renderText = function() {
      var ctx, line, lineHeight, maxWidth, metrics, padding, testLine, testWidth, word, words, x, y, _i, _len;
      ctx = this.el.getContext('2d');
      ctx.setTransform(1, 0, 0, 1, 0, 0);
      ctx.clearRect(0, 0, this.el.width, this.el.height);
      padding = 15;
      maxWidth = this.el.width - padding;
      lineHeight = 25;
      x = (this.el.width - maxWidth) / 2;
      y = padding;
      ctx.font = '12pt Times';
      ctx.fillStyle = '#333';
      if (this.model.isViewing('back')) {
        words = this.model.get('back').split(' ');
      }
      if (this.model.isViewing('front')) {
        words = this.model.get('front').split(' ');
      }
      line = '';
      for (_i = 0, _len = words.length; _i < _len; _i++) {
        word = words[_i];
        testLine = "" + line + word + " ";
        metrics = ctx.measureText(testLine);
        testWidth = metrics.width;
        if (testWidth > maxWidth) {
          ctx.fillText(line, x, y);
          line = "" + word + " ";
          y += lineHeight;
        } else {
          line = testLine;
        }
      }
      return ctx.fillText(line, x, y);
    };

    CardView;

    CardView.prototype.events = {
      "click": "toggleCard"
    };

    CardView.prototype.toggleCard = function() {
      this.model.toggleCard();
      return this.render();
    };

    return CardView;

  })(Backbone.View);

}).call(this);
