json.array! @notifications do |notification|
  json.extract! notification, :user, :notes, :notes_type, :read
end
