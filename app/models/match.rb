class Match
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :date, type: Date

  belongs_to :competition
  has_many :contenders, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :contenders

  validates :competition, :presence => true

  after_initialize  :create_contenders
  after_create      :update_ladder

  def winner
    contenders[0]
  end

  def loser
    contenders[1]
  end

  private
  def create_contenders
    if contenders.empty?
      contenders << Contender.new(:side => 0)
      contenders << Contender.new(:side => 1)
    end
  end

  def update_ladder
    winner_pos = competition[:ladder].index( winner.user )
    loser_pos = competition[:ladder].index( loser.user )

    if loser_pos
      if winner_pos
        if loser_pos < winner_pos
          # move winner position a spot before the loser
          competition[:ladder].delete( winner.user )
          competition[:ladder].insert( competition[:ladder].index(loser.user), winner.user )
        else
          # do nothing - the winner had already a better ranking
        end
      else
        # The winner is new in the ladder
        # Insert him a spot before the loser
        competition[:ladder].insert( competition[:ladder].index(loser.user), winner.user )
      end
    else
      if winner_pos
        # do nothing - the winner had already a better ranking
      else
        # The winner is new in the ladder
        # Insert him where he belongs
        competition[:ladder] << winner.user
      end

      # The loser is new in the ladder
      # Insert him where he belongs
      competition[:ladder] << loser.user
    end
  end
end
