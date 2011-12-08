class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable

  field :admin, type: Boolean, defaut: false

  has_many :contenders

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data["email"]).first
      user
    else # Create an user with a stub password.
      User.create!(:email => data["email"], :encrypted_password => Devise.friendly_token[0,20])
    end
  end
end
