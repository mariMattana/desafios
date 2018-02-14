class Challenge < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy
  has_many :bets, dependent: :destroy
  has_one :charity
  accepts_nested_attributes_for :progresses

  monetize :value_cents

end
