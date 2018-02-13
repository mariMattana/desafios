json.array! @notifications do |notification|
  json.id notification.id
  json.read_at notification.read_at
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.url edit_challenge_bet_path(notification.notifiable.challenge, notification.notifiable)
end

