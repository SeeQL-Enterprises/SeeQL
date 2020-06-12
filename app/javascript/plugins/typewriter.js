import Typewriter from 'typewriter-effect/dist/core';

export const initTypewriter = () => {
    const typewriter = new Typewriter('#typewriter', {
        loop: true,
        delay: 92,
        deleteSpeed: 72
    });

    return typewriter;
}
