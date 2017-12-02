module UserAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						weight 0

						object_label_method do
								:custom_label_method
						end

						list do
								field :id
								field :firstName
								field :lastName
								field :email
								field :posts
								field :created_at
						end

						show do
								group :default do
										label I18n.t('users.default_attributes')
										field :firstName
										field :lastName
										field :avatar
										field :email
										field :posts
								end
								group :sign_info do
										label I18n.t('users.sign_attributes')
										field :created_at
										field :updated_at
										field :sign_in_count
										field :current_sign_in_at
										field :current_sign_in_ip
										field :last_sign_in_at
										field :last_sign_in_ip
								end
						end

						edit do
								field :firstName
								field :lastName
								field :avatar
								field :email
								field :password
								field :password_confirmation
						end
				end
		end

		def custom_label_method
				if self.firstName.present?
						self.fullname
				else
						I18n.t('users.new_user')
				end
		end
end