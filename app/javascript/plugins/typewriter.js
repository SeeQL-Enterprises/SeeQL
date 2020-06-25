import Typewriter from 'typewriter-effect/dist/core';

const initTypewriter = () => {
    const typewriter = new Typewriter('#typewriter', {
        loop: true,
        delay: 92,
        deleteSpeed: 72
    });

    return typewriter;
}

export default initTypewriter;
