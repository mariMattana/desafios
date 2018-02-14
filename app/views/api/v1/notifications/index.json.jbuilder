json.array! @notifications do |notification|
  json.id notification.id
  json.read_at notification.read_at
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.url challenge_path(notification.notifiable.challenge)
end

