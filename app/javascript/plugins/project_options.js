if (document.getElementsByClassName('project-options-icon')) {

    const projectOptionsIcons = document.getElementsByClassName('project-options-icon');
    const projectOptionsDropdowns = document.querySelectorAll('#card-project-options-dropdown');

    for(let i = 0; i < projectOptionsIcons.length; i++) {
        projectOptionsDropdowns[i].id = `card-project-options-dropdown-${[i]}`;

        projectOptionsIcons[i].addEventListener('click', () => {

            $(`#card-project-options-dropdown-${[i]}`).fadeToggle(400);

            setTimeout(() => {
                $(`#card-project-options-dropdown-${[i]}`).fadeOut(500)
            }, 4000);

        });
    }
}
