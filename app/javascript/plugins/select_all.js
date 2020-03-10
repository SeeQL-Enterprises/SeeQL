// $('#select_all').click(function() {
//     $('input[type="checkbox"]').prop('checked', true);
// });

// $('#unselect_all').click(function() {
//     $('input[type="checkbox"]').prop('checked', false);
// });

buttons = document.querySelectorAll(".form-check");
buttons.forEach((button) => {
  button.addEventListener("click", function(event) {
    button.classList.toggle("on");
  })});


// selectAllBtn = document.querySelector('#select_all');
// toggles = document.querySelectorAll('.form-check');

// toggles.forEach((toggle) => {
//   selectAllBtn.addEventListener("click", () => {
//   if (toggle.checked === true) {
//     toggle.classList.toggle(false);
//   } else {
//     toggle.classList.toggle(true);
// }})});




