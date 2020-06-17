var signupButton = document.querySelector('#signup-button');
var signupErrors = document.querySelector('.signupErrorsList');

var loginButton = document.querySelector('#login-button');
var loginErrors = document.querySelector('.loginErrors');

signupButton.addEventListener("click", () => {
    $(signupErrors).empty();
});

loginButton.addEventListener("click", () => {
    loginErrors.innerHTML = "";
});
