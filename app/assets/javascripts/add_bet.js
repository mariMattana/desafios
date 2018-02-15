// let modal = document.getElementById('add-bet-modal');

// function displaySearchUserModal(){
//   modal.style.display = "block";
// }


// var users = document.getElementsByClassName("search-user");

// function removeAllActives(){
//   for (var i = 0; i < users.length; i++) {
//     if (users[i].className == "search-user active"){
//       users[i].className = "search-user"
//     }
//   }
// }

// for (var i = 0; i < users.length; i++) {
//   users[i].addEventListener("click", function() {
//     removeAllActives();
//     this.className += " active";
//   });
// }

// function getIdFromActive() {
//   for (var i = 0; i < users.length; i++) {
//     if (users[i].className == "search-user active"){
//       let id = users[i].getAttribute("id").toString().split("user-")[1];
//       return id;
//     }
//   }
// }

// let close = document.getElementById("modal-close");
// close.addEventListener("click", (event) => {
//   removeAllActives();
//   modal.style.display = "none";
// });

// let cancel = document.getElementById("btn-cancel");
// cancel.addEventListener("click", (event) => {
//   removeAllActives();
//   modal.style.display = "none";
// });

// let confirm = document.getElementById("btn-ok");
// confirm.addEventListener("click", (event) => {
//   let id = getIdFromActive();
//   removeAllActives();
//   inviteUserToBet(id);
//   modal.style.display = "none";
// });

// let bets = document.getElementById("bets");
// let sidebar = document.getElementById("sidebar-btn");
// sidebar.addEventListener("click", (event) => {
//   if (bets.classList.contains("invisible")) {
//     bets.classList.remove("invisible");
//   } else {
//     bets.classList.add("invisible");
//   }
// });

// function addBetToHtml(json) {
//     let divCard = document.createElement("div");
//     let divBetImg = document.createElement("div");
//     let img = document.createElement("img");
//     let h3 = document.createElement("h3");
//     bets.appendChild(divCard);
//     divCard.appendChild(divBetImg);
//     divBetImg.appendChild(img);
//     divCard.appendChild(h3);
//     divCard.classList.add("card");
//     divCard.classList.add("card-bet");
//     divCard.classList.add(json.accepted);
//     divBetImg.classList.add("bet-img");
//     img.setAttribute("width", "60");
//     img.setAttribute("height", "60");
//     img.setAttribute("src", json.user.photo.url);
//     h3.innerHTML = json.user.first_name + " " + json.user.last_name;
//     if (json.accepted) {
//       let p = document.createElement("p");
//       p.innerHTML = json.value;
//       divCard.appendChild(p);
//     }
// }

// let token = document.getElementById("authenticity_token").innerHTML;
// let inviteUserToBet = (id) => {
//   let challengeId = window.location.href;
//   challengeId = challengeId.slice(-1);
//   if (challengeId == "#") {
//     challengeId = window.location.href.slice(-2).charAt(0);
//   }
//   fetch(`http://${domain}/api/v1/challenges/${challengeId}/bets`, {
//       method: 'POST',
//       body: JSON.stringify({ bet: {user_id: id } }),
//       credentials: 'same-origin',
//       headers: {
//         'X-User-Email': 'daniel.phr@gmail.com',
//         'X-User-Token': "eSWMGzTehFtHuizkCprp",
//         'Content-Type': 'application/json'
//       }
//     })
//     .then(data => data.json())
//     .catch(error => console.error('Error:', error))
//     .then(response => addBetToHtml(response))
// }

// let searchBtn = document.getElementById("search-btn");
// searchBtn.addEventListener("click", (event) => {
//   event.preventDefault();
//   let query = document.getElementById("search-bar").value;
//   if (query != "") {
//     fetch(`http://${domain}/api/v1/users?query=${query}`, {
//       method: 'GET'
//     })
//     .then(data => data.json())
//     .catch(error => console.error('Error:', error))
//     .then(response => updateUsersInSearch(response))
//   }
// });

