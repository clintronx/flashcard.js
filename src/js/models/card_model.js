(function() {

  app.Card = Backbone.Model.extend({
    defaults: {
      front: 'front',
      back: 'back',
      current: 'front'
    },
    toggleCard: function() {
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
    }
  });

}).call(this);
