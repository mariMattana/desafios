class Progress < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
