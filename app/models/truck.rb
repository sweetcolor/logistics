class Truck < ApplicationRecord
  belongs_to :fuel
  has_one :delivery

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :number, presence: true
  validates :mark, presence: true
  validates :fuel_consumption, presence: true
  validates :capacity_fuel, presence: true
  validates :fuel_id, presence: true
end
