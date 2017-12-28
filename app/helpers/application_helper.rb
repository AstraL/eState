module ApplicationHelper
		def full_title(page_title)
				base_title = "e-State"
				if page_title.empty?
						base_title
				else
						"#{page_title} - #{base_title}"
				end
		end

		def og_image
				if @post.present?
						if @post.image.present?
								"http://#{request.host}#{@post.image.url}"
						else
								image_url "og.jpg"
						end
				else
						image_url "og.jpg"
				end
		end
end
