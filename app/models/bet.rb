class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :notifications, as: :notifiable

  monetize :value_cents

  enum accepted: [ :waiting_confirmation, :accepted, :declined ]
end
