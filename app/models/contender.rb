class Contender
  include Mongoid::Document

  field :side, type: Integer
  field :set1, type: Integer
  field :set2, type: Integer
  field :set3, type: Integer

  validates_numericality_of :set1, greater_than_or_equal_to: 0
  validates_numericality_of :set2, greater_than_or_equal_to: 0
  validates_numericality_of :set3, greater_than_or_equal_to: 0

  belongs_to :match
  belongs_to :user
end
