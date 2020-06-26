if (document.getElementById("help-button")) {
    const helpButton = document.getElementById("help-button")

    helpButton.addEventListener("click", () => {
        const helpNestedList = document.getElementById("help-nested-list")

        if (helpNestedList.style.maxHeight !== "102px") {

            helpNestedList.style.maxHeight = "102px";
            helpButton.blur();

        } else {

            helpNestedList.style.maxHeight = "0px";
            helpButton.blur();

        }
    });
}
