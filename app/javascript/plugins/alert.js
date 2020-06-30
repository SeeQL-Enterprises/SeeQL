if (document.getElementById("alert")) {
    const alert = document.getElementById("alert");

    setTimeout(function fadeAlert() {
        alert.style = "opacity: 0";
    }, 5000);
}
