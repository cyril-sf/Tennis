class Competition
  include Mongoid::Document

  has_many :matches

  field :name, :type => String
end
