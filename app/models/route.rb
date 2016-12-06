class Route < ApplicationRecord
  has_many :deliveries
  belongs_to :destination_begin, foreign_key: 'begin_id', class_name: Destination
  belongs_to :destination_end, foreign_key: 'end_id', class_name: Destination

  validates :length, presence: true
end
