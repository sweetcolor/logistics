class Delivery < ApplicationRecord
  belongs_to :cargo
  belongs_to :route
  belongs_to :truck

  validates :quantity, presence: true
end