// function updateUsersInSearch(users) {
//   let searchUsers = document.getElementById("search-users");
//   while (searchUsers.firstChild) {
//       searchUsers.removeChild(searchUsers.firstChild);
//   }
//   for (let i in users) {
//     console.log(users[i]);
//     let li = document.createElement("li");
//     let divUserImg = document.createElement("div");
//     let img = document.createElement("img");
//     let p = document.createElement("p");
//     searchUsers.appendChild(li);
//     li.appendChild(divUserImg);
//     divUserImg.appendChild(img);
//     divUserImg.appendChild(p);
//     li.classList.add("search-user");
//     li.id = "user-" + users[i].id;
//     divUserImg.classList.add("userImg");
//     img.setAttribute("width", "60");
//     img.setAttribute("height", "60");
//     img.setAttribute("src", users[i].photo.url);
//     p.innerHTML = users[i].first_name + " " + users[i].last_name;
//   };

// };




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////




// <div class="row">
// <div class="container">
//     <div class="card card-challenge-show">
//       <div class="card-image">
//         <%= cl_image_tag(@challenge.user.photo,
//         width: 200, height: 200, crop: :fill) %>
//       </div>
//       <div class="card-title">
//         <h1><%= @challenge.title %></h1>
//       </div>
//       <div class="card-description">
//         <p><%= @challenge.description %></p>
//       </div>
//       <div class="card-date">
//         <% if @challenge.completed.nil? %>
//           <h3 id="time-left-completion">Faltam <span class="date-left"><%= (@challenge.end_date - Date.today).to_i %></span> dias</h3>
//         <% elsif @challenge.completed %>
//           <div class="challenge-complete">
//             <%= icon("check", class: "check-challenge-complete") + " Desafio Alcançado" %>
//           </div>
//         <% elsif !@challenge.completed %>
//           <div class="challenge-incomplete">
//             <%= icon("times", class: "check-challenge-incomplete") + " Desafio Não Alcançado" %>
//           </div>
//         <% end %>
//       </div>
//       <div class="card-start-date">
//         <p>Início: <%= @challenge.start_date.strftime("%d/%m/%y") %> </p>
//       </div>
//       <div class="card-info">
//         <p><%= humanized_money_with_symbol(@challenge.value) %></p>
//       </div>
//     </div>

//     <div class="flex-space-around">
//       <h1>Meus Progressos</h1>
//       <button class="form-progress-button" onclick="displayProgressForm()"><%= icon("comments", class: "icon-button-progress") %></button>
//     </div>

//     <%= render "form_progress" %>

//     <% @progresses.each do |progress| %>
//       <div class="card card-progress" id="new-progress">
//         <h3 class="card-progress-title"><%= progress.title %></h3>
//         <div class="card-progress-image">
//           <%= cl_image_tag(progress.user.photo, width: 100, height: 100, crop: :fill) %>
//         </div>
//         <p class="card-progress-name"><%= progress.user.first_name + " " + progress.user.last_name %></p>
//         <p class="card-progress-desc"><%= progress.description %></p>
//         <p class="card-progress-date">Postado em <%= progress.date %></p>
//         <div class="card-progress-img">
//           <%= cl_image_tag(progress.photo, width: 250, height: 150, crop: :fill) %>
//         </div>
//       </div>
//     <% end %>
// </div>


