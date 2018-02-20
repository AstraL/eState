class Realty < ApplicationRecord

		# Category: 1 - Жилая недвижимость, 2 - Коммерческая
		# realty_type: 1 - Квартира, 2 - Дом, 10 - Офис
		# deal: 1 - Продажа, 2 - Аренда

		has_many :images

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
