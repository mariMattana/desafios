class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.boolean :completed
      t.integer :accepted, default: 0
      t.boolean :canceled, default: false
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
