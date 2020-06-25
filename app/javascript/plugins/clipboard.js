// This makes sure we have imported the initPopover function
import initPopover from './popover';

const clipboardButton = document.getElementById("clipboard-button")

// This function handles copying a given String to the clipboard, it takes the String as a parameter
function copyTextToClipboard(text) {
    navigator.clipboard.writeText(text).then(

        function copySuccess() {

            // console.log("Async: Copying to clipboard was successful!");

            // Initializes the popover only when necessary and then sets "data-content"
            initPopover();
            clipboardButton.setAttribute("data-content", "URL has been copied to clipboard!");

            $(clipboardButton).popover("show");
        },

        function copyError(/* err */) {

            // console.error("Async: Could not copy text: ", err);

            // Same as above, but with an error message
            initPopover();
            clipboardButton.setAttribute("data-content", "URL could not be copied to clipboard!");

            $(clipboardButton).popover("show");
        }

    );
}

// Calling the above function with our URL as the String
clipboardButton.addEventListener("click", function copyTextToClipboardEventListener() {
    copyTextToClipboard("https://www.seeql.dev/");
});
