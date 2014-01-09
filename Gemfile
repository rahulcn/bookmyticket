source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.2'


gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets

gem 'haml-rails', '~> 0.5.3' # Use HAML for views

gem 'bootstrap-sass' # Importing bootstrap

gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views

gem 'jquery-rails' # Use jquery as the JavaScript library

gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

gem 'devise' # Authentication

gem "erb2haml", :group => :development

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

group :development do
	gem 'mysql2' # Use mysql as the database for Active Record
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end
