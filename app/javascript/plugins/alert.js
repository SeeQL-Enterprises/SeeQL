if (document.getElementById("alert")) {
    const alert = document.getElementById("alert");

    setTimeout(function fadeAlert() {
        $(alert).fadeOut();
    }, 5000);
}
