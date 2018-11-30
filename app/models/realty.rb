class Realty < ApplicationRecord
		extend FriendlyId
		# Category: 1 - Жилая недвижимость, 2 - Коммерческая
		# realty_type: 1 - Квартира, 2 - Дом, 10 - Офис
		# deal: 1 - Продажа, 2 - Аренда
		belongs_to :user
		has_many :images, dependent: :destroy

		friendly_id :title, use: :slugged

		self.per_page = 18

		def deal
				case self.deal_id
						when 1
								'activerecord.attributes.realty.deal.buy'
						when 2
								'activerecord.attributes.realty.deal.rent'
						else
								'activerecord.attributes.realty.empty_field'
				end
		end

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

		def realty_type
				case self.realty_type_id
						when 1
								'activerecord.attributes.realty.realty_type.apartment'
						when 2
								'activerecord.attributes.realty.realty_type.house'
						when 10
								'activerecord.attributes.realty.realty_type.office'
						else
								'activerecord.attributes.realty.empty_field'
				end
		end
end
