Bet.destroy_all
Challenge.destroy_all
User.destroy_all
Progress.destroy_all
Bank.destroy_all
Account.destroy_all
Charity.destroy_all

puts "Creating Users ..."
users = []
users_hash = [
  {email: "daniel.phr@gmail.com", password: "Luigi123", first_name: "Daniel", last_name: "Rodrigues", nickname: "danielphr", birthday: "13/06/1988", cpf: "111.111.111-11", url: "http://res.cloudinary.com/danielphr/image/upload/v1518025124/wa022cmdzxuacyybqyng.jpg"},
  {email: "pedro@pedro.com", password: "Mario123", first_name: "Pedro", last_name: "Borges", nickname: "pedrao", birthday: "01/01/1991", cpf: "222.222.222-22", url: "http://res.cloudinary.com/danielphr/image/upload/v1518024020/pedro_dv90pd.jpg"},
  {email: "mari@mari.com", password: "Peach123", first_name: "Mari", last_name: "Mattana", nickname: "mari", birthday: "02/02/1992", cpf: "333.333.333-33", url: "http://res.cloudinary.com/danielphr/image/upload/v1517420449/osv9o0h6y6obwgkrnpcf.jpg"},
  {email: "patricia@patricia.com", password: "Patricia", first_name: "Patricia", last_name: "Moura", nickname: "patty", birthday: "13/08/1992", cpf: "444.444.444-44", url: "http://res.cloudinary.com/danielphr/image/upload/v1518022396/sqigpp92jcsisehflsg0.jpg"},
  {email: "rodrigo@rodrigo.com", password: "Rodrigo", first_name: "Rodrigo", last_name: "Salomão", nickname: "rodrigão", birthday: "06/09/1986", cpf: "555.555.555-55", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023165/nlfxswr0qnvhdncghzjh.jpg"},
  {email: "cristiane@cristiane.com", password: "Cristiane", first_name: "Cristiane", last_name: "Silva", nickname: "cris", birthday: "12/11/1991", cpf: "666.666.666-66", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023404/qglr7tbqy081si9khpvb.jpg"},
  {email: "rafael@rafael.com", password: "Rafael", first_name: "Rafael", last_name: "Leão", nickname: "rafa", birthday: "04/05/1986", cpf: "777.777.777-77", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023680/rafael_xadhec.jpg"},
  {email: "bruna@bruna.com", password: "Bruna123", first_name: "Bruna", last_name: "Lima", nickname: "bru", birthday: "08/08/1994", cpf: "888.888.888-88", url: "http://res.cloudinary.com/danielphr/image/upload/v1518023852/bruna_hqofko.jpg"}
]
users_hash.each do |user|
  new_user = User.new(email: user[:email], password: user[:password], first_name: user[:first_name], last_name: user[:last_name], nickname: user[:nickname], birthday: user[:birthday], cpf: user[:cpf])
  new_user.remote_photo_url = user[:url]
  new_user.save
  users << new_user
end

puts "Creating Challenges ..."
challenges = []
challenges_hash = [
  {title: "Emagrecer 3 Kgs", description: "Galera!!! Vou emagrecer 15 kgs em 3 meses.\nQuem duvida?", start_date: "04/02/2018", end_date: "04/05/2018", value: "250", user: users[3]},
  {title: "Parar de Fumar", description: "Nunca mais vou fumar.\nQuem me ver fumando ganha R$100,00", start_date: "04/02/2018", end_date: "04/09/2018", value: "1000", user: users[4]},
  {title: "Todo dia post novo no Instagram", description: "Estou criando meu instagram para impulsionar a minha carreira de músico. Todo dia vou fazer um post novo.", start_date: "01/01/2018", end_date: "10/05/2018", value: "2000", user: users[6]},
  {title: "Seguir Dieta", description: "Vou seguir a minha nova dieta.", start_date: "03/02/2018", end_date: "09/05/2018", value: "70", user: users[7]},
  {title: "Fazer duas trilhas por mês", description: "Vou fazer duas trilhas por mês esse ano", start_date: "01/01/2018", end_date: "31/12/2018", value: "350", user: users[5]},
  {title: "Juntar dinheiro para comprar meu primeiro carro", description: "Vou juntar dinheiro esse ano para dar entrada no meu primeiro carro", start_date: "01/01/2018", end_date: "31/12/2018", value: "350", user: users[4]}
]
challenges_hash.each do |challenge|
 new_challenge = Challenge.create!(title: challenge[:title], description: challenge[:description], start_date: challenge[:start_date], end_date: challenge[:end_date], value: challenge[:value], user: challenge[:user])
 challenges << new_challenge
end

puts "Creating Bets ..."
bets = []
bets_hash = [
  {value: 50, user: users[5], challenge: challenges[0], accepted: 1},
  {value: 120, user: users[6], challenge: challenges[0], accepted: 2},
  {value: 180, user: users[6], challenge: challenges[1], accepted: 1},
  {value: 220, user: users[5], challenge: challenges[1], accepted: 2},
  {value: 70, user: users[4], challenge: challenges[2], accepted: 1},
  {value: 350, user: users[3], challenge: challenges[2], accepted: 0},
  {value: 180, user: users[6], challenge: challenges[2], accepted: 2},
  {value: 20, user: users[4], challenge: challenges[3], accepted: 1},
  {value: 30, user: users[3], challenge: challenges[3], accepted: 1},
  {value: 100, user: users[4], challenge: challenges[4], accepted: 2},
  {value: 30, user: users[3], challenge: challenges[4], accepted: 2},
  {value: 40, user: users[6], challenge: challenges[4], accepted: 2},
  {value: 70, user: users[5], challenge: challenges[5], accepted: 1},
  {value: 30, user: users[6], challenge: challenges[5], accepted: 0}
]
bets_hash.each do |bet|
 new_bet = Bet.create!(value: bet[:value], user: bet[:user], challenge: bet[:challenge], accepted: bet[:accepted])
 bets << new_bet
end


puts "Creating Progresses ..."
progresses = [{
    title: "Uhu, emagreci 1 Kg",
    description: "Olha a balança galera. Perdi 1 kg.",
    date: "15/02/2018",
    url: "http://res.cloudinary.com/danielphr/image/upload/v1518022396/sqigpp92jcsisehflsg0.jpg",
    user: users[3],
    challenge: challenges[0]
}]

progresses.each do |progress|
 new_progress = Progress.new(title: progress[:title],
  description: progress[:description], date: progress[:date],
  user: progress[:user], challenge: progress[:challenge])
 new_progress.remote_photo_url = progress[:url]
 new_progress.save!
end

puts "Creating Banks ..."
url = 'https://gist.githubusercontent.com/talesluna/85584f895071b753d4036c43b0e34863/raw/ea72bd45afe1bc16a0b527a1c76422250ddff15b/febraban_banks.json'
banks = JSON.parse(open(url).read)
banks.each do |bank|
  Bank.create!(name: bank["name"], code: bank["code"])
end

puts "Creating Accounts ..."
accounts = []
accounts_hash = [
  {agency: "111-1", account: "3456-7", bank: Bank.find_by(code: "001"), user: users[0]},
  {agency: "222-2", account: "4567-8", bank: Bank.find_by(code: "001"), user: users[1]},
  {agency: "333-3", account: "5678-9", bank: Bank.find_by(code: "341"), user: users[2]},
  {agency: "444-4", account: "6789-0", bank: Bank.find_by(code: "341"), user: users[3]},
  {agency: "555-5", account: "7890-1", bank: Bank.find_by(code: "033"), user: users[4]},
  {agency: "666-6", account: "8901-2", bank: Bank.find_by(code: "033"), user: users[5]},
  {agency: "777-7", account: "9012-3", bank: Bank.find_by(code: "237"), user: users[6]},
  {agency: "888-8", account: "0123-4", bank: Bank.find_by(code: "104"), user: users[7]}
]
accounts_hash.each do |account|
  new_account = Account.create!(agency: account[:agency], account: account[:account], bank: account[:bank], user: account[:user])
  accounts << new_account
end

puts "Creating Charity Institutions ..."
charities = []
charities_hash = [
  {name: "Istituto Ayrton Senna", social_cause: "Educação", url: "http://res.cloudinary.com/danielphr/image/upload/v1518028015/instituto_ayrton_senna_h4ybfv.png"},
  {name: "Istituto do Câncer Infantil", social_cause: "Saúde", url: "http://res.cloudinary.com/danielphr/image/upload/v1518028018/instituto_cancer_infantil_thgz7f.png"},
  {name: "SOS Mata Atlântica", social_cause: "Meio Ambiente", url: "http://res.cloudinary.com/danielphr/image/upload/v1518028034/sos-mata-atlantica_ci6xdq.png"},
  {name: "Abrace", social_cause: "Saúde", url: "http://res.cloudinary.com/danielphr/image/upload/v1518027974/abrace_z0riju.png"}
]
charities_hash.each do |charity|
  new_charity = Charity.new(name: charity[:name], social_cause: charity[:social_cause])
  new_charity.remote_picture_url = charity[:url]
  new_charity.save
  charities << new_charity
end




