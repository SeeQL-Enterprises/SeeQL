if (document.getElementById("user_avatar")) {

    var userAvatar = document.getElementById("user_avatar");

    userAvatar.onchange = function () {

        var avatarPreview = document.getElementById("avatar-preview-image");
        var previewAvatarButton = document.getElementById("avatar-preview-button");
        var file = event.srcElement.files[0];
        var reader = new FileReader();

        reader.onload = function (event) {

            // Get loaded data and render a thumbnail
            avatarPreview.src = event.target.result;
            previewAvatarButton.innerHTML = file.name;

        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);

    };

} else if (document.getElementById("project_image")) {

    var projectImage = document.getElementById("project_image");

    projectImage.onchange = function (event) {

        // Define the image preview, the button below it,
        // the file that was uploaded and a new FileReader instance
        var previewImage = document.getElementById("project-preview-image");
        var previewImageButton = document.getElementById("project-image-button");
        var file = event.srcElement.files[0];
        var reader = new FileReader();

        reader.onload = function (event) {

            // Get loaded data and render a thumbnail,
            // then set the button's text to the name of the file
            previewImage.src = event.target.result;
            previewImageButton.innerHTML = file.name;
            previewImage.style = "object-fit: cover";

        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);
    };

}
