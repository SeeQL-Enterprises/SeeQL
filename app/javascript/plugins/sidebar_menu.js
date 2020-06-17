const menu = document.querySelector( "#my-sidenav" );
const menuIcon = document.querySelector( "#my-burger-menu" );
const bodyBackground = document.querySelector( "#body" );

const signupButtonForm = document.querySelector('#signup-button-form');
const loginButtonForm = document.querySelector('#login-button-form');

menuIcon.addEventListener( "click", () => {
    menu.classList.contains('open') ? menu.classList.remove('open') : menu.classList.add('open');
});

signupButtonForm.addEventListener("click", () => {
    menu.classList.remove('open');
});

loginButtonForm.addEventListener("click", () => {
    menu.classList.remove('open');
});
