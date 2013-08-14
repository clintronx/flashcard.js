define [
  "backbone"
], (Backbone) ->

  class Deck extends Backbone.Model

    defaults:
      name: ""
      size: "0"
      starred: []
      current: 0
