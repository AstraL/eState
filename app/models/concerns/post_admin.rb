module PostAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						navigation_label I18n.t('titles.blog')
						weight 1

						object_label_method do
								:custom_label_method
						end

						list do
								field :title do
										pretty_value do
												path = bindings[:view].edit_path(model_name: 'post', id: bindings[:object].id)
												bindings[:view].tag(:a, href: path) << bindings[:object].title
										end
								end
								field :category
								field :user
								field :created_at
						end

						show do
								field :title
								field :body do
										pretty_value do
												bindings[:object].body.html_safe
										end
								end
						end

						edit do
								field :title
								field :slug do
										read_only true
										formatted_value do
												"/blog/#{value}"
										end
								end
								field :body, :ck_editor
								field :image do
										thumb_method :admin
								end
								field :category
								field :user do
=begin
										read_only true
										def value
												if bindings[:controller].action_name == 'new'
														bindings[:view]._current_user
												else
														bindings[:object].user
												end
										end
=end
								end
						end
				end
		end

		def custom_label_method
				if self.title.present?
						self.title
				else
						I18n.t('posts.new')
				end
		end
end