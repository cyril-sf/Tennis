module InvitationsHelper
  def facebook_invitation_path
    "https://www.facebook.com/dialog/apprequests?app_id=#{ Facebook::APP_ID }&message=Facebook%20Dialogs%20are%20so%20easy!&redirect_uri=#{callback_invitations_url}"
  end
end
