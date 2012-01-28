class CanvasController < ApplicationController
  def index
    @new_invitee = false

    if @signed_request && @signed_request["user_id"]
      user = User.where(:facebook_id => @signed_request["user_id"]).first
      if user
        sign_in( user )
      elsif Invitation.where( :invitee_id => @signed_request['user_id'] ).count > 0
        @new_invitee = true
      end
    end
  end

end
