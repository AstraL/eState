Rails.application.routes.draw do
		root 'base#index'
		devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
		resources :realties, only: [:index, :show] do
		  collection do
				match 'search' => 'realties#search', via: [:get, :post], as: :search
		  end
		end


		scope '/blog' do
				resources :posts, path: '/'
				match 'category/:category_slug', to: 'posts#category', via: :get, as: :category_posts
		end
		resources :feedbacks

		get '/contacts', to: 'feedbacks#new', as: :contacts

		#mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
		mount Ckeditor::Engine => '/ckeditor'

		namespace :administrator do
				root to: 'base#index'

				resources :realties
		end
end
