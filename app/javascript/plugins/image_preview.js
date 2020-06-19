if (document.getElementById("user-avatar")) {

    const userAvatar = document.getElementById("user-avatar");

    userAvatar.onchange = function avatarPreview(userFile) {

        const avatarPreviewImage = document.getElementById("avatar-preview-image");
        const previewAvatarButton = document.getElementById("avatar-preview-button");
        const fileContent = userFile.srcElement.files[0];
        const reader = new FileReader();

        reader.onload = function thumbnail(event) {

            // Get loaded data and render a thumbnail
            avatarPreviewImage.src = event.target.result;
            previewAvatarButton.innerHTML = fileContent.name;

        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);

    };

} else if (document.getElementById("project-image")) {

    const projectImage = document.getElementById("project-image");

    projectImage.onchange = function projectImagePreview(userFile) {

        // Define the image preview, the button below it,
        // the file that was uploaded and a new FileReader instance
        const previewImage = document.getElementById("project-preview-image");
        const previewImageButton = document.getElementById("project-image-button");
        const fileContent = userFile.srcElement.files[0];
        const reader = new FileReader();

        reader.onload = function thumbnail(event) {

            // Get loaded data and render a thumbnail,
            // then set the button's text to the name of the file
            previewImage.src = event.target.result;
            previewImageButton.innerHTML = fileContent.name;
            previewImage.style = "object-fit: cover";

        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);
    };

}
