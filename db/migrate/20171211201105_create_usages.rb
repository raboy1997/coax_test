class CreateUsages < ActiveRecord::Migration[5.1]
  def change
    create_table :usages do |t|
      t.references :user, foreign_key: true
      t.integer :bicycle_id


      t.timestamps
    end
  end
end
