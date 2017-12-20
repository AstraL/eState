class Microdistrict < ApplicationRecord

		self.primary_key = 'district_id'
		belongs_to :district, class_name: 'District', foreign_key: 'area_id'
end
