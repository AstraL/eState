# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

class Category < ApplicationRecord
		include CategoryAdmin
		extend FriendlyId

		friendly_id :title, use: :slugged

		has_many :posts

		validates_presence_of :title, :slug

		def should_generate_new_friendly_id?
				slug.blank? || title_changed?
		end

		def normalize_friendly_id(text)
				text.to_slug.transliterate(:russian).normalize.to_s
		end
end
