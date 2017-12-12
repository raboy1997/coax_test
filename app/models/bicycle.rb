class Bicycle < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :suggestion
  has_many :usages

  mount_uploader :bicycle_photo, BicyclePhotoUploader
  validates :bicycle_photo, presence: true
  validates :name, uniqueness: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      Bicycle.all
    end
  end

end
