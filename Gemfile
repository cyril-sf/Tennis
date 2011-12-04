source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'mongoid'
gem 'bson_ext'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'oa-core'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  # Pretty printed test output
  gem 'turn', :require => false

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'growl_notify'

  gem 'spork', '>= 0.9.0.rc'
  gem 'guard-spork'

  gem 'database_cleaner'
  gem 'mongoid-rspec'
end

group :darwin do
  gem 'rb-fsevent', :require => false
end
