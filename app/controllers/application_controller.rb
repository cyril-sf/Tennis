class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller

  protect_from_forgery

  before_filter :decode_facebook_request

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
end
