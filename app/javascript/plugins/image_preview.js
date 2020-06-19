if (document.getElementById("user_avatar")) {

    var userAvatar = document.getElementById("user_avatar")

    userAvatar.onchange = function () {
        var reader = new FileReader();

        reader.onload = function (event) {
            // Get loaded data and render a thumbnail
            document.getElementById("avatar-preview-image").src = event.target.result;
        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);

    }
} else if (document.getElementById("project_project_image")) {

    var projectImage = document.getElementById("project_project_image")

    projectImage.onchange = function () {
        var reader = new FileReader();

        reader.onload = function (event) {
            // Get loaded data and render a thumbnail
            document.getElementById("project-preview-image").src = event.target.result;
            document.getElementById("project-preview-image").style = "object-fit: cover";
        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);

    }
}