// <div class="sidebar">
//   <% if policy(@challenge).invite? %>
//     <div class="sidebar-invite" onclick="displaySearchUserModal()">
//       <%= icon('user-plus', id: 'invite-user') %>
//     </div>
//   <% end %>
//   <%= icon('sliders', id: "sidebar-btn") %>
//   <div id="bets">
//     <h2>Bets</h2>
//     <% @bets.each do |bet| %>
//         <div class="card card-bet <%= bet.accepted %>" id="bet-<%= bet.id %>" >
//           <div class="bet-img">
//             <%= cl_image_tag(bet.user.photo, width: 60, height: 60, crop: :fill) %>
//           </div>
//           <h3><%= bet.user.first_name + " " + bet.user.last_name %></h3>
//           <p><%= humanized_money_with_symbol(bet.value) %></p>
//           <% if policy(bet).update? %>
//             <% if bet.accepted == "waiting_confirmation" %>
//               <div class="btn-accept-bet">
//                 <%= icon("check", id: "accept-bet") %>
//                 <%= icon("times", id: "decline-bet") %>
//               </div>
//             <% elsif bet.accepted == "accepted" && bet.completed.nil? && !@challenge.completed.nil? %>
//               <div class="btn-complete-bet">
//                 <%= icon("check", id: "challenge-completed") %>
//                 <%= icon("times", id: "challenge-incomplete") %>
//               </div>
//             <% end %>
//           <% end %>
//           <% if bet.accepted == "accepted" && bet.completed %>
//             <div class="confirm-bet">
//               <%= icon("check", id: "confirmed") + "Confirmado" %>
//             </div>
//           <% elsif bet.accepted == "accepted" && bet.completed == false %>
//             <div class="confirm-bet">
//               <%= icon("times", id: "denied") + "Cancelado"  %>
//             </div>
//           <% end %>
//         </div>
//     <% end %>
//   </div>
// </div>


// <!-- The Modal -->
// <div id="add-bet-modal" class="bet-modal">

//   <!-- Modal content -->
//   <div class="bet-modal-content">
//     <span class="close" id="modal-close">&times;</span>
//     <h3>Convide um amigo</h3>
//     <div class="search">
//       <%= form_tag challenge_path(@challenge), method: :get, remote: true do %>
//         <div class="search-bar">
//           <%= text_field_tag :query, params[:query], class: "form-control", id: "search-bar", placeholder: "Ache um Amigo" %>
//         </div>
//         <div class="search-btn" onclick="searchUsers()">
//           <%= submit_tag "Pesquise", id: "search-btn" %>
//         </div>
//         <ul id="search-users">
//           <% @users.each do |user| %>
//             <li class="search-user" id="user-<%= user.id %>">
//               <div class="user-img">
//                 <%= cl_image_tag(user.photo,
//                     width: 60, height: 60, crop: :fill) %>
//               </div>
//               <p><%= user.try(:first_name) + " " + user.try(:last_name) %></p>
//             </li>
//           <% end %>
//         </ul>
//         <div class="slidecontainer hidden" id="slider-container">
//           <p id="min-value">Min: R$20,00</p>
//           <input type="range" min="20" max="250" value="125" class="slider" id="bet-range">
//           <p id="max-value">Max: R$250,00</p>
//           <p id="output"></p>
//         </div>
//       <% end %>
//     </div>
//     <div class="modal-btns">
//       <button id="btn-cancel" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
//       <span id="authenticity_token">
//         <%= form_authenticity_token %>
//       </span>
//       <button id="btn-ok" type="button" class="btn btn-primary">Convidar</button>
//     </div>
//   </div>
// </div>

// <script>
//   let modal = document.getElementById('add-bet-modal');

//   function displaySearchUserModal(){
//     modal.style.display = "block";
//     createEventActive();
//   }

//   function removeAllActives(){
//     let users = document.getElementsByClassName("search-user");
//     for (let i = 0; i < users.length; i++) {
//       if (users[i].className == "search-user active"){
//         users[i].className = "search-user"
//       }
//     }
//   }

//   function createEventActive(){
//     let users = document.getElementsByClassName("search-user");
//     for (let i = 0; i < users.length; i++) {
//       users[i].addEventListener("click", function() {
//         removeAllActives();
//         this.className += " active";
//         remainOnlyActiveUser();
//       });
//     }
//   }

//   function remainOnlyActiveUser() {
//     let users = document.getElementsByClassName("search-user");
//     console.log(users.length);
//     for (let i = 0; i < users.length; i++) {
//       if (!users[i].classList.contains("active")) {
//         users[i].classList.add('hidden');
//       }
//     }
//     toggleSlider();
//   }

//   function toggleSlider() {
//     let sliderContainer = document.getElementById("slider-container");
//     if (sliderContainer.classList.contains("hidden")) {
//       sliderContainer.classList.remove("hidden");
//     } else {
//       sliderContainer.classList.add("hidden");
//     }
//   }

