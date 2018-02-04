Bet.destroy_all
Challenge.destroy_all
User.destroy_all

puts "Creating Users ..."
users = [
  {email: "daniel.phr@gmail.com", password: "Luigi123", first_name: "Daniel", last_name: "Rodrigues", nickname: "danielphr", birthday: "13/06/1988", cpf: "111.111.111-11", url: "http://res.cloudinary.com/danielphr/image/upload/v1517412297/vr2bd99d59tdgziorbmz.jpg"},
  {email: "pedro@pedro.com", password: "Mario123", first_name: "Pedro", last_name: "Borges", nickname: "pedrao", birthday: "01/01/1991", cpf: "222.222.222-22"},
  {email: "mari@mari.com", password: "Peach123", first_name: "Mari", last_name: "Mattana", nickname: "mari", birthday: "02/02/1992", cpf: "333.333.333-33"}
]
users.each do |user|
  puts "Entrei aqui"
 new_user = User.new(email: user[:email], password: user[:password], first_name: user[:first_name], last_name: user[:last_name], nickname: user[:nickname], birthday: user[:birthday], cpf: user[:cpf])
 # new_user.remote_photo_url = user[:url]
 new_user.save
end
