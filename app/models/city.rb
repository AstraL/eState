class City < ApplicationRecord

		belongs_to :region, class_name: 'Region', foreign_key: :state_id, inverse_of: :cities
		self.primary_key = 'city_id'
		has_many :districts, foreign_key: 'city_id'

		validates_uniqueness_of :city_id
end
