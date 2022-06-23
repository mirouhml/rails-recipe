class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, foreign_key: true, null: false, column_name: :user_id

      t.timestamps
    end
  end
end
