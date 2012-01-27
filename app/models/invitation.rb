class Invitation
  include Mongoid::Document
  belongs_to :user
  field :invitee_id
end
