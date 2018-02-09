class Challenge < ApplicationRecord
  belongs_to :user
  has_many :progresses
  has_many :bets
  accepts_nested_attributes_for :progresses

  monetize :value_cents

end
