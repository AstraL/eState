class User < ApplicationRecord
		include UserAdmin
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
		has_many :posts

		validates_presence_of :firstName, :lastName, :email, :password, :password_confirmation


		def fullname
				self.firstName + " " + self.lastName
		end
end
