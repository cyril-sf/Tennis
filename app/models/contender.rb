class Contender
  include Mongoid::Document

  field :side, type: Integer

  embedded_in :match
  has_one     :user
end
