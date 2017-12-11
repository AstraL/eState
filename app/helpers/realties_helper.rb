module RealtiesHelper

		def active?(item)
				properties = item.xpath("properties//property")
				properties.each do |prop|
						if prop["attribute"] == 'property_39'
								@actuality = prop
						end
				end
				if @actuality.text == 'Активный'
						true
				else
						false
				end
		end

		def field_present?(field)
				if field.nil?
						"0"
				else
						field.text
				end
		end

		def xml_to_json(item)
				j = {
						id: item["internal-id"].to_i,
						article: item.at_xpath("article").text.to_i,
						title: item.at_xpath("title").text,
						description: item.at_xpath("description").text,
						category: { value: item.at_xpath("category")["value"].to_i, label: item.at_xpath("category").text },
						realty_type: { value: item.at_xpath("realty_type")["value"].to_i, label: item.at_xpath("realty_type").text },
						deal: { value: item.at_xpath("deal")["value"].to_i, label: item.at_xpath("deal").text },
						location: {
								region: { value: item.at_xpath("location/region")["value"], label: item.at_xpath("location/region").text },
								city: { value: item.at_xpath("location/city")["value"], label: item.at_xpath("location/city").text },
								district: { value: item.at_xpath("location/district")["value"], label: item.at_xpath("location/district").text },
								street: { value: item.at_xpath("location/street")["value"], label: item.at_xpath("location/street").text},
								house_num: item.at_xpath("location/house_num").nil? ? t('activerecord.attributes.realty.empty_field') : item.at_xpath("location/house_num").text,
								map_lat: item.at_xpath("location/map_lat").text,
								map_lng: item.at_xpath("location/map_lng").text,
								apartment: item.at_xpath("location/apartment").nil? ? t('activerecord.attributes.realty.empty_field') : item.at_xpath("location/apartment").text,
								landmark: item.at_xpath("location/landmark").text
						},
						total_floors: field_present?(item.at_xpath("total_floors")),
						floor: field_present?(item.at_xpath("floor")),
						area_total: item.at_xpath("area_total").text,
						area_living: field_present?(item.at_xpath("area_living")),
						area_kitchen: field_present?(item.at_xpath("area_kitchen")),
						room_count: field_present?(item.at_xpath("room_count")),
						price: {
								type: item.at_xpath("price")["type"],
								currency: item.at_xpath("price")["currency"],
								value: item.at_xpath("price").text.to_i
						},
						images: [],
						properties: {},
						user: {
								email: item.at_xpath('user/email').text,
								name: item.at_xpath('user/name').text,
								phones: [ item.at_xpath('user/phones/phone').text ]
						},
						created_at: item.at_xpath('created_at').text,
						updated_at: item.at_xpath('updated_at').text
				}

				# Parsing images links
				images = item.xpath("images//image_url")
				images.each do |img|
						j[:images].push(img.text)
				end

				# Parsing properties list
				properties = item.xpath("properties//property")
				properties.each do |prop|
						j[:properties].store(prop["attribute"], { value: prop.text, label: prop["label"] })
				end

				j
		end


		def set_price(r)
				type = r.fetch(:deal).fetch(:value)
				price = r.fetch(:price).fetch(:value).to_s
				currency = r.fetch(:price).fetch(:currency)

				symbol = ''
				formatted_price = if type == 2
															price + I18n.t('realties.price.monthly')
                          else
															price
				                  end

				case currency
				when "USD"
						symbol = "$"
				else
						symbol = "₴"
				end

				content_tag(:strong, symbol) + content_tag(:span, formatted_price)
		end

		def main_image(r)
				if r.fetch(:images)[0].nil?
						image_path "fallback/thumb_post_placeholder.jpg"
				else
						r.fetch(:images)[0]
				end
		end

		def strip_title(r)
				r[:title].sub('Аренда /', '').sub('Продажа /', '').sub(', г. Киев','').sub('Квартира /', '')
		end

		def get_property(r, key)
				props = r[:properties]
				if props.key?(key)
						props.fetch(key).fetch(:value)
				else
						"0"
				end
		end

		def get_deal_type(r)
				d = r.fetch(:deal).fetch(:value)
				case d
						when 1
								t('activerecord.attributes.realty.deal.buy')
						when 2
								t('activerecord.attributes.realty.deal.rent')
						else
								t('activerecord.attributes.realty.empty_field')
				end
		end

		def get_realty_type(r)
				t = r.fetch(:realty_type).fetch(:value)
				case t
						when 1
								t('activerecord.attributes.realty.type.apartment')
						else
								t('activerecord.attributes.realty.empty_field')
				end
		end

		def room_count_label(r)
				i = r.fetch(:room_count).to_i
				case i
						when 1
								t('activerecord.attributes.realty.room_count.one')
						when 2...4
								t('activerecord.attributes.realty.room_count.two')
						else
								t('activerecord.attributes.realty.room_count.other')
				end
		end

		def creation_date(r)
				date = Date.parse(r[:created_at])
				content_tag(:span, "#{t('activerecord.attributes.realty.created_at')} #{l(date, format: :long)}")
		end
end
