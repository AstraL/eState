class District < ApplicationRecord
		self.primary_key = 'area_id'
		belongs_to :city, foreign_key: 'city_id'
		# level 1-Район, 2-Пригород, 3-Село, 4-Микрорайон
		#
		has_many :micro_districts, class_name: 'District', foreign_key: 'parent_area_id'
		belongs_to :parent_district, class_name: 'District', foreign_key: 'parent_area_id'

		validates_uniqueness_of :area_id

		def self.has_parent?
				self.parent_area_id != 0
		end
end
