json.array! @bets do |bet|
  json.extract! bet, :id, :value, :accepted, :user, :challenge
end
