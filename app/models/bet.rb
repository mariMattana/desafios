class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  enum accepted: [ :not_invited, :waiting_confirmation, :accepted, :declined ]
end
