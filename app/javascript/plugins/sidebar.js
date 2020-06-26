const sidebar = document.getElementById( "sidebar" );
const sidebarIcon = document.getElementById( "sidebar-opener" );
const sidebarText = document.getElementsByClassName("sidebar-text");
const signupButtonForm = document.querySelector('#signup-button-form');
const loginButtonForm = document.querySelector('#login-button-form');

sidebarIcon.addEventListener( "click", () => {

    if (sidebar.classList.contains('open')) {

        $(sidebarText).fadeOut(700);
        sidebar.classList.remove('open');

    } else {

        sidebar.classList.add('open');
        $(sidebarText).fadeIn(700);

    }

});

// Make sure that submitting login/signup forms will close the menu
signupButtonForm.addEventListener("click", () => {

    sidebar.classList.remove('open');

});

loginButtonForm.addEventListener("click", () => {

    sidebar.classList.remove('open');

});
