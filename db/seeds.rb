Bet.destroy_all
Challenge.destroy_all
User.destroy_all
Progress.destroy_all

puts "Creating Users ..."
users = [
  {email: "daniel.phr@gmail.com", password: "Luigi123", first_name: "Daniel", last_name: "Rodrigues", nickname: "danielphr", birthday: "13/06/1988", cpf: "111.111.111-11", url: "http://res.cloudinary.com/danielphr/image/upload/v1517412297/vr2bd99d59tdgziorbmz.jpg"},
  {email: "pedro@pedro.com", password: "Mario123", first_name: "Pedro", last_name: "Borges", nickname: "pedrao", birthday: "01/01/1991", cpf: "222.222.222-22", url: "http://res.cloudinary.com/danielphr/image/upload/v1518024020/pedro_dv90pd.jpg"},
  {email: "mari@mari.com", password: "Peach123", first_name: "Mari", last_name: "Mattana", nickname: "mari", birthday: "02/02/1992", cpf: "333.333.333-33", url: "http://res.cloudinary.com/danielphr/image/upload/v1517420449/osv9o0h6y6obwgkrnpcf.jpg"},
  {email: "patricia@patricia.com", password: "Patricia", first_name: "Patricia", last_name: "Moura", nickname: "patty", birthday: "13/08/1992", cpf: "444.444.444-44", url: "http://res.cloudinary.com/danielphr/image/upload/v1518022396/sqigpp92jcsisehflsg0.jpg"},
  {email: "rodrigo@rodrigo.com", password: "Rodrigo", first_name: "Rodrigo", last_name: "Salomão", nickname: "rodrigão", birthday: "06/09/1986", cpf: "555.555.555-55", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023165/nlfxswr0qnvhdncghzjh.jpg"},
  {email: "cristiane@cristiane.com", password: "Cristiane", first_name: "Cristiane", last_name: "Silva", nickname: "cris", birthday: "12/11/1991", cpf: "666.666.666-66", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023404/qglr7tbqy081si9khpvb.jpg"},
  {email: "rafael@rafael.com", password: "Rafael", first_name: "Rafael", last_name: "Leão", nickname: "rafa", birthday: "04/05/1986", cpf: "777.777.777-77", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023680/rafael_xadhec.jpg"},
  {email: "bruna@bruna.com", password: "Bruna123", first_name: "Bruna", last_name: "Lima", nickname: "bru", birthday: "08/08/1994", cpf: "888.888.888-88", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023852/bruna_hqofko.jpg"}
]
users.each do |user|
  new_user = User.new(email: user[:email], password: user[:password], first_name: user[:first_name], last_name: user[:last_name], nickname: user[:nickname], birthday: user[:birthday], cpf: user[:cpf])
  new_user.remote_photo_url = user[:url]
  if new_user.save
    puts "user" + i.to_s + "created"
  else
    puts "error user"
  end
end

puts "Creating Challenges ..."
challenges = [
  {title: "Emagrecer 3 Kgs", description: "Galera!!! Vou emagrecer 15 kgs em 3 meses.\nQuem duvida?", start_date: "04/02/2018", end_date: "04/05/2018", value: "250", user_id: 4},
  {title: "Parar de Fumar", description: "Nunca mais vou fumar.\nQuem me ver fumando ganha R$100,00", start_date: "04/02/2018", end_date: "04/09/2018", value: "1000", user_id: 5},
  {title: "Todo dia post novo no Instagram", description: "Estou criando meu instagram para impulsionar a minha carreira de músico. Todo dia vou fazer um post novo.", start_date: "01/01/2018", end_date: "10/05/2018", value: "2000", user_id: 7},
  {title: "Seguir Dieta", description: "Vou seguir a minha nova dieta.", start_date: "03/02/2018", end_date: "09/05/2018", value: "70", user_id: 8},
  {title: "Fazer duas trilhas por mês", description: "Vou fazer duas trilhas por mês esse ano", start_date: "01/01/2018", end_date: "31/12/2018", value: "350", user_id: 6},
  {title: "Juntar dinheiro para comprar meu primeiro carro", description: "Vou juntar dinheiro esse ano para dar entrada no meu primeiro carro", start_date: "01/01/2018", end_date: "31/12/2018", value: "350", user_id: 5}
]
challenges.each do |challenge|
 new_challenge = Challenge.create!(title: challenge[:title], description: challenge[:description], start_date: challenge[:start_date], end_date: challenge[:end_date], value: challenge[:value], user_id: challenge[:user_id])

end

puts "Creating Bets ..."
bets = [
  {value: 50, user_id: 8, challenge_id: 1},
  {value: 120, user_id: 6, challenge_id: 1},
  {value: 180, user_id: 8, challenge_id: 2},
  {value: 220, user_id: 7, challenge_id: 2},
  {value: 70, user_id: 5, challenge_id: 3},
  {value: 350, user_id: 4, challenge_id: 3},
  {value: 180, user_id: 7, challenge_id: 3},
  {value: 20, user_id: 5, challenge_id: 4},
  {value: 30, user_id: 4, challenge_id: 4},
  {value: 100, user_id: 5, challenge_id: 5},
  {value: 30, user_id: 4, challenge_id: 5},
  {value: 40, user_id: 7, challenge_id: 5},
  {value: 70, user_id: 6, challenge_id: 6},
  {value: 30, user_id: 7, challenge_id: 6}
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
