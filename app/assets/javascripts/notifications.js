function updateNotifications(json) {
  let notifications = document.getElementById("notifications");
  let unreadCount = document.getElementById("unread-count");
  if (unreadCount) {
    notifications.parentNode.removeChild(unreadCount);
  }
  while (notifications.firstChild) {
    notifications.removeChild(notifications.firstChild);
  }
  let unreads = 0;
  for (let i in json) {
    let li = document.createElement("li");
    let a = document.createElement("a");
    notifications.appendChild(li);
    li.appendChild(a);
    if (i === 0) {
      li.classList.add("first-notification");
    }
    li.classList.add("notification");
    if (json[i].read_at === null) {
      li.classList.add("unread");
      unreads += 1;
      li.addEventListener("click", (event) => {
        markNotificationAsRead(json[i].id)
      });
    }
    li.id = "notification-" + i.toString();
    a.innerHTML = json[i].actor.first_name + " " + json[i].actor.last_name + " " + json[i].action + " ";
    a.innerHTML += json[i].recipient.first_name + " " + json[i].recipient.last_name;
    a.setAttribute("href", json[i].url);
  };
  let notificationsDropdow = document.getElementById("notifications-dropdow");
  let span = document.createElement("span");
  notificationsDropdow.insertBefore(span, notifications);
  span.id = "unread-count";
  span.innerHTML = unreads;
  if (unreads === 0) {
    span.classList.add("zero");
  }

};

let domain = "https://" + document.domain;
if (domain === "localhost") {
  domain = "http://localhost:3000"
}
function getNotifications(){
  fetch(`${domain}/api/v1/notifications`, {
    method: 'GET'
  })
  .then(data => data.json())
  .catch(error => console.error('Error:', error))
  .then(response => updateNotifications(response))
}
setInterval(getNotifications, 10000);

getNotifications();

let markNotificationAsRead = (notification_id) => {
  fetch(`http://${domain}/api/v1/notifications/${notification_id}`, {
      method: 'PATCH',
      headers: {
       // 'X-User-Email': 'daniel.phr@gmail.com',
       // 'X-User-Token': "eSWMGzTehFtHuizkCprp",
        'Content-Type': 'application/json'
      }
    })
    .then(data => data.json())
    .catch(error => console.error('Error:', error))
    .then(response => response)
}