//   function getIdFromActive() {
//     let users = document.getElementsByClassName("search-user");
//     for (let i = 0; i < users.length; i++) {
//       if (users[i].className == "search-user active"){
//         let id = users[i].getAttribute("id").toString().split("user-")[1];
//         return id;
//       }
//     }
//   }

//   function getValueFromSlider() {
//     var betValue = document.getElementById("bet-range").value;
//     return betValue;
//   }

//   let close = document.getElementById("modal-close");
//   close.addEventListener("click", (event) => {
//     removeAllActives();
//     cleanSearch();
//     toggleSlider();
//     modal.style.display = "none";
//   });

//   let cancel = document.getElementById("btn-cancel");
//   cancel.addEventListener("click", (event) => {
//     removeAllActives();
//     cleanSearch();
//     toggleSlider();
//     modal.style.display = "none";
//   });

//   let confirm = document.getElementById("btn-ok");
//   confirm.addEventListener("click", (event) => {
//     let id = getIdFromActive();
//     let value = getValueFromSlider();
//     removeAllActives();
//     cleanSearch();
//     toggleSlider();
//     inviteUserToBet(id, value);
//     modal.style.display = "none";
//   });

//   let bets = document.getElementById("bets");
//   let sidebar = document.getElementById("sidebar-btn");
//   let inviteUser = document.getElementById("invite-user");
//   sidebar.addEventListener("click", (event) => {
//     if (bets.classList.contains("invisible")) {
//       bets.classList.remove("invisible");
//       inviteUser.classList.remove("invisible");
//     } else {
//       bets.classList.add("invisible");
//       inviteUser.classList.add("invisible");
//     }
//   });

//   function addBetToHtml(json) {
//     console.log(json);
//     let divCard = document.createElement("div");
//     let divBetImg = document.createElement("div");
//     let img = document.createElement("img");
//     let h3 = document.createElement("h3");
//     let p = document.createElement("p");
//     bets.appendChild(divCard);
//     divCard.appendChild(divBetImg);
//     divBetImg.appendChild(img);
//     divCard.appendChild(h3);
//     divCard.appendChild(p);
//     divCard.classList.add("card");
//     divCard.classList.add("card-bet");
//     divCard.classList.add(json.accepted);
//     divBetImg.classList.add("bet-img");
//     divCard.id = "bet-" + String(json.id);
//     img.setAttribute("width", "60");
//     img.setAttribute("height", "60");
//     img.setAttribute("src", json.user.photo.url);
//     h3.innerHTML = json.user.first_name + " " + json.user.last_name;
//     p.innerHTML = "R$" + String(Number(json.value.fractional)/100);
//   }

//   let token = document.getElementById("authenticity_token").innerHTML;
//   let inviteUserToBet = (id, value) => {
//     let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//     if (challengeId == "#") {
//       challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//     }
//     fetch(`${domain}/api/v1/challenges/${challengeId}/bets`, {
//         method: 'POST',
//         body: JSON.stringify({ bet: {user_id: id, value: value } }),
//         credentials: 'same-origin',
//         headers: {
//           'X-User-Email': 'daniel.phr@gmail.com',
//           'X-User-Token': "eSWMGzTehFtHuizkCprp",
//           'Content-Type': 'application/json'
//         }
//       })
//       .then(data => data.json())
//       .catch(error => console.error('Error:', error))
//       .then(response => addBetToHtml(response))
//   }

//   function searchUsers() {
//     event.preventDefault();
//     let query = document.getElementById("search-bar").value;
//     if (query != "") {
//       fetch(`${domain}/api/v1/users?query=${query}`, {
//         method: 'GET'
//       })
//       .then(data => data.json())
//       .catch(error => console.error('Error:', error))
//       .then(response => updateUsersInSearch(response))
//     }else{
//       let searchUsers = document.getElementById("search-users");
//       while (searchUsers.firstChild) {
//           searchUsers.removeChild(searchUsers.firstChild);
//       }
//     }
//   }

