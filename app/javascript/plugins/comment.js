const column = document.querySelectorAll(".comment-button");

column.forEach((element) =>
  element.addEventListener("click", (event) => {
    const comment = document.querySelector(
      `[data-comment='${event.currentTarget.dataset.commentbutton}']`
    );
    comment.classList.toggle("hidden");
    comment.classList.toggle("see");
    // console.log(comment, event.currentTarget);
  })
);
