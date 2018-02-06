class Challenge < ApplicationRecord
  belongs_to :user
  has_many :progresses

  accepts_nested_attributes_for :progresses
end
