app.Card = Backbone.Model.extend
  
  defaults:
    front: 'front',  #content on front of card
    back: 'back',    #content on back of card
    current: 'front' #current side user is viewing: front|back
  
  toggleCard: ->
    switch @.get('current')
      when 'front' then @.set current: 'back'
      when 'back' then @.set current: 'front'
      #this.save();