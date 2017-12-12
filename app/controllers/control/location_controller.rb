class Control::LocationController < ApplicationController
		before_action :ria_api

		def get_regions
				response = HTTParty.get('https://developers.ria.com/dom/states?api_key=' + @api_key)

				@regions = JSON.parse(response.body)

				@regions.each do |region|
						r = Region.create(state_id: region["stateID"].to_i, name: region["name"], translit: region["translit"], declension: region["declension"], region_center: region["region_name"], center_declension: region["center_declension"])
				end
		end

		def get_cities
				@regions = Region.all

				@regions.each do |r|
						response = HTTParty.get("https://developers.ria.com/dom/cities/#{r.state_id}?api_key=" + @api_key)

						@cities = JSON.parse(response.body)
						@cities.each do |city|
								City.create!(city_id: city["cityID"], state_id: city["stateID"], name: city["name"], translit: city["eng"])
						end
				end
		end

		def get_districts
				@cities = City.all

				@cities.each do |c|
						response = HTTParty.get("https://developers.ria.com/dom/cities_districts/10?api_key=" + @api_key)

						@districts = JSON.parse(response.body)
						@districts.each do |d|
								if d.length != 2
										District.create!(city_id: d["city_id"].to_i, area_id: d["area_id"].to_i, name: d["name"], level: d["type"].to_i)
								else
										next
								end
						end
				end
		end

		private

		def ria_api
				@api_key = 'UQ0Z5cO1zsRi9MMTJzW81qwPxkKBarVdbbVWeiMJ'
		end

		def region_params
				params.require(:region).permit(:name, :state_id, :translit, :declension, :region_center, :center_declension)
		end
end
