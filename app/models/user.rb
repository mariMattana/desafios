class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_token_authenticatable

  has_many :challenges
  has_many :bets
  has_many :progresses
  has_many :notifications, foreign_key: :recipient_id
  has_many :accounts, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  #after_create :send_welcome_email

  include PgSearch
  pg_search_scope :search_by_first_and_last_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  private

  def send_welcome_email
    # UserMailer.welcome(self).deliver_now
  end
end
