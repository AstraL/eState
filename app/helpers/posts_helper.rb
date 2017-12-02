module PostsHelper

		def resolve_title
				if action_name == 'index'
						t('titles.blog')
				else
						@category.title
				end
		end
end