//   function updateUsersInSearch(users) {
//     let searchUsers = document.getElementById("search-users");
//     while (searchUsers.firstChild) {
//         searchUsers.removeChild(searchUsers.firstChild);
//     }
//     for (let i in users) {
//       console.log(users[i]);
//       let li = document.createElement("li");
//       let divUserImg = document.createElement("div");
//       let img = document.createElement("img");
//       let p = document.createElement("p");
//       searchUsers.appendChild(li);
//       li.appendChild(divUserImg);
//       divUserImg.appendChild(img);
//       divUserImg.appendChild(p);
//       li.classList.add("search-user");
//       li.id = "user-" + users[i].id;
//       divUserImg.classList.add("userImg");
//       img.setAttribute("width", "60");
//       img.setAttribute("height", "60");
//       img.setAttribute("src", users[i].photo.url);
//       p.innerHTML = users[i].first_name + " " + users[i].last_name;
//     };
//     createEventActive();
//   };

//   function cleanSearch() {
//     document.getElementById("search-bar").value = "";
//     searchUsers();
//   }

//   let btnEndChallenge = document.getElementById("btn-end-challenge");
//   if (btnEndChallenge !== null) {
//     btnEndChallenge.addEventListener("click", (event) => {
//       let icons = document.getElementById("end-challenge-icons");
//       if (icons.style.display == "inline") {
//         icons.style.display = "none";
//       } else {
//         icons.style.display = "inline";
//       }
//     });
//   }

//   let win = document.getElementById("win-challenge");
//   if (win !== null) {
//     win.addEventListener("click", (event) => {
//       let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}`, {
//           method: 'PATCH',
//           body: JSON.stringify({ challenge: {completed: true } }),
//           credentials: 'same-origin',
//           headers: {
//             'X-User-Email': 'daniel.phr@gmail.com',
//             'X-User-Token': "eSWMGzTehFtHuizkCprp",
//             'Content-Type': 'application/json'
//           }
//         })
//         .then(data => data.json())
//         .catch(error => console.error('Error:', error))
//         .then(response => afterEndChallenge("Desafio Alcançado"))
//     });
//   }

//   let loose = document.getElementById("loose-challenge");
//   if (loose !== null) {
//     loose.addEventListener("click", (event) => {
//       let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}`, {
//           method: 'PATCH',
//           body: JSON.stringify({ challenge: {completed: false } }),
//           credentials: 'same-origin',
//           headers: {
//             'X-User-Email': 'daniel.phr@gmail.com',
//             'X-User-Token': "eSWMGzTehFtHuizkCprp",
//             'Content-Type': 'application/json'
//           }
//         })
//         .then(data => data.json())
//         .catch(error => console.error('Error:', error))
//         .then(response => afterEndChallenge("Desafio Não Alcançado"))
//     });
//   }

//   function afterEndChallenge(response) {
//     let endChallenge = document.getElementById("end-challenge");
//     endChallenge.style.display = "none";
//     let timeLeftCompletion = document.getElementById("time-left-completion");
//     if (response === "Desafio Alcançado") {
//       timeLeftCompletion.innerHTML = "<i id='win-challenge' class='fa fa-check'></i> " + response;
//     } else {
//       timeLeftCompletion.innerHTML = "<i id='win-challenge' class='fa fa-times' style='color: red;'></i> " + response;
//     }
//   }

//   // ----------------------------------------------------------------------------

//   var slider = document.getElementById("bet-range");
//   var output = document.getElementById("output");
//   if (slider !== null) {
//     output.innerHTML = "Valor: R$" + slider.value + ",00";

//     slider.oninput = function() {
//       output.innerHTML = "Valor: R$" + this.value + ",00";
//     }
//   }

//   domain = document.domain;
//   if (domain === "localhost") {
//     domain = "http://localhost:3000"
//   }

