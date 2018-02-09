class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notes, polymorphic: true
end
