class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :completed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
