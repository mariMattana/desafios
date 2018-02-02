class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  enum status: [ :waiting_confirmation, :accepted, :declined ]
end
