class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name,null: false, default: ""
      t.references :user, foreign_key: true, null: false, column_name: :user_id
      
      t.timestamps
    end
  end
end
