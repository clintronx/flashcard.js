(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.Router = (function(_super) {

    __extends(Router, _super);

    function Router() {
      Router.__super__.constructor.apply(this, arguments);
    }

    Router.prototype.routes = {
      "": "index",
      "flashcard/deck/:name": "deck",
      "flashcard/decks": "decks"
    };

    Router.prototype.events = "";

    Router.prototype.initialize = function() {
      return this.decksProperties = new app.collection.DecksProperties();
    };

    Router.prototype.index = function() {
      var decksView;
      decksView = new app.view.DecksView({
        collection: this.decksProperties
      });
      return $('body').append(decksView.render().el);
    };

    Router.prototype.deck = function(name) {
      var cards,
        _this = this;
      $('.deck').remove();
      cards = new app.collection.Cards([], {
        name: name
      });
      return cards.fetch({
        reset: true,
        success: function(collection, response, options) {
          var el;
          el = $('<div class="deck">');
          collection.each(function(card) {
            var cardView;
            cardView = new app.view.CardView({
              model: card
            });
            return el.append(cardView.render().el);
          });
          return $('body').append(el);
        }
      });
    };

    return Router;

  })(Backbone.Router);

}).call(this);
