const viewDatabaseButton = document.getElementById("view-database-button");
const addCollaboratorButton = document.getElementById("add-collaborator-button");
const addDatabaseButton = document.getElementById("add-database-button");

if (viewDatabaseButton) {
    // Toggle SCSS classes to make "add database" go gray
    addDatabaseButton.classList.remove("btn-treehosue");
    addDatabaseButton.classList.add("btn-cancel");
} else {
    addDatabaseButton.classList.add("btn-treehosue");
    addDatabaseButton.classList.remove("btn-cancel");
}
