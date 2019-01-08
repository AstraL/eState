class Administrator::RealtiesController < Administrator::BaseController
	breadcrumb I18n.t('activerecord.models.realty.other'), :administrator_realties_path, match: :exact
	before_action :set_realty, only: [:show, :edit]

	def index
		@realties = Realty.all
	end

	def show

	end

	def new

	end

	def edit

	end

		def import
				get_xml
				@realties_xml.xpath('//item').each do |item|
						create_realty(item)
				end
		end

		def update_db
				get_xml
				respond_to do |format|
						format.js {}
				end
		end

		def update_from_crm
				get_xml
				@realties_xml.xpath('//item').each do |item|
						if @realty.crm_id == item["internal-id"].to_i
								update_realty(item)
						else
								next
						end
				end
		end

		def clean_db
				Realty.find_each(&:destroy)
		end

		private

		def set_realty
				@realty = Realty.friendly.find(params[:id])
		end

		def get_xml
				xml = HTTParty.get("http://localhost:3000/estate_db.xml")
				@realties_xml = Nokogiri::XML.parse(xml.to_s)
		end

		def create_realty(item)
				r = Realty.create(
						crm_id: item.at_xpath("article").text.to_i,
						is_new_building: item.at_xpath("is_new_building").text.to_i,
						title: item.at_xpath("title").text,
						description: item.at_xpath("description").text,
						category_id: item.at_xpath("category")["value"].to_i,
						realty_type_id: item.at_xpath("realty_type")["value"].to_i,
						deal_id: item.at_xpath("deal")["value"].to_i,
						region_id: get_region(item.at_xpath("location/region").text),
						city_id: get_city(item.at_xpath("location/city").text),
						district_id: get_district(item.at_xpath("location/district").text),
						street: item.at_xpath("location/street").text,
						house_num: item.at_xpath("location/house_num").nil? ? nil : item.at_xpath("location/house_num").text,
						map_lat: item.at_xpath("location/map_lat").nil? ? 50.4501: item.at_xpath("location/map_lat").text.to_f,
						map_lng: item.at_xpath("location/map_lng").nil? ? 30.5234: item.at_xpath("location/map_lng").text.to_f,
						apartment: item.at_xpath("location/apartment").nil? ? nil : item.at_xpath("location/apartment").text,
						landmark: item.at_xpath("location/landmark").text,
						total_floors: item.at_xpath("total_floors").nil? ? nil : item.at_xpath("total_floors").text.to_i,
						floor: item.at_xpath("floor").nil? ? nil : item.at_xpath("floor").text.to_i,
						area_total: item.at_xpath("area_total").text.to_f,
						area_living: item.at_xpath("area_living").nil? ? nil : item.at_xpath("area_living").text.to_f,
						area_kitchen: item.at_xpath("area_kitchen").nil? ? nil : item.at_xpath("area_kitchen").text.to_f,
						room_count: item.at_xpath("room_count").nil? ? nil : item.at_xpath("room_count").text.to_i,
						price_value: item.at_xpath("price").text.to_i,
						price_currency: item.at_xpath("price")["currency"],
						crm_created_at: item.at_xpath('created_at').text.to_datetime,
						crm_updated_at: item.at_xpath('updated_at').text.to_datetime,
						user_id: get_user(item.at_xpath('user/email').text)
				)

				images = item.xpath("images//image_url")
				images.each do |img|
						create_images(img.text, r.id)
				end

				properties = item.xpath("properties//property")
				properties.each do |prop|
						get_properties(prop, r.id)
				end
		end

		def update_realty(item)
				@realty.update!(
						crm_id: item.at_xpath("article").text.to_i,
						is_new_building: item.at_xpath("is_new_building").text.to_i,
						title: item.at_xpath("title").text,
						description: item.at_xpath("description").text,
						category_id: item.at_xpath("category")["value"].to_i,
						realty_type_id: item.at_xpath("realty_type")["value"].to_i,
						deal_id: item.at_xpath("deal")["value"].to_i,
						region_id: get_region(item.at_xpath("location/region").text),
						city_id: get_city(item.at_xpath("location/city").text),
						district_id: get_district(item.at_xpath("location/district").text),
						street: item.at_xpath("location/street").text,
						house_num: item.at_xpath("location/house_num").nil? ? nil : item.at_xpath("location/house_num").text,
						map_lat: item.at_xpath("location/map_lat").nil? ? 50.4501: item.at_xpath("location/map_lat").text.to_f,
						map_lng: item.at_xpath("location/map_lng").nil? ? 30.5234: item.at_xpath("location/map_lng").text.to_f,
						apartment: item.at_xpath("location/apartment").nil? ? nil : item.at_xpath("location/apartment").text,
						landmark: item.at_xpath("location/landmark").text,
						total_floors: item.at_xpath("total_floors").nil? ? nil : item.at_xpath("total_floors").text.to_i,
						floor: item.at_xpath("floor").nil? ? nil : item.at_xpath("floor").text.to_i,
						area_total: item.at_xpath("area_total").text.to_f,
						area_living: item.at_xpath("area_living").nil? ? nil : item.at_xpath("area_living").text.to_f,
						area_kitchen: item.at_xpath("area_kitchen").nil? ? nil : item.at_xpath("area_kitchen").text.to_f,
						room_count: item.at_xpath("room_count").nil? ? nil : item.at_xpath("room_count").text.to_i,
						price_value: item.at_xpath("price").text.to_i,
						price_currency: item.at_xpath("price")["currency"],
						crm_created_at: item.at_xpath('created_at').text.to_datetime,
						crm_updated_at: item.at_xpath('updated_at').text.to_datetime,
						user_id: get_user(item.at_xpath('user/email').text)
				)
				@realty.images.delete_all

				images = item.xpath("images//image_url")
				images.each do |img|
						create_images(img.text, @realty.id)
				end

				properties = item.xpath("properties//property")
				properties.each do |prop|
						get_properties(prop, @realty.id)
				end
		end

		def create_images(image_url, realty_id)
				i = Image.new(realty_id: realty_id)
				i.remote_url_url = image_url
				i.save
		end

		def get_region(region_name)
				region_strip = region_name.sub(' область', '')

				region = Region.find_by_name(region_strip)
				region.region_id
		end

		def get_city(city_name)
				city = City.find_by_name(city_name)

				if city
						city.city_id
				else
						10
				end
		end

		def get_district(district_name)
				district = District.find_by_name(district_name)

				if district
						district.district_id
				else
						0
				end
		end

		def get_user(email)
				user = User.find_by_email(email)

				if user
						user.id
				else
						1
				end
		end

		def get_properties(property, realty_id)
				realty = Realty.friendly.find(realty_id)

				case property["attribute"]
						when "property_2"
								if property.text == "Есть"
										realty.update!(gas: true)
								else
										realty.update!(gas: false)
								end
						when "property_11"
								realty.update!(ceiling_height: property.text.to_f)
						when "property_16"
								realty.update!(bedroom_count: property.text.to_i)
						when "property_17"
								realty.update!(wall_material: property.text)
						when "property_18"
								realty.update!(renovation: property.text)
						when "property_19"
								realty.update!(bathroom_count: property.text.to_i)
						when "property_20"
								realty.update!(planing: property.text)
						when "property_21"
								realty.update!(realty_class: property.text)
						when "property_22"
								realty.update!(room_schema: property.text)
						when "property_23"
								realty.update!(year: property.text.to_i)
						when "property_24"
								realty.update!(balcony_count: property.text.to_i)
						when "property_25"
								realty.update!(windows: property.text)
						when "property_27"
								realty.update!(ownership: property.text)
						when "property_28"
								realty.update!(ceiling_material: property.text)
						when "property_29"
								realty.update!(entrance: property.text)
						when "property_30"
								realty.update!(plumbing: property.text)
						when "property_32"
								realty.update!(purpose: property.text)
						when "property_39"
								if property.text == "Активный"
										realty.update!(active: true)
								else
										realty.update!(active: false)
								end
						when "property_42"
								if property.text == "Без комиссии"
										realty.update!(commission: 0)
								else
										realty.update!(commission: property.text.to_i)
								end
						else
						# do nothing
				end
		end
end
