class Match
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :date, type: Date

  belongs_to :competition
  has_many :contenders, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :contenders

  after_initialize  :create_contenders
  after_create      :update_ladder

  def winner
    self.contenders[0]
  end

  def loser
    self.contenders[1]
  end

  private
  def create_contenders
    if self.contenders.empty?
      self.contenders << Contender.new(:side => 0)
      self.contenders << Contender.new(:side => 1)
    end
  end

  def update_ladder
    winner_pos = self.competition[:ladder].index( winner.user )
    loser_pos = self.competition[:ladder].index( loser.user )

    if loser_pos
      if winner_pos
        if loser_pos < winner_pos
          # move winner position a spot before the loser
        else
          # do nothing - the winner had already a better ranking
        end
      else
        # The winner is new in the ladder
        # Insert him a spot before the loser
      end
    else
      # The loser is new in the ladder
      # Insert him where he belongs

      if winner_pos
        # do nothing - the winner had already a better ranking
      else
        # The winner is new in the ladder
        # Insert him where he belongs
      end
    end
  end
end
