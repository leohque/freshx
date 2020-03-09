// select all the buttons with that specific class
// loop over then
// add event listener for each of them
// find the form div with the id using the btn dataset
// toggle the hidden class of the form div

document.querySelectorAll(".edit-comment-btn").forEach((btn) => {
  btn.addEventListener("click", (event) => {
    const hiddenDiv = document.getElementById(`edit-form-${btn.dataset.id}`)
    hiddenDiv.classList.toggle("hidden");

  });
});
