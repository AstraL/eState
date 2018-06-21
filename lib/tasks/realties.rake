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

						else
								next
						end
				end
		end
end