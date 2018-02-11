let modal = document.getElementById('add-bet-modal');

// let invite = document.getElementById("invite-user");
// invite.addEventListener("click", (event) => {
//   modal.style.display = "block";
// });

function displaySearchUserModal(){
  modal.style.display = "block";
}

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
    let divCard = document.createElement("div");
    let divBetImg = document.createElement("div");
    let img = document.createElement("img");
    let h3 = document.createElement("h3");
    bets.appendChild(divCard);
    divCard.appendChild(divBetImg);
    divBetImg.appendChild(img);
    divCard.appendChild(h3);
    divCard.classList.add("card");
    divCard.classList.add("card-bet");
    divCard.classList.add(json.accepted);
    divBetImg.classList.add("bet-img");
    img.setAttribute("width", "60");
    img.setAttribute("height", "60");
    img.setAttribute("src", json.user.photo.url);
    h3.innerHTML = json.user.first_name + " " + json.user.last_name;
    if (json.accepted) {
      let p = document.createElement("p");
      p.innerHTML = json.value;
      divCard.appendChild(p);
    }
}

let token = document.getElementById("authenticity_token").innerHTML;
let inviteUserToBet = (id) => {
  let challengeId = window.location.href;
  challengeId = challengeId.slice(-1);
  if (challengeId == "#") {
    challengeId = window.location.href.slice(-2).charAt(0);
  }
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

let searchBtn = document.getElementById("search-btn");
searchBtn.addEventListener("click", (event) => {
  event.preventDefault();
  let query = document.getElementById("search-bar").value;
  if (query != "") {
    fetch(`http://localhost:3000/api/v1/users?query=${query}`, {
      method: 'GET'
    })
    .then(data => data.json())
    .catch(error => console.error('Error:', error))
    .then(response => updateUsersInSearch(response))
  }
});

function updateUsersInSearch(users) {
  let searchUsers = document.getElementById("search-users");
  while (searchUsers.firstChild) {
      searchUsers.removeChild(searchUsers.firstChild);
  }
  for (let i in users) {
    console.log(users[i]);
    let li = document.createElement("li");
    let divUserImg = document.createElement("div");
    let img = document.createElement("img");
    let p = document.createElement("p");
    searchUsers.appendChild(li);
    li.appendChild(divUserImg);
    divUserImg.appendChild(img);
    divUserImg.appendChild(p);
    li.classList.add("search-user");
    li.id = "user-" + users[i].id;
    divUserImg.classList.add("userImg");
    img.setAttribute("width", "60");
    img.setAttribute("height", "60");
    img.setAttribute("src", users[i].photo.url);
    p.innerHTML = users[i].first_name + " " + users[i].last_name;
  };

};







