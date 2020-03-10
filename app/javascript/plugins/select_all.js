// $('#select_all').click(function() {
//     $('input[type="checkbox"]').prop('checked', true);
// });

// $('#unselect_all').click(function() {
//     $('input[type="checkbox"]').prop('checked', false);
// });

// selectAllBtn = document.querySelector('#select_all')
// checkbox = document.querySelector('.form-check-input')

// selectAllBtn.addEventListener("click", () => {
//   checkbox.classList.toggle(true);
//     if (checkbox.checked === true) {
//     (checkbox.checked === false);
//   } else {
//     (checkbox.checked === true);
//   }});

buttons = document.querySelectorAll(".form-check");
buttons.forEach((button) => {
  button.addEventListener("click", function(event) {
    button.classList.toggle("on");
  })});


