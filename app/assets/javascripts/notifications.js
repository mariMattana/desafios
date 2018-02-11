let notifications = document.getElementById("notifications-btn");
notifications.addEventListener("click", (event) => {
  fetch(`http://localhost:3000/api/v1/notifications`, {
    method: 'GET'
  })
  .then(data => data.json())
  .catch(error => console.error('Error:', error))
  .then(response => updateNotifications(response))
});

function updateNotifications(json) {
  let notifications = document.getElementById("notifications");
  while (notifications.firstChild) {
    notifications.removeChild(notifications.firstChild);
  }
  let unreads = 0;
  for (let i in json) {
    console.log(json[i]);
    let li = document.createElement("li");
    let a = document.createElement("a");
    notifications.appendChild(li);
    li.appendChild(a);
    if (i == 0) {
      li.classList.add("first-notification");
    }else {
      li.classList.add("notification");
    }
    if (json[i].read_at == null) {
      li.classList.add("unread");
      unreads += 1;
    }
    li.id = "notification-" + i.toString();
    a.innerHTML = json[i].actor.first_name + " " + json[i].actor.last_name + " " + json[i].action + " ";
    a.innerHTML += json[i].recipient.first_name + " " + json[i].recipient.last_name;
  };
  let notificationsDropdow = document.getElementById("notifications-dropdow");
  let span = document.createElement("span");
  notificationsDropdow.insertBefore(span, notifications);
  span.id = "unread-count";
  span.innerHTML = unreads;
  // href a

};
          // <span id="unread-count">3</span>

          //   <li class="first-notification unread">
          //     <%= link_to "Camila Mourão convidou você para participar de um desafio.", challenge_path(Challenge.first) %>
          //   </li>
          //   <li class="notification">
          //     <%= link_to "Daniel Rodrigues convidou você para participar de um desafio.", challenge_path(Challenge.find(2)) %>
          //   </li>
          //   <li class="notification unread">
          //     <%= link_to "Mateus Piocollo convidou você para participar de um desafio.", challenge_path(Challenge.find(2)) %>
          //   </li>
