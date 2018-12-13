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
		extend FriendlyId

		friendly_id :title, use: :slugged

		has_many :posts

		validates_presence_of :title, :slug
end
