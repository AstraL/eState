class City < ApplicationRecord

		self.primary_key = :city_id

		belongs_to :region
end
