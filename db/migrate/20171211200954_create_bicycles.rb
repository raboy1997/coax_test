class CreateBicycles < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :description
      t.string :bicycle_img
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
