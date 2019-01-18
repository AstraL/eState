class District < ApplicationRecord

		self.primary_key = :district_id
		belongs_to :city

		has_many :realties
		has_many :micro_districts, class_name: "District", foreign_key: :parent_district_id
		belongs_to :parent_district, class_name: "District", foreign_key: :parent_district_id, optional: true

end
