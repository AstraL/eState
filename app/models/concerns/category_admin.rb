module CategoryAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						navigation_label I18n.t('titles.blog')
						weight 2

						object_label_method do
								:custom_label_method
						end

						list do
								field :title
								field :posts do
										pretty_value do
												bindings[:object].posts.count
										end
								end
						end

						show do
								field :title
								field :slug do
										pretty_value do
												"/blog/#{value}"
										end
								end
								field :posts
						end

						edit do
								field :title
								field :slug do
										read_only true
										formatted_value do
												"/blog/#{value}"
										end
								end
								field :posts
						end
				end
		end

		def custom_label_method
				if self.title.present?
						self.title
				else
						I18n.t('categories.new')
				end
		end
end