class Suggestion < ApplicationRecord

  belongs_to :bicycle
  validates :bicycle_id, uniqueness: true

end
