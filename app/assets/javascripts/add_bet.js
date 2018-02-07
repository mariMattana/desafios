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

function addBetToHtml(json) {
  console.log(json);
    if (json.accepted == "accepted") {
      bets.innerHTML += `<div class="card card-bet accepted">`;
    } else if (json.accepted == "declined"){
      bets.innerHTML += `<div class="card card-bet declined">`;
    } else {
      bets.innerHTML += `<div class="card card-bet waiting_confirmation">`;
    }
    bets.innerHTML += `<div class="bet-img"> \
    <img width="60" height="60" src="${json.user.photo.url}" alt="bet"> \
        </div> \
        <h3> ${json.user.first_name} ${json.user.last_name} </h3>`;
    if (json.accepted == "accepted") {
      bets.innerHTML += `<p> ${json.accepted} </p></div>`
    } else {
      bets.innerHTML += `</div>`;
    }
}

let token = document.getElementById("authenticity_token").innerHTML;
let inviteUserToBet = (id) => {
  let challengeId = window.location.href;
  challengeId = challengeId.slice(-1);
  console.log(challengeId);
  fetch(`http://localhost:3000/api/v1/challenges/${challengeId}/bets`, {
      method: 'POST',
      body: JSON.stringify({ bet: {user_id: id } }),
      credentials: 'same-origin',
      headers: {
        'X-User-Email': 'daniel.phr@gmail.com',
        'X-User-Token': "eSWMGzTehFtHuizkCprp",
        'Content-Type': 'application/json'
      }
    })
    .then(data => data.json())
    .catch(error => console.error('Error:', error))
    .then(response => addBetToHtml(response))

}
