class Cargo < ApplicationRecord
  self.table_name = 'cargoes'
  has_many :deliveries

  validates :name, presence: true
  validates :name, uniqueness: true
end
