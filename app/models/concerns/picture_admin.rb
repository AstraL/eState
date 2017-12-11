module PictureAdmin
		extend ActiveSupport::Concern

		included do
				rails_admin do
						list do
								field :id
								field :data_file_name
								field :width
								field :height
								field :created_at
						end
						grid do
								thumbnail_method do
										:image
								end
						end
				end
		end

		def image
				"/uploads/ckeditor/pictures/#{self.id}/#{self.data_file_name}"
		end
end