class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :notifications, as: :notifiable

  enum accepted: [ :not_invited, :waiting_confirmation, :accepted, :declined ]
end
