const sidebar = document.getElementById( "sidebar" );
const sidebarIcon = document.getElementById( "sidebar-opener" );
const bodyBackground = document.querySelector( "#body" );

const signupButtonForm = document.querySelector('#signup-button-form');
const loginButtonForm = document.querySelector('#login-button-form');

sidebarIcon.addEventListener( "click", () => {
    sidebar.classList.contains('open') ? sidebar.classList.remove('open') : sidebar.classList.add('open');
});

signupButtonForm.addEventListener("click", () => {
    sidebar.classList.remove('open');
});

loginButtonForm.addEventListener("click", () => {
    sidebar.classList.remove('open');
});
