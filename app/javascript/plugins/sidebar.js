const sidebar = document.getElementById( "sidebar" );
const sidebarIcon = document.getElementById( "sidebar-opener" );
const sidebarText = document.getElementById("sidebar-text");
const signupButtonForm = document.querySelector('#signup-button-form');
const loginButtonForm = document.querySelector('#login-button-form');

sidebarIcon.addEventListener( "click", () => {

    if (sidebar.classList.contains('open')) {

        $(sidebarText).addClass("hidden").fadeOut(200);

        setTimeout(() => {
            sidebar.classList.remove('open');
        }, 200);

    } else {

        sidebar.classList.add('open');
        $(sidebarText).removeClass('hidden').fadeIn(200);

    }

});

// Make sure that submitting login/signup forms will close the menu
signupButtonForm.addEventListener("click", () => {

    sidebar.classList.remove('open');

});

loginButtonForm.addEventListener("click", () => {

    sidebar.classList.remove('open');

});
