class TruckForProduction < ApplicationRecord
  belongs_to :truck
  belongs_to :storage
  belongs_to :enterprise
end
