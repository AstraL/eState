source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'httparty'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem "font-awesome-rails"
gem 'devise'
gem 'rails_admin_grid', github: 'jprberlin/rails_admin_grid'
gem 'rails_admin'
gem 'friendly_id', '~> 5.2.3'
gem 'babosa'
gem 'carrierwave'
gem "mini_magick"
gem 'will_paginate', '~> 3.1.0'
gem 'bootstrap-will_paginate'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'simple_form'
gem 'active_link_to'
gem 'gmaps4rails'
gem 'httparty'
gem 'seed_dump'
gem 'meta-tags'
gem 'jssocials-rails', github: 'luciuschoi/jssocials-rails'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'rails_real_favicon'
  gem 'web-console', '>= 3.3.0'
  gem 'byebug'
  gem 'sqlite3'
  gem 'annotate'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :production do
		gem 'pg'
end
