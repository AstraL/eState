class RealtiesController < BaseController
		before_action :search_init, only: [:index, :search, :calculator]

		def index
				@realties = @q.result.paginate(page: params[:page]).order(crm_created_at: :desc)
				@page_title = 'Объявления'
		end

		def search
			index
			render 'index'
			set_meta_tags noindex: true
			set_meta_tags nofollow: true
		end

		def show
			@realty = Realty.friendly.find(params[:id])
			@page_title = @realty.title
		end

		def calculator
				@realties = @q.result
		end
end
