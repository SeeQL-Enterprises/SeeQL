const addCollaboratorButton = document.getElementById("add-collaborator-button");
const collaboratorForm = document.getElementById("collaborator-form");

addCollaboratorButton.addEventListener("click", () => {

    // Toggle Bootstrap classes to turn from white to red
    addCollaboratorButton.classList.toggle("btn-light");
    addCollaboratorButton.classList.toggle("btn-danger");

    // Check inner text and change accordingly
    if (addCollaboratorButton.innerText === "Add Collaborator") {
    addCollaboratorButton.innerText = "Cancel";
    } else {
    addCollaboratorButton.innerText = "Add Collaborator";
    }

    // Unfocus the button after pressing
    addCollaboratorButton.blur();

    // ----- Dropdown -----

    // Toggle between invisible and visible using Bootstrap class "d-none"
    collaboratorForm.classList.toggle("active");
});
