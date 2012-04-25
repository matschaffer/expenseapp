source 'http://rubygems.org'

gem 'rails', '3.2.1'
gem 'newrelic_rpm'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'nested_form', git: 'https://github.com/ryanb/nested_form.git'

group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', require: 'ruby-debug'
  gem 'letter_opener'
end

group :development do
  gem 'letter_opener'
end

group :production do
  gem 'pg'
end

gem 'devise'
gem 'acts-as-taggable-on'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'capybara_rails'
  gem 'nokogiri'
end
