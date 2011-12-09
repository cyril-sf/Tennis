require 'spec_helper'

describe UsersController do

  before(:each) do
    sign_in(test_user)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => test_user.id
      response.should be_success
    end
  end

end
