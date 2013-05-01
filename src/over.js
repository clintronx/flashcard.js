/*global setTimeout, clearTimeout */
/*
interface
    library.addEventListener('mouseover', function (e) {
        var className = 'show';
        callback('library', e, className, 750);
    });
    
    on mouseover addClass and setTimeout of 750ms to remove that class
    keep track of the active event and clear the old event on a new event
    
*/

(function () {
    'use strict';
    
    var activeID = {};
    
    function removeClass(e, className) {
        e.target.classList.remove(className);
    }
    
    function addClass(e, className) {
        e.target.classList.add(className);
    }
    
    function callback(label, e, className, delay) {
        function closure() {
            removeClass(e, className);
            delete activeID[label];
        }
        
        addClass(e, className);
        clearTimeout(activeID[label]);
        activeID[label] = setTimeout(closure, delay);
    }
    
}());
