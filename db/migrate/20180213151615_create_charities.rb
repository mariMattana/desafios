class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :social_cause
      t.string :picture

      t.timestamps
    end
  end
end
