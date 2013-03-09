source 'http://rubygems.org'

gem 'rails', '~>3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'mongoid', '~>2.6.0'
gem 'bson_ext'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'oa-core'
gem 'facebooker2'
gem 'cancan'
gem 'haml'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'pry'
  gem 'rails-footnotes'
end

group :test, :development do
  gem 'debugger'
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
