require 'httparty'

namespace :realties do
		desc ""
		task locations: :environment do
				data = HTTParty.get('http://localhost:3000/estate_db.xml')

				realties = Nokogiri::XML.parse(data.to_s)
				realties.xpath('//item').each do |item|
						crm_id = item["internal-id"].to_i
						realty = Realty.find_by_crm_id(crm_id)
						if realty
								region_text = item.at_xpath("location/region").text
								city_text = item.at_xpath("location/city").text
								district_text = item.at_xpath("location/district").text

								region = Region.find_by_name(region_text.sub(' область', ''))
								city = City.find_by_name(city_text)
								district = District.find_by_name(district_text)

								if district
										d_id = district.district_id
								else
										d_id = 0
								end

								realty.update(region_id: region.region_id, city_id: city.city_id, district_id: d_id)
								realty.save

								puts "ok"
						else
								next
								puts "nope"
						end
				end
		end
end