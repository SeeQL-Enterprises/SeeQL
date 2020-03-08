import interact from "interactjs";

// target elements with the "draggable" class
interact(".draggable").draggable({
  // enable inertial throwing
  inertia: true,
  // keep the element within the area of it's parent
  // modifiers: [
  //   interact.modifiers.restrictRect({
  //     restriction: 'parent',
  //     endOnly: true
  //   })
  // ],
  // enable autoScroll
  autoScroll: true,

  listeners: {
    // call this function on every dragmove event
    move: dragMoveListener
  }
});

function restorePositions() {
  const data = localStorage.getItem("position") || "{}";
  const currentData = JSON.parse(data);
  const items = document.querySelectorAll(".draggable");

  items.forEach((target) => {
    const id = target.getAttribute("data-id");

    if (currentData[id]) {
      const positions = currentData[id].split(":");
      const x = positions[0];
      const y = positions[1];

      target.style.webkitTransform = target.style.transform =
        "translate(" + x + "px, " + y + "px)";

      target.setAttribute("data-x", x);
      target.setAttribute("data-y", y);
    }
  });
}

restorePositions();

function rememberPosition(target) {
  const data = localStorage.getItem("position") || "{}";
  const currentData = JSON.parse(data);
  currentData[target.getAttribute("data-id")] =
    target.getAttribute("data-x") + ":" + target.getAttribute("data-y");
  localStorage.setItem("position", JSON.stringify(currentData));
}

function dragMoveListener(event) {
  var target = event.target;
  // keep the dragged position in the data-x/data-y attributes
  var x = (parseFloat(target.getAttribute("data-x")) || 0) + event.dx;
  var y = (parseFloat(target.getAttribute("data-y")) || 0) + event.dy;

  // translate the element
  target.style.webkitTransform = target.style.transform =
    "translate(" + x + "px, " + y + "px)";

  // update the posiion attributes
  target.setAttribute("data-x", x);
  target.setAttribute("data-y", y);

  rememberPosition(target);
}
