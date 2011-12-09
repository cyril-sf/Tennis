require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Clean up the database
    require 'database_cleaner'
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = 'mongoid'
    end

    config.before(:each) do
      DatabaseCleaner.clean
    end
  end

  def test_user
    @test_user ||= User.find('4edbbc186c937015e4000001') rescue User.create!(:_id => '4edbbc186c937015e4000001',
                                                 :email => 'test@test.com',
                                                 :password => 'passw0rd',
                                                 :password_confirmation => 'passw0rd',
                                                 :admin => true)
  end

  def test_competition
    @test_competition ||= Competition.find( '4edbbc186c937015e4000001' ) rescue Competition.create!(:_id => '4edbbc186c937015e4000001',
                                                                           :name => 'ladder test')
  end

  # The Devise auth helpers don't work for RSpec 'request' specs
  def integration_sign_in(user)
    visit new_user_session_path
    within '.user_new' do
      fill_in 'user[email]',    :with => user.email
      fill_in 'user[password]', :with => user.password
      click_button 'Sign in'
    end
    user
  end

  def integration_log_out
    visit destroy_user_session_path
  end
  
end

Spork.each_run do
  # This code will be run each time you run your specs.

end

