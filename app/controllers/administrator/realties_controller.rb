class Administrator::RealtiesController < Administrator::BaseController

		def index
				@realties = Realty.all
		end

		def db
				
		end
end
