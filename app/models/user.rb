class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable

  field :admin, type: Boolean, defaut: false
  field :facebook_id

  has_many :contenders

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    debugger
    if user = ( User.where(:email => data["email"]).first || User.where(:facebook_id => data["id"]).first )
      user
    else # Create an user with a stub password.
      password = Devise.friendly_token[0,20]
      User.create!(:email => data["email"], :password => password, :password_confirmation => password, :facebook_id => data["id"])
    end
  end
end
