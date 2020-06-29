if (document.getElementsByClassName('project-options-icon')) {

    const projectOptionsIcons = document.getElementsByClassName('project-options-icon');

    for(let i = 0; i < projectOptionsIcons.length; i++) {

        projectOptionsIcons[i].addEventListener("click", () => {

            console.log("test");

        });
    }
}
