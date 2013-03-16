/*global document, console */
/*jslint plusplus: true */
(function () {
    'use strict';
    
    try {
        var flip = document.querySelector('button#flip'),
            json = document.querySelector('button#json'),
            next = document.querySelector('button#next'),
            card = document.querySelector('pre#card'),
            input = JSON.parse(document.querySelector('section#input textarea').value),
            FRONT = 0,
            BACK = 1,
            list = [],
            current = 0,
            side = FRONT,
            resetLibrary,
            flipClickEvent,
            jsonClickEvent,
            jsonBlurEvent,
            nextCardEvent;
        
        resetLibrary = function () {
            var key;
            list = [];
            input = JSON.parse(document.querySelector('section#input textarea').value);
            for (key in input) {
                if (input.hasOwnProperty(key)) {
                    list.push(key);
                }
            }
        };
            
        flipClickEvent = function () {
            var front = list[current], c = input[front], back = c.back;
            
            switch (side) {
            case FRONT:
                card.innerText = back;
                side = BACK;
                break;
            case BACK:
                card.innerText = front;
                side = FRONT;
                break;
            default:
                side = FRONT;
            }
        };
        
        jsonClickEvent = function () {
            var json = document.querySelector('section#input');
            
            if (json.hidden) {
                json.hidden = false;
            } else {
                json.hidden = true;
            }
        };
        
        jsonBlurEvent = function () {
            var textarea = document.querySelector('section#input textarea');
            textarea.value = JSON.stringify(JSON.parse(textarea.value), null, 2);
            resetLibrary();
            
            if (side === FRONT) {
                side = BACK;
            } else {
                side = FRONT;
            }
            flipClickEvent();
        };
        
        nextCardEvent = function () {
            side = FRONT;
            if (current >= list.length - 1) {
                current = 0;
            } else {
                current++;
            }
            
            card.innerText = list[current];
        };
        
        resetLibrary();
        flip.addEventListener('click', flipClickEvent);
        card.addEventListener('click', flipClickEvent);
        json.addEventListener('click', jsonClickEvent);
        next.addEventListener('click', nextCardEvent);
        document.querySelector('section#input textarea').addEventListener('blur', jsonBlurEvent);
       
        jsonBlurEvent();
        side = BACK;
        flipClickEvent();
    } catch (e) {
        console.log(e);
    }
}());