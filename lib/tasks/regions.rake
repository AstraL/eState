require 'httparty'

namespace :db do
		desc "Get regions from RIA.com"
		task regions: :environment do
				data = HTTParty.get('https://developers.ria.com/dom/states?api_key=qS7gZj5xWmyfwq8bmDKilqNEvc5DbFj1QLtPVmFe')


				data.each do |region|
						r = Region.create(region_id: region["stateID"], name: region["name"], translit: region["eng_name"])
						puts r
				end
		end

		desc "TODO"
		task :my_task2 => :environment do
		end
end