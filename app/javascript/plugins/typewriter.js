import Typewriter from 'typewriter-effect/dist/core';

export const initTypewriter = new Typewriter('#typewriter', {
    strings: ['visualisation.', 'navigation.', 'collaboration.'],
    autoStart: true,
    loop: true,
    delay: 90,
    deleteSpeed: 35
});
