Rails.application.routes.draw do
		root 'base#index'
		devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
		resources :realties, only: [:index, :show]

		scope '/blog' do
				resources :posts, path: '/'
				match 'category/:category_slug', to: 'posts#category', via: :get, as: :category_posts
		end
		resources :feedbacks

		get '/contacts', to: 'feedbacks#new', as: :contacts

		#mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
		mount Ckeditor::Engine => '/ckeditor'

		namespace :administrator do
				root 'base#index'
				get 'realties/db', to: 'realties#db', as: :realties_db_control
				get 'realties/db/import', to: 'realties#import', as: :realties_db_import
				get 'realties/db/update', to: 'realties#update_db', as: :realties_db_update
				get 'realties/db/clean', to: 'realties#clean_db', as: :realties_db_clean
				resources :realties, only: [:index, :show]
		end
end
