define [
  "backbone"
], (Backbone) ->

  class Card extends Backbone.Model

    defaults:
      name: ""
      front: 'front',  #content on front of card
      back: 'back',    #content on back of card
      viewing: 'front' #current side user is viewing: front|back

    toggle: =>
      switch @.get 'viewing'
        when 'front' then @.set viewing: 'back'
        when 'back' then @.set viewing: 'front'

    getText: =>
      return @.get @.get('viewing')
