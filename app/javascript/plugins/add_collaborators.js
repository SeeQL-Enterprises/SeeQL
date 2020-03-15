const addCollaboratorButton = document.getElementById("add-collaborator-button");
const collaboratorForm = document.getElementById("collaborator-form");

if (addCollaboratorButton) {
    addCollaboratorButton.addEventListener("click", () => {

        // Toggle Bootstrap classes to turn from white to red
        addCollaboratorButton.classList.toggle("btn-treehouse");
        addCollaboratorButton.classList.toggle("btn-cancel");

        // Check inner text and change accordingly
        if (addCollaboratorButton.innerHTML === "<i class=\"fas fa-user-plus\"></i> Choose Collaborators") {
            addCollaboratorButton.innerHTML = "Cancel";
        } else {
            addCollaboratorButton.innerHTML = "<i class=\"fas fa-user-plus\"></i> Choose Collaborators";
        }

        // Unfocus the button after pressing
        addCollaboratorButton.blur();

        // ----- Dropdown -----

        // Toggle between invisible and visible using Bootstrap class "d-none"
        collaboratorForm.classList.toggle("active");
    });
}
