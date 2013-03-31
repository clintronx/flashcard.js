/*global document, console, setTimeout */
/*jslint plusplus: true */
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
        side = FRONT;
    
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
        sideLabel.innerText = 'front';
        if (current >= list.length - 1) {
            current = 0;
        } else {
            current++;
        }
        
        card.innerText = list[current];
        index.innerText = current + 1 + '/' + list.length;
        
        toggleSideLabel();
    }
    
    function prevCardEvent() {
        side = FRONT;
        sideLabel.innerText = 'front';
        if (current <= 0) {
            current = list.length - 1;
        } else {
            current--;
        }
        
        card.innerText = list[current];
        index.innerText = current + 1 + '/' + list.length;
        
        toggleSideLabel();
    }
    
    function removeClass(e, className) {
        e.target.classList.remove(className);
    }
    
    function addClass(e, className) {
        e.target.classList.add(className);
    }
     
    resetLibrary();
    card.addEventListener('click', flipClickEvent);
    nextCard.addEventListener('click', nextCardEvent);
    prevCard.addEventListener('click', prevCardEvent);
    library.addEventListener('click', jsonClickEvent);
    
    document.querySelector('section#input textarea').addEventListener('blur', jsonBlurEvent);
    nextCard.addEventListener('mouseover', function (e) {
        var className = 'next_background';
        addClass(e, className);
        setTimeout(removeClass, 750, e, className);
    });
    prevCard.addEventListener('mouseover', function (e) {
        var className = 'prev_background';
        addClass(e, className);
        setTimeout(removeClass, 750, e, className);
    });
    library.addEventListener('mouseover', function (e) {
        var className = 'show';
        addClass(e, className);
        setTimeout(removeClass, 750, e, className);
    });
   
    jsonBlurEvent();
    side = BACK;
    flipClickEvent();
}());