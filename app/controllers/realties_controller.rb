require 'will_paginate/array'
class RealtiesController < ApplicationController
		include RealtiesHelper
		before_action :get_realties, only: [:index, :search]
		before_action :per_page, only: [:index, :search]
		before_action :search_collection, only: [:index, :search]

		def index
				@count = @realties.length
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

		def search
				@results = @realties
				@results_ids = []

				@realties.each_with_index do |r, i|
						unless params[:deal].blank?
								if r[:deal].fetch(:value) != params[:deal].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:realty_type].blank?
								if r[:realty_type].fetch(:value) != params[:realty_type].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:r_min].blank?
								if r[:room_count].to_i < params[:r_min].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:r_max].blank?
								if r[:room_count].to_i > params[:r_max].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:price_min].blank?
								if r[:price].fetch(:value) < params[:price_min].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:price_max].blank?
								if r[:price].fetch(:value) > params[:price_max].to_i
										@results_ids.push(r[:id])
								end
						end
						unless params[:district].blank?
								if r[:location].fetch(:district).fetch(:value) != params[:district].to_i
										@results_ids.push(r[:id])
								end
						end
				end

				@results_ids.uniq!

				@results_ids.each do |i|
						if @results.detect {|r| r[:id] == i}
								obj = @results.detect {|r| r[:id] == i}
								@results.delete(obj)
						end
				end
				@r_count = @results.length
				@results = if params[:page].present?
						           @results.paginate(:page => params[:page].to_i, :per_page => @per_page)
						       else
								       @results.paginate(:per_page => @per_page)
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
				@per_page = 18
		end

		def search_collection
				@deal = [{ value: 1, label: t('activerecord.attributes.realty.deal.buy') }, { value: 2, label: t('activerecord.attributes.realty.deal.rent') }]
				@realty_type = [{value: 1, label: t('activerecord.attributes.realty.type.apartment')}, {value: 2, label: t('activerecord.attributes.realty.type.house')}]
				@rooms = [1, 2, 3, 4, 5]
				@kiev_districts = District.where('city_id = "10" and level = "1"')
		end
end
