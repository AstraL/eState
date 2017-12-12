Rails.application.routes.draw do

		root 'base#index'
		devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
		get '/realties', to: 'realties#index'
		get '/realties/search', to: 'realties#search', as: :realties_search
		get '/realties/:id', to: 'realties#show', as: :realty

		scope '/blog' do
				resources :posts, path: '/'
				match 'category/:category_slug', to: 'posts#category', via: :get, as: :category_posts
		end
		resources :feedbacks, only: [:create]

		get '/contacts', to: 'base#contacts', as: :contacts

		mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
		mount Ckeditor::Engine => '/ckeditor'

		namespace :control do
				get '/getRegions', to: 'location#get_regions', as: :regions_update
				get '/getCities', to: 'location#get_cities', as: :cities_update
				get '/getDistricts', to: 'location#get_districts', as: :districts_update
		end
end
