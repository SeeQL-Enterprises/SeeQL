if (document.getElementById("user_avatar")) {
    var userAvatar = document.getElementById("user_avatar")

    userAvatar.onchange = function () {
        var reader = new FileReader();

        reader.onload = function (event) {
            // Get loaded data and render a thumbnail
            document.getElementById("avatar-preview").src = event.target.result;
        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);
    }
}
