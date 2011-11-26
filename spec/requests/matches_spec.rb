require 'spec_helper'

describe "Matches" do
  describe "GET /matches" do
    before(:each) do
      user = User.create!(:email                  => 'john@doe.com',
                          :password               => 'passw0rd',
                          :password_confirmation  => 'passw0rd')
      integration_sign_in user
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit matches_path
      page.should have_content('Listing matches')
    end
  end
end
