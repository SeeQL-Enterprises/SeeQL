if (document.getElementById("user-avatar")) {

    const userAvatar = document.getElementById("user-avatar");

    userAvatar.onchange = function avatarPreview(userFile) {

        const avatarPreviewImage = document.getElementById("avatar-preview-image");
        const previewAvatarButtonText = document.getElementById("avatar-preview-button-text");
        const fileContent = userFile.srcElement.files[0];
        const reader = new FileReader();

        reader.onload = function thumbnail(event) {

            // Get loaded data and render a thumbnail
            avatarPreviewImage.src = event.target.result;
            previewAvatarButtonText.innerText = fileContent.name;

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
        const previewImageButtonText = document.getElementById("project-image-button-text");
        const fileContent = userFile.srcElement.files[0];
        const reader = new FileReader();

        reader.onload = function thumbnail(event) {

            // Get loaded data and render a thumbnail,
            // then set the button's text to the name of the file
            previewImage.src = event.target.result;
            previewImageButtonText.innerHTML = fileContent.name;
            previewImage.style = "object-fit: cover";

        };

        // Read the image file as a data URL
        reader.readAsDataURL(this.files[0]);
    };

}
