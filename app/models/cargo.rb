class Cargo < ApplicationRecord
  self.table_name = 'cargoes'
  has_many :deliveries
  has_many :destination_loads

  validates :name, presence: true
  validates :name, uniqueness: true
end
