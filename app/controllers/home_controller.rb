class HomeController < ApplicationController
  def index
    if @signed_request
      debugger
      user = User.where(:facebook_id => @signed_request["user_id"]).first
      sign_in( user ) if user
    end
  end

end
