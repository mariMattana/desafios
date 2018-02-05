let modal = document.getElementById('add-bet-modal');

let invite = document.getElementById("invite-user");
invite.addEventListener("click", (event) => {
  modal.style.display = "block";
});

let close = document.getElementById("modal-close");
close.addEventListener("click", (event) => {
  modal.style.display = "none";
});

let cancel = document.getElementById("btn-cancel");
cancel.addEventListener("click", (event) => {
  modal.style.display = "none";
});

let users = document.getElementById("search-users");
users.addEventListener("click", (event) => {
  event.target.classList.add("chosen");
});

let bets = document.getElementById("bets");
let sidebar = document.getElementById("sidebar-btn");
sidebar.addEventListener("click", (event) => {
  bets.style.display = "none";
});

// const inviteUserToBet = (event) => {
//   fetch("http://localhost:3000/challenges/1/bets", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json"
//     },
//     body: JSON.stringify({ query: event.currentTarget.value })
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data.hits); // Look at local_names.default
//     });
// }

// const input = document.getElementById("search"); // that's an <input id="search">
// input.addEventListener("keyup", searchAlgoliaPlaces);
