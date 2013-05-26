class app.model.Card extends Backbone.Model
 
  defaults:
    name: ""
    front: 'front',  #content on front of card
    back: 'back',    #content on back of card
    viewing: 'front' #current side user is viewing: front|back

  initialize: (options) ->
    _.extend @, options
  
  toggleCard: ->
    switch @.get 'viewing'
      when 'front' then @.set viewing: 'back'
      when 'back' then @.set viewing: 'front'

  isViewing: (guess) =>
    return true if @.get('viewing') is guess
    return false