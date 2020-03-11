const addCollaboratorButton = document.getElementById("add-collaborator-button");
const collaboratorForm = document.getElementById("collaborator-form");

addCollaboratorButton.addEventListener("click", () => {

    // Toggle Bootstrap classes to turn from white to red
    addCollaboratorButton.classList.toggle("btn-treehouse");
    addCollaboratorButton.classList.toggle("btn-cancel");

    // Check inner text and change accordingly
    if (addCollaboratorButton.innerText === "Choose Collaborators") {
    addCollaboratorButton.innerText = "Cancel";
    } else {
    addCollaboratorButton.innerText = "Choose Collaborators";
    }

    // Unfocus the button after pressing
    addCollaboratorButton.blur();

    // ----- Dropdown -----

    // Toggle between invisible and visible using Bootstrap class "d-none"
    collaboratorForm.classList.toggle("active");
});
