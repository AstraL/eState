class FeedbacksController < ApplicationController

		def create
				@feedback = Feedback.create(feedback_params)
				#TODO: Mailer
				respond_to do |format|
						format.js {}
				end
		end

		private

		def feedback_params
				params.require(:feedback).permit(:name, :email, :phone, :body)
		end
end
