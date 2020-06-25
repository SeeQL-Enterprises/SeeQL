const signupErrors = document.querySelector('.signup-errors-list');
const loginErrors = document.querySelector('.loginErrors');

if (document.querySelector('#signup-button-sidebar')) {
    const signupButton = document.querySelector('#signup-button-sidebar');

    signupButton.addEventListener("click", () => {
        $(signupErrors).empty();
    });
}

if (document.querySelector('#login-button-sidebar')) {
    const loginButton = document.querySelector('#login-button-sidebar');

    loginButton.addEventListener("click", () => {
        loginErrors.innerHTML = "";
    });
}
