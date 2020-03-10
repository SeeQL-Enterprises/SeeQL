selectAllBtn = document.querySelector('#select_all');
console.log(selectAllBtn)
const btnText = document.querySelector('#select_all_text');

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
      btnText.innerText = 'Select all'
      changeVisiblesOff();
    }else {
      toggle.checked = true
      btnText.innerText = 'Unselect all'
      changeVisiblesOn();
    }
  })
}

selectAllBtn.addEventListener('click', selectAllInputs)
