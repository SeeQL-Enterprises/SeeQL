const selectAllBtn = document.querySelector('#select-all');
const btnText = document.querySelector('#select-all-text');
let buttons = document.querySelectorAll(".form-check");

buttons.forEach((button) => {
    button.addEventListener("click", function toggleAllButtons(event) {

        const toggle = event.currentTarget.firstElementChild

        event.currentTarget.classList.toggle("on");

        if (toggle.checked === true) {

            toggle.checked = false;

        } else {

            toggle.checked = true;

        }
    })
});

const changeVisiblesOn = () => {

    buttons = document.querySelectorAll(".form-check");

    buttons.forEach((button) => {

        button.classList.add("on");

    });
}

const changeVisiblesOff = () => {

    buttons = document.querySelectorAll(".form-check");

    buttons.forEach((button) => {

        button.classList.remove("on");

    });
}

const selectAllInputs = () => {

    const toggles = document.querySelectorAll('.form-check-input');

    if (btnText.innerText === "Select all") {

        toggles.forEach((toggle) => {

            const checkToggle = toggle;

            checkToggle.checked = true;
            btnText.innerText = 'Unselect all';

            changeVisiblesOn();

        })

    } else {

        toggles.forEach((toggle) => {

            const checkToggle = toggle;

            checkToggle.checked = false;
            btnText.innerText = 'Select all';

            changeVisiblesOff();

        });
    }
}

if (selectAllBtn) {
    selectAllBtn.addEventListener('click', selectAllInputs);
}
