selectAllBtn = document.querySelector('#select_all');

buttons = document.querySelectorAll(".form-check");
buttons.forEach((button) => {
  button.addEventListener("click", function(event) {
    button.classList.toggle("on");
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
  const toggles = document.querySelectorAll('.form-check-input')
  toggles.forEach((toggle) =>{
    if (toggle.checked === true) {
      toggle.checked = false
      selectAllBtn.innerText = 'Select all'
      changeVisiblesOff();
    }else {
      toggle.checked = true
      selectAllBtn.innerText = 'Unselect all'
      changeVisiblesOn();
    }
  })
}

selectAllBtn.addEventListener('click', selectAllInputs)
