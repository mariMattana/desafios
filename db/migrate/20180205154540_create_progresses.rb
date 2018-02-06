class CreateProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :progresses do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :picture
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
