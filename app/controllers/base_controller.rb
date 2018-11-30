class BaseController < ApplicationController
		layout "application"
		before_action :search_init, only: :index

    def index
		    @active_realties = Realty.where(active: true).order(crm_created_at: :desc)
				@rent = @active_realties.where(deal_id: 2).first(6)
				@buy = @active_realties.where(deal_id: 1).first(6)

				@page_title = 'Главная'
    end

    def contacts
			@page_title = t('titles.contacts')
    end

		private

		def search_init
				@q = Realty.where(active: true).ransack(params[:q])
				@deal = [{ value: 1, label: t('activerecord.attributes.realty.deal.buy') }, { value: 2, label: t('activerecord.attributes.realty.deal.rent') }]
				@realty_type = [{value: 1, label: t('activerecord.attributes.realty.realty_type.apartment')}, {value: 2, label: t('activerecord.attributes.realty.realty_type.house')}]
				@rooms = [1, 2, 3, 4, 5]
				@districts = District.where(city_id: 10, parent_district_id: nil)
		end
end
