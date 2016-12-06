class Truck < ApplicationRecord
  belongs_to :fuel
  has_one :delivery
end
