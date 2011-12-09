class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller

  protect_from_forgery

  before_filter :decode_facebook_request

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

private
  def decode_facebook_request
    @signed_request = decode_data( params[:signed_request] ) if params[:signed_request]
  end

  # http://acknowledgement.co.uk/post/Decoding-and-Accessing-The-signed_request-Parameter-in-Rails/247
  def base64_url_decode str
   encoded_str = str.gsub('-','+').gsub('_','/')
   encoded_str += '=' while !(encoded_str.size % 4).zero?
   Base64.decode64(encoded_str)
  end

  def decode_data str
   encoded_sig, payload = str.split('.')
   data = ActiveSupport::JSON.decode base64_url_decode(payload)
  end

  def after_sign_in_path_for(resource)
  	stored_location_for(resource) || canvas_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
  	home_index_path
  end
end
