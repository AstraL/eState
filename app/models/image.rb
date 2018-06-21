class Image < ApplicationRecord

		belongs_to :realty

		mount_uploader :url, ImageUploader
end
