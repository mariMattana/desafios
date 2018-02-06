Bet.destroy_all
Challenge.destroy_all
User.destroy_all
Progress.destroy_all

puts "Creating Users ..."
users = [
  {email: "daniel.phr@gmail.com", password: "Luigi123", first_name: "Daniel", last_name: "Rodrigues", nickname: "danielphr", birthday: "13/06/1988", cpf: "111.111.111-11", url: "http://res.cloudinary.com/danielphr/image/upload/v1517412297/vr2bd99d59tdgziorbmz.jpg"},
  {email: "pedro@pedro.com", password: "Mario123", first_name: "Pedro", last_name: "Borges", nickname: "pedrao", birthday: "01/01/1991", cpf: "222.222.222-22", url: "http://res.cloudinary.com/danielphr/image/upload/v1517776006/einsten_oimozu.jpg"},
  {email: "mari@mari.com", password: "Peach123", first_name: "Mari", last_name: "Mattana", nickname: "mari", birthday: "02/02/1992", cpf: "333.333.333-33", url: "http://res.cloudinary.com/danielphr/image/upload/v1517420449/osv9o0h6y6obwgkrnpcf.jpg"}
]
users.each do |user|
 new_user = User.new(email: user[:email], password: user[:password], first_name: user[:first_name], last_name: user[:last_name], nickname: user[:nickname], birthday: user[:birthday], cpf: user[:cpf])
 new_user.remote_photo_url = user[:url]
 new_user.save
end

puts "Creating Challenges ..."
challenges = [
  {title: "Emagrecer 3 Kgs", description: "Galera!!! Vou emagrecer 15 kgs em 3 meses.\nQuem duvida?", start_date: "04/02/2018", end_date: "04/05/2018", value: "250", user_id: 1},
  {title: "Parar de Fumar", description: "Nunca mais vou fumar.\nQuem me ver fumando ganha R$100,00", start_date: "04/02/2018", end_date: "04/09/2018", value: "1000", user_id: 3},
  {title: "Vou ficar inteligente e fortão", description: "Vejam só os meus músculos que com amor cultivei \nMeu bumbum era flácido. Mas esse assunto é tão místico. Devido a um ato cirúrgico hoje eu me transformei", start_date: "01/01/2018", end_date: "10/05/2018", value: "500", user_id: 2},
]
challenges.each do |challenge|
 new_challenge = Challenge.create!(title: challenge[:title], description: challenge[:description], start_date: challenge[:start_date], end_date: challenge[:end_date], value: challenge[:value], user_id: challenge[:user_id])

end

puts "Creating Bets ..."
bets = [
  {value: 100, user_id: 1, challenge_id: 2},
  {value: 150, user_id: 2, challenge_id: 1},
  {value: 350, user_id: 1, challenge_id: 3}
]
bets.each do |bet|
 new_bet = Bet.create!(value: bet[:value], user_id: bet[:user_id], challenge_id: bet[:challenge_id])

end


puts "Creating Progresses ..."
progresses = [{
    title: "Uhu, emagreci 1 Kg",
    description: "testestetsestest\ntestestestetsetstestest\ntesteteststse",
    date: "15/02/2018",
    url: "http://res.cloudinary.com/danielphr/image/upload/v1517776006/einsten_oimozu.jpg",
    user_id: 1,
    challenge_id: 1
}]

progresses.each do |progress|
 new_progress = Progress.new(title: progress[:title],
  description: progress[:description], date: progress[:date],
  user_id: progress[:user_id], challenge_id: progress[:challenge_id])
 new_progress.remote_photo_url = progress[:url]
 new_progress.save
end
