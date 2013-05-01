/*jslint nomen: true*/
/*global Backbone,_,$,console*/
var CardView = Backbone.View.extend({
    tagName: 'section',
    id: 'view',
    template: _.template('<p id="card"><% if(current === "front"){ %> <%= front %><% }else{ %><%= back %><% } %></p>'),
    render: function () {
        'use strict';
        this.$el.html(this.template(this.model.toJSON()));
    },
    initialize: function () {
        'use strict';
        this.model.on('change', this.render, this);
    },
    events: {
        "click #card": "toggleCard"
    },
    toggleCard: function (e) {
        'use strict';
        this.model.toggleCard();
    }
});