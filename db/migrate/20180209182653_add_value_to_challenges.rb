class AddValueToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_monetize :challenges, :value, currency: { present: true }
  end
end
