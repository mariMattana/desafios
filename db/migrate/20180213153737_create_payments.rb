class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.integer :relative_id
      t.string :relative_type

      t.timestamps
    end
  end
end
