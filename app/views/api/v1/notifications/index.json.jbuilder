json.array! @notifications do |notification|
  json.read_at notification.read_at
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable notification.notifiable
  # json.url bet_path(notification.notifiable)
end
