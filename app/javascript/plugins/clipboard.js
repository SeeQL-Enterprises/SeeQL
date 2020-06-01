const clipboardButton = document.getElementById("clipboard-button")

function copyTextToClipboard(text) {
    // if (!navigator.clipboard) {
    //     fallbackCopyTextToClipboard(text);
    //     return;
    // }

    navigator.clipboard.writeText(text).then(
        function () {
            console.log("Async: Copying to clipboard was successful!");
        },
        function (err) {
            console.error("Async: Could not copy text: ", err);
        }
    );
}

clipboardButton.addEventListener("click", function (event) {
    copyTextToClipboard("https://www.seeql.dev/");
});
