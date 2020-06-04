import { initPopover } from '../plugins/popover';

const clipboardButton = document.getElementById("clipboard-button")

function copyTextToClipboard(text) {
    navigator.clipboard.writeText(text).then(
        function () {
            console.log("Async: Copying to clipboard was successful!");

            initPopover();
            clipboardButton.setAttribute("data-content", "URL has been copied to clipboard!");

            $(clipboardButton).popover("show");
        },
        function (err) {
            console.error("Async: Could not copy text: ", err);

            initPopover();
            clipboardButton.setAttribute("data-content", "URL could not be copied to clipboard!");

            $(clipboardButton).popover("show");
        }
    );
}

clipboardButton.addEventListener("click", function (event) {
    copyTextToClipboard("https://www.seeql.dev/");
});
