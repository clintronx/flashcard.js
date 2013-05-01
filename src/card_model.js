/*global Backbone,console*/
var Card = Backbone.Model.extend({
    defaults: {
        front: 'front',  //content on front of card
        back: 'back',    //content on back of card
        current: 'front' //current side user is viewing: front|back
    },
    toggleCard: function () {
        'use strict';
        switch (this.get('current')) {
        case 'front':
            this.set({current: 'back'});
            break;
        case 'back':
            this.set({current: 'front'});
            break;
        }
        //this.save();
    }
});
