class CreateAddUserNameToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :add_user_name_to_users do |t|
      t.string :user_name

      t.timestamps
    end
  end
end
