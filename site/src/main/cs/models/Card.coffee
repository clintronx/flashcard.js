class app.model.Card extends Backbone.Model
  
  defaults:
    name: ""
    front: 'front',  #content on front of card
    back: 'back',    #content on back of card
    viewing: 'front' #current side user is viewing: front|back
    id: 0

  initialize: (options) ->
    _.extend @, options

  url: () => "deck/#{@name}/#{@id}"
  
  toggleCard: ->
    switch @.get 'viewing'
      when 'front' then @.set viewing: 'back'
      when 'back' then @.set viewing: 'front'