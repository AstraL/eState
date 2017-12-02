require 'will_paginate/array'
class RealtiesController < ApplicationController
		include RealtiesHelper
		before_action :get_realties
		before_action :per_page, only: [:index]

		def index
				@realties = if params[:page].present?
						@realties.paginate(:page => params[:page].to_i, :per_page => @per_page)
				else
						@realties.paginate(:per_page => @per_page)
				end
				respond_to do |format|
						format.html {}
						format.json { render json: @realties}
				end
		end

		def show
				get_xml
				@realties_xml.xpath('//item').each do |item|
						if item["internal-id"].to_i == params[:id].to_i
								@realty = xml_to_json(item)
						else
								next
						end
				end
				respond_to do |format|
						format.html {}
						format.json { render json: @realty }
				end
		end

		private

		def get_xml
				xml = HTTParty.get("http://crm-e-state.realtsoft.net/feed/xml?id=1")
				@realties_xml = Nokogiri::XML.parse(xml.to_s)
		end

		def get_realties
				get_xml
				@realties = []
				@realties_xml.xpath('//item').each do |item|
						if active?(item)
								@realties.push(xml_to_json(item))
						end
				end
				@realties.reverse!
		end

		def per_page
				@per_page = 12
		end
end
