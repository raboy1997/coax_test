class AddBicyclePhotoToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycles, :bicycle_photo, :json
  end
end
