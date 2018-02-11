class Progress < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  has_many :notifications, as: :notes

  mount_uploader :photo, PhotoUploader
end
