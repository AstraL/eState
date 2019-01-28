class Realty < ApplicationRecord
		extend FriendlyId
		# Category: 1 - Жилая недвижимость, 2 - Коммерческая
		# realty_type: 1 - Квартира, 2 - Дом, 10 - Офис
		# deal: 1 - Продажа, 2 - Аренда
		belongs_to :user
		belongs_to :deal
		belongs_to :realty_type

		belongs_to :region
		belongs_to :city
		belongs_to :district
		has_many :images, dependent: :destroy

		default_scope { order(created_at: :desc) }

		friendly_id :title, use: :slugged

		self.per_page = 18

		def city
				c = City.find_by_city_id(self.city_id)
				c.name
		end

		def district
				if self.district_id == 0
						"Района нет в базе"
				else
						d = District.find_by_district_id(self.district_id)
						d.name
				end

		end

		def strip_title
				self.title.sub('Аренда /', '').sub('Продажа /', '').sub(', г. Киев','').sub('Квартира /', '')
		end
end
