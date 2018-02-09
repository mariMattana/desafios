class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.integer :notes_id
      t.string :notes_type
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
