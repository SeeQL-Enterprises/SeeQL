var signupButton = document.querySelector('#signup-button-sidebar');
var signupErrors = document.querySelector('.signupErrorsList');

var loginButton = document.querySelector('#login-button-sidebar');
var loginErrors = document.querySelector('.loginErrors');

signupButton.addEventListener("click", () => {
    $(signupErrors).empty();
});

loginButton.addEventListener("click", () => {
    loginErrors.innerHTML = "";
});
