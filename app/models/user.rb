# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstName              :string
#  lastName               :string
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
		has_many :posts
		has_many :phones
		has_many :realties

		validates_presence_of :firstName, :email, :password, :password_confirmation


		def fullname
				if self.lastName.present?
					self.firstName + " " + self.lastName
				else
						self.firstName
				end
		end
end