//   let accept = document.getElementById("accept-bet");
//   if (accept !== null) {
//     accept.addEventListener("click", (event) => {
//       let betId = accept.parentNode.parentNode.id.slice(-5).match(/[0-9]+/)[0];
//       let challengeId = window.location.href.slice(-5).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}/bets/${betId}`, {
//         method: 'PATCH',
//         body: JSON.stringify({bet: {accepted: "accepted", value: slider.value}}),
//         credentials: 'same-origin',
//         headers: {
//           'X-User-Email': 'daniel.phr@gmail.com',
//           'X-User-Token': "wzZrzxQo3329SPyYcfBW",
//           'Content-Type': 'application/json'
//         }
//       })
//       .then(data => data.json())
//       .catch(error => console.error('Error:', error))
//       .then(response => console.log(response))

//       accept.style.display = "none";
//       decline.style.display = "none";
//       accept.parentNode.parentNode.classList.remove("waiting_confirmation");
//       accept.parentNode.parentNode.classList.add("accepted");
//     });
//   }

//   let decline = document.getElementById("decline-bet");
//   if (decline !== null) {
//     decline.addEventListener("click", (event) => {
//       let betId = decline.parentNode.parentNode.id.slice(-3).match(/[0-9]+/)[0];
//       let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}/bets/${betId}`, {
//         method: 'PATCH',
//         body: JSON.stringify({bet: {accepted: "declined"}}),
//         credentials: 'same-origin',
//         headers: {
//           'X-User-Email': 'daniel.phr@gmail.com',
//           'X-User-Token': "wzZrzxQo3329SPyYcfBW",
//           'Content-Type': 'application/json'
//         }
//       })
//       .then(data => data.json())
//       .catch(error => console.error('Error:', error))
//       .then(response => console.log(response))

//       accept.style.display = "none";
//       decline.style.display = "none";
//       decline.parentNode.parentNode.classList.remove("waiting_confirmation");
//       decline.parentNode.parentNode.classList.add("declined");
//     });
//   }

//   let completed = document.getElementById("challenge-completed");
//   if (completed !== null) {
//     completed.addEventListener("click", (event) => {
//       let betId = completed.parentNode.parentNode.id.slice(-3).match(/[0-9]+/)[0];
//       let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}/bets/${betId}`, {
//           method: 'PATCH',
//           body: JSON.stringify({ bet: {completed: true } }),
//           credentials: 'same-origin',
//           headers: {
//             'X-User-Email': 'daniel.phr@gmail.com',
//             'X-User-Token': "wzZrzxQo3329SPyYcfBW",
//             'Content-Type': 'application/json'
//           }
//         })
//         .then(data => data.json())
//         .catch(error => console.error('Error:', error))
//         .then(response => console.log(response))

//         completed.style.display = "none";
//         incomplete.style.display = "none";
//         let cardBet = document.getElementById("bet-" + betId);
//         let p = document.createElement("p");
//         cardBet.appendChild(p);
//         p.innerHTML = "Confirmado";
//     });
//   }

//   let incomplete = document.getElementById("challenge-incomplete");
//   if (incomplete !== null) {
//     incomplete.addEventListener("click", (event) => {
//       let betId = incomplete.parentNode.parentNode.id.slice(-3).match(/[0-9]+/)[0];
//       let challengeId = window.location.href.slice(-3).match(/[0-9]+/)[0];
//       fetch(`${domain}/api/v1/challenges/${challengeId}/bets/${betId}`, {
//           method: 'PATCH',
//           body: JSON.stringify({ bet: {completed: false } }),
//           credentials: 'same-origin',
//           headers: {
//             'X-User-Email': 'daniel.phr@gmail.com',
//             'X-User-Token': "wzZrzxQo3329SPyYcfBW",
//             'Content-Type': 'application/json'
//           }
//         })
//         .then(data => data.json())
//         .catch(error => console.error('Error:', error))
//         .then(response => console.log(response))
//         completed.style.display = "none";
//         incomplete.style.display = "none";
//         let cardBet = document.getElementById("bet-" + betId);
//         let p = document.createElement("p");
//         cardBet.appendChild(p);
//         p.innerHTML = "Cancelado";
//     });
//   }

// </script>



