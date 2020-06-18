if (document.getElementById("avatar-upload")) {
    var userAvatar = document.getElementById("avatar-upload")

    userAvatar.onchange = function () {
        var reader = new FileReader();

        reader.onload = function (event) {
            // Get loaded data and render a thumbnail
            document.getElementById("avatar-preview-image").src = event.target.result;
        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);
    }
}
