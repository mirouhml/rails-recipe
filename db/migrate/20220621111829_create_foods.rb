class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.references :user, foreign_key: true, null: false, column_name: :user_id
      
      t.timestamps
    end
  end
end
