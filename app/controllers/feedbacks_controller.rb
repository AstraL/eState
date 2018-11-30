class FeedbacksController < ApplicationController

		def new
				@feedback = Feedback.new
			@page_title = t('titles.contacts')
		end

		def create
				@feedback = Feedback.create(feedback_params)
				if @feedback.save
						redirect_to root_path
				else
						redirect_to realties_path
				end
		end

		private

		def feedback_params
				params.require(:feedback).permit(:name, :email, :phone, :body, :person, :question)
		end
end
