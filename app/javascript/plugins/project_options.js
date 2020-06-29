if (document.getElementsByClassName('project-options-icon')) {

    const projectOptionsIcons = document.getElementsByClassName('project-options-icon');
    const projectOptionsDropdown = document.getElementById('card-project-options-dropdown');

    for(let i = 0; i < projectOptionsIcons.length; i++) {

        projectOptionsIcons[i].addEventListener("click", () => {

            $(projectOptionsDropdown).fadeToggle(400);

            setTimeout(() => {
                $(projectOptionsDropdown).fadeOut(500)
            }, 4000);

        });
    }
}
