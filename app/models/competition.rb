class Competition
  include Mongoid::Document

  has_many :matches

  field :name, :type => String

  after_initialize  :create_ladder
private
  def create_ladder
    self[:ladder] = []
  end
end
