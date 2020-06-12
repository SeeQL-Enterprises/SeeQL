import Typewriter from 'typewriter-effect/dist/core';

export const initTypewriter = new Typewriter('#typewriter', {
    strings: ['visualisation.', 'navigation.', 'collaboration.'],
    autoStart: true,
    loop: true,
    delay: 92,
    deleteSpeed: 37
});
