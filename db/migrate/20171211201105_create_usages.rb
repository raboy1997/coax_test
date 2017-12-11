class CreateUsages < ActiveRecord::Migration[5.1]
  def change
    create_table :usages do |t|

      t.timestamps
    end
  end
end
