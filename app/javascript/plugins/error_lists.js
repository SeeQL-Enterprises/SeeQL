var signupErrors = document.querySelector('.signupErrorsList');
var loginErrors = document.querySelector('.loginErrors');

if (document.querySelector('#signup-button-sidebar')) {
    var signupButton = document.querySelector('#signup-button-sidebar');

    signupButton.addEventListener("click", () => {
        $(signupErrors).empty();
    });
}

if (document.querySelector('#login-button-sidebar')) {
    var loginButton = document.querySelector('#login-button-sidebar');

    loginButton.addEventListener("click", () => {
        loginErrors.innerHTML = "";
    });
}
