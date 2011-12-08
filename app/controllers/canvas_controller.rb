class CanvasController < ApplicationController
  def index
    if @signed_request
      user = User.where(:facebook_id => @signed_request["user_id"]).first
      sign_in( user ) if user
    end
  end

end
