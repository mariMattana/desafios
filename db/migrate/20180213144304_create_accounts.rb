class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :agency
      t.string :account
      t.references :bank, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
