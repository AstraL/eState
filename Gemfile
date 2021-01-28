source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.11'
gem 'httparty'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "font-awesome-rails"
gem 'devise'
gem 'friendly_id', '~> 5.2.3'
gem 'babosa'
gem 'carrierwave'
gem 'will_paginate', '3.1.7'
gem 'bootstrap-will_paginate'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'simple_form'
gem 'active_link_to'
gem 'seed_dump'
gem 'meta-tags'
gem 'jssocials-rails', github: 'luciuschoi/jssocials-rails'
gem 'pg'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'loaf'
gem 'aws-sdk-s3'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'rails_real_favicon'
  gem 'web-console', '>= 3.3.0'
  gem 'byebug'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'annotate'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem "capistrano-db-tasks", "0.4", require: false
  gem 'capistrano-yarn', require: false
  gem 'capistrano-local-precompile', '~> 1.1.3', require: false
  gem 'capistrano-upload-config', require: false
end
