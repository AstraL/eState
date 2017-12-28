# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ApplicationRecord

		validates_presence_of :name, :email, :body, :person, :question
		validates_numericality_of :phone
		validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

		PERSON = [:owner, :client, :intermediary]
		QUESTIONS = [:rent, :sell, :consulting, :trust_management, :transaction_escort, :other]
end
