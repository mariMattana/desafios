json.array! @users do |user|
  json.extract! user, :id, :first_name, :last_name, :nickname, :cpf, :birthday, :photo
end
