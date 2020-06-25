const viewDatabaseButton = document.getElementById("view-database-button");
const addDatabaseButton = document.getElementById("add-database-button");
const databaseForm = document.getElementById("database-form");

if (addDatabaseButton) {
    addDatabaseButton.addEventListener("click", () => {

        // Check present classes
        if (!viewDatabaseButton) {
            // Toggle SCSS classes to turn from SeeQL to gray
            addDatabaseButton.classList.toggle("btn-seeql");
            addDatabaseButton.classList.toggle("btn-cancel");
        }

        // Check inner text and change accordingly
        if (addDatabaseButton.innerHTML === "<i class=\"fas fa-database\"></i> Add Database") {
            addDatabaseButton.innerHTML = "Cancel";
        } else {
            addDatabaseButton.innerHTML = "<i class=\"fas fa-database\"></i> Add Database";
        }

        // Unfocus the button after pressing
        addDatabaseButton.blur();

        // ----- Dropdown -----

        // Toggle between invisible and visible using Bootstrap class "d-none"
        databaseForm.classList.toggle("active");
    });
}
