class Enterprise < ApplicationRecord
  belongs_to :destination
  has_many :truck_for_productions
  has_many :truck_for_raws
end
