class Destination < ApplicationRecord
  has_many :routes_begin, foreign_key: 'begin_id', class_name: Route
  has_many :routes_end, foreign_key: 'end_id', class_name: Route
  has_many :destination_loads
  has_many :markets
  has_many :storages
  has_many :raw_producers
  has_many :enterprises

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :capacity, presence: true
end
