let modal = document.getElementById('add-bet-modal');

let invite = document.getElementById("invite-user");
invite.addEventListener("click", (event) => {
  modal.style.display = "block";
});

let close = document.getElementById("modal-close");
close.addEventListener("click", (event) => {
  modal.style.display = "none";
});
