let invite = document.getElementById("invite-user");
invite.addEventListener("click", (event) => {
  modal.style.display = "block";
});

var modal = document.getElementById('modal-add-bet');
var span = document.getElementsByClassName("close")[0];
span.onclick = function() {
    modal.style.display = "none";
}
