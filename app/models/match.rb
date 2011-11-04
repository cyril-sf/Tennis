class Match
  include Mongoid::Document

  field :date, type: Date

  has_many :contenders
  accepts_nested_attributes_for :contenders

  after_initialize :create_contenders

  private
  def create_contenders
    if self.contenders.empty?
      self.contenders << Contender.new(:side => 0)
      self.contenders << Contender.new(:side => 1)
    end
  end
end
