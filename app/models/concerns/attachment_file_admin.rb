module AttachmentFileAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						list do
								field :id
								field :data do
										pretty_value do
												path = "/uploads/ckeditor/attachments/#{bindings[:object].id}/#{bindings[:object].data_file_name}"
												bindings[:view].tag(:a, href: path) << bindings[:object].data_file_name
										end
								end
								field :data_file_size
								field :created_at
						end
						grid do
								thumbnail_method do
										:file_icon
								end
						end
				end
		end
end