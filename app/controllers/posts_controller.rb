class PostsController < ApplicationController
		before_action :get_categories
		before_action :recent_posts, only: :show
		before_action :search
		def index
				@posts = @q.result.order('created_at DESC').paginate(page: params[:page])
				@page_title = 'Статьи'
		end

		def show
				@post = Post.friendly.find(params[:id])
		end

		def category
				@category = Category.friendly.find(params[:category_slug])
				@posts = @category.posts.order('created_at DESC').paginate(page: params[:page])
				respond_to do |format|
						format.html { render 'posts/index' }
				end
		end

		private

		def search
				@q = Post.ransack(params[:q])
		end

		def get_categories
				@categories = Category.all
		end

		def recent_posts
				@recent_posts = Post.order('created_at DESC').last(3)
		end
end
