class Challenge < ApplicationRecord
  belongs_to :user
  has_many :progresses
  has_many :bets
  has_one :charity, foreign_key: true
  accepts_nested_attributes_for :progresses

  monetize :value_cents

end
