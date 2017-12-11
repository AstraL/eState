# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  category_id :integer
#  body        :text
#  image       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

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
