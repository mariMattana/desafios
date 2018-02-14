class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :relative, polymorphic: true

  monetize :value_cents

  enum status: [ :waiting_payment, :paid, :canceled, :returned ]
end
