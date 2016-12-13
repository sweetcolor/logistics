class Storage < ApplicationRecord
  belongs_to :destination
  has_many :truck_for_productions
end
