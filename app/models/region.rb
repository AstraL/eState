class Region < ApplicationRecord


		has_many :cities, foreign_key: 'state_id', inverse_of: :region
		self.primary_key = 'state_id'

		validates_uniqueness_of :state_id
end
