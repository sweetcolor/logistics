class Destination < ApplicationRecord
  has_many :routes, foreign_key: 'begin_id'
  has_many :routes, foreign_key: 'end_id'
  has_many :market
  has_many :storage
  has_many :raw_producers
  has_many :enterprises

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :capacity, presence: true
end
