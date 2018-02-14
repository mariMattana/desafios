class AddStatusToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :status, :integer
  end
end
