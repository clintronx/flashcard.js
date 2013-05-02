/*global document, console, setTimeout, clearTimeout */
/*jslint plusplus: true */

(function(){ window.app = {}; })();

/*
(function () {
    'use strict';

    var card = document.querySelector('p#card'),
        nextCard = document.querySelector('#next_card'),
        prevCard = document.querySelector('#prev_card'),
        library = document.querySelector('#library'),
        index = document.querySelector('#index'),
        sideLabel = document.querySelector('#side'),
        input = JSON.parse(document.querySelector('section#input textarea').value),
        FRONT = 0,
        BACK = 1,
        list = [],
        current = 0,
        side = FRONT,
        activeID = {};
    
    function resetLibrary() {
        list = [];
        input = JSON.parse(document.querySelector('section#input textarea').value);
        list = Object.keys(input);
        current = 0;
        index.innerText = '1/' + list.length;
    }
    
    function toggleSideLabel() {
        sideLabel.hidden = false;
        setTimeout(function () {sideLabel.hidden = true; }, 750);
    }
        
    function flipClickEvent() {
        var front = list[current], c = input[front], back = c.back;
        
        switch (side) {
        case FRONT:
            card.innerText = back;
            side = BACK;
            sideLabel.innerText = 'back';
            break;
        case BACK:
            card.innerText = front;
            side = FRONT;
            sideLabel.innerText = 'front';
            break;
        default:
            side = FRONT;
            sideLabel.innerText = 'front';
        }
        
        toggleSideLabel();
    }
    
    function jsonClickEvent() {
        var json = document.querySelector('section#input textarea');
        
        if (json.hidden) {
            json.hidden = false;
        } else {
            json.hidden = true;
        }
    }
    
    function jsonBlurEvent() {
        var textarea = document.querySelector('section#input textarea');
        textarea.value = JSON.stringify(JSON.parse(textarea.value), null, 2);
        resetLibrary();
        
        if (side === FRONT) {
            side = BACK;
        } else {
            side = FRONT;
        }
        flipClickEvent();
    }
    
    function nextCardEvent() {
        side = FRONT;
        if (current >= list.length - 1) {
            current = 0;
        } else {
            current++;
        }
        
        card.innerText = list[current];
        sideLabel.innerText = 'front';
        index.innerText = current + 1 + '/' + list.length;
        
        toggleSideLabel();
    }
    
    function prevCardEvent() {
        side = FRONT;
        if (current <= 0) {
            current = list.length - 1;
        } else {
            current--;
        }
        
        card.innerText = list[current];
        sideLabel.innerText = 'front';
        index.innerText = current + 1 + '/' + list.length;
        
        toggleSideLabel();
    }
    
    
    function callback(label, e, className, delay) {
        
        function removeClass(e, className) {
            e.target.classList.remove(className);
        }
        
        function addClass(e, className) {
            e.target.classList.add(className);
        }
        
        function closure() {
            removeClass(e, className);
            delete activeID[label];
        }
        
        addClass(e, className);
        clearTimeout(activeID[label]);
        activeID[label] = setTimeout(closure, delay);
    }
     
    resetLibrary();
    card.addEventListener('click', flipClickEvent);
    nextCard.addEventListener('click', nextCardEvent);
    prevCard.addEventListener('click', prevCardEvent);
    library.addEventListener('click', jsonClickEvent);
    
    document.querySelector('section#input textarea').addEventListener('blur', jsonBlurEvent);
    nextCard.addEventListener('mouseover', function (e) {
        var className = 'next_background';
        callback('nextCard', e, className, 750);
    });
    prevCard.addEventListener('mouseover', function (e) {
        var className = 'prev_background';
        callback('prevCard', e, className, 750);
    });
    library.addEventListener('mouseover', function (e) {
        var className = 'show';
        callback('library', e, className, 750);
    });
   
    jsonBlurEvent();
    side = BACK;
    flipClickEvent();
}());
*/