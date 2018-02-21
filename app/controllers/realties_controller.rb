class RealtiesController < BaseController
		before_action :search_init, only: [:index]

		def index
				@realties = @q.result.order(crm_created_at: :desc).paginate(page: params[:page])
		end

		def show
				@realty = Realty.friendly.find(params[:id])
		end
end
