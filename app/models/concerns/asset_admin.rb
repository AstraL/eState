module AssetAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						navigation_label I18n.t('activerecord.models.ckeditor.one')
						weight 2

						list do
								field :id
								field :data_file_name
								field :data_content_type
								field :data_file_size do
										pretty_value do
												(bindings[:object].data_file_size / 1024).to_s + " кБ"
										end
								end
								field :created_at
						end

						grid do
								thumbnail_method do
										:file_icon
								end
						end

						edit do
								field :data_content_type
						end
				end
		end

		def file_icon
				"/assets/icons/files/#{self.data_content_type.sub('/', '_')}.png"
		end
end