class AddValueToPayment < ActiveRecord::Migration[5.1]
  def change
    add_monetize :payments, :value, currency: { present: true }
  end
end
