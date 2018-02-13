class AddValueToBets < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bets, :value, currency: { present: true }
  end
end
