class District < ApplicationRecord
		self.primary_key = 'area_id'
		belongs_to :city, foreign_key: 'city_id'
		# level 1-Район, 2-Пригород, 3-Село, 4-Микрорайон
		validates_uniqueness_of :area_id

		has_many :microdistricts, foreign_key: 'area_id'

		def parent_id
				if self.parent
						self.parent.area_id
				end
		end
end
