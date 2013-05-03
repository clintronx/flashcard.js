(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.AdvanceDeckView = (function(_super) {

    __extends(AdvanceDeckView, _super);

    function AdvanceDeckView() {
      this.cleanup = __bind(this.cleanup, this);
      this.show = __bind(this.show, this);
      this.showPrev = __bind(this.showPrev, this);
      this.showNext = __bind(this.showNext, this);
      this.advance = __bind(this.advance, this);
      AdvanceDeckView.__super__.constructor.apply(this, arguments);
    }

    AdvanceDeckView.prototype.initialize = function() {
      return this.activeID = {};
    };

    AdvanceDeckView.prototype.template = function() {
      return _.template('' + '<div id="prev_card"></div>' + '<div id="next_card"></div>');
    };

    AdvanceDeckView.prototype.render = function() {
      return this.$el.append(this.template());
    };

    AdvanceDeckView.prototype.events = function() {
      return {
        "click #next_card": "next",
        "click #prev_card": "prev",
        "mouseover #next_card": "showNext",
        "mouseover #prev_card": "showPrev"
      };
    };

    AdvanceDeckView.prototype.advance = function() {};

    AdvanceDeckView.prototype.showNext = function() {
      return this.show($('#next_card'), 'next_background');
    };

    AdvanceDeckView.prototype.showPrev = function() {
      return this.show($('#prev_card'), 'prev_background');
    };

    AdvanceDeckView.prototype.show = function(el, className, delay) {
      var _this = this;
      if (delay == null) {
        delay = 750;
      }
      console.log("show " + className);
      el.addClass(className);
      clearTimeout(this.activeID[className]);
      return this.activeID[className] = setTimeout((function() {
        return _this.cleanup(el, className);
      }), delay);
    };

    AdvanceDeckView.prototype.next = function() {
      return console.log("next");
    };

    AdvanceDeckView.prototype.prev = function() {
      return console.log("prev");
    };

    AdvanceDeckView.prototype.cleanup = function(el, className) {
      console.log("cleanup " + className);
      el.removeClass(className);
      return delete this.activeID[className];
    };

    return AdvanceDeckView;

  })(Backbone.View);

}).call(this);
