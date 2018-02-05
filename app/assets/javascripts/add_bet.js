let modal = document.getElementById('add-bet-modal');

let invite = document.getElementById("invite-user");
invite.addEventListener("click", (event) => {
  modal.style.display = "block";
});

var div = document.getElementById("search-users");
var users = div.getElementsByClassName("search-user");

function removeAllActives(){
  for (var i = 0; i < users.length; i++) {
    if (users[i].className == "search-user active"){
      users[i].className = "search-user"
    }
  }
}

for (var i = 0; i < users.length; i++) {
  users[i].addEventListener("click", function() {
    removeAllActives();
    this.className += " active";
  });
}

function getIdFromActive() {
  for (var i = 0; i < users.length; i++) {
    if (users[i].className == "search-user active"){
      let id = users[i].getAttribute("id").toString().split("user-")[1];
      return id;
    }
  }
}

let close = document.getElementById("modal-close");
close.addEventListener("click", (event) => {
  removeAllActives();
  modal.style.display = "none";
});

let cancel = document.getElementById("btn-cancel");
cancel.addEventListener("click", (event) => {
  removeAllActives();
  modal.style.display = "none";
});

let confirm = document.getElementById("btn-ok");
confirm.addEventListener("click", (event) => {
  let id = getIdFromActive();
  removeAllActives();
  inviteUserToBet(id);
  modal.style.display = "none";
});

let bets = document.getElementById("bets");
let sidebar = document.getElementById("sidebar-btn");
sidebar.addEventListener("click", (event) => {
  if (bets.classList.contains("invisible")) {
    bets.classList.remove("invisible");
  } else {
    bets.classList.add("invisible");
  }
});

let token = document.getElementById("authenticity_token").innerHTML;
let inviteUserToBet = (id) => {
  fetch("http://localhost:3000/challenges/1/bets", {
      method: 'POST',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ bet: {user_id: id } }),
      credentials: 'same-origin'
    })
    .then((data) => {
      console.log(data); // Look at local_names.default
    });
}

