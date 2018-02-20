class BaseController < RealtiesController

    def index
		    @active_realties = Realty.where(active: true).order(crm_created_at: :desc)
				@rent = @active_realties.where(deal_id: 2).first(6)
				@buy = @active_realties.where(deal_id: 1).first(6)
    end

    def contacts

    end
end
