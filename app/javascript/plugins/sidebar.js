const menu = document.getElementById( "#sidebar" );
const menuIcon = document.querySelector( "#burger-menu" );
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
