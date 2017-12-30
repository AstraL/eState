class BaseController < RealtiesController
    before_action :get_realties, only: :index
    before_action :search_collection, only: :index

    def index
		    @random = []
				@rent = []
				@buy = []
		    5.times do
				    i = rand(0...@realties.length)
				    @random.push(@realties[i])
		    end
				@realties.each do |r|
						if r[:deal].fetch(:value) == 2
								@rent.push(r)
						elsif r[:deal].fetch(:value) == 1
								@buy.push(r)
						end
				end
				@rent_recent = @rent.first(6)
				@buy_recent = @buy.first(6)
    end

    def contacts

    end
end
