class Region < ApplicationRecord

		self.primary_key = :region_id

		has_many :cities
end
