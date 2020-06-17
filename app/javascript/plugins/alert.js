if (document.getElementById("alert")) {
    var alert = document.getElementById("alert")

    setTimeout(function() {
        $(alert).fadeOut();
    }, 5000);
}
