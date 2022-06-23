class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory, foreign_key: true, null: false, column_name: :inventory_id
      t.references :food, foreign_key: true, null: false, column_name: :food_id

      t.timestamps
    end
  end
end
