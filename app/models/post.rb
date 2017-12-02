class Post < ApplicationRecord
		include PostAdmin
		extend FriendlyId

		friendly_id :title, use: :slugged

		belongs_to :user
		belongs_to :category

		validates_presence_of :title, :body, :slug

		mount_uploader :image, PostImageUploader

		self.per_page = 10

		def should_generate_new_friendly_id?
				slug.blank? || title_changed?
		end

		def normalize_friendly_id(text)
				text.to_slug.transliterate(:russian).normalize.to_s
		end
end
