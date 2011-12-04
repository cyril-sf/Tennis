require 'spec_helper'

describe Match do
  # This should return the minimal set of attributes required to create a valid
  # Match. As you add validations to Match, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {"contenders_attributes" => {
        "0"=> {
          "side"=>"0",
          "user_id"=>"4ebdf7ca34017011e4000004",
          "set1"=>"1",
          "set2"=>"6",
          "set3"=>"6"},
        "1"=> {
          "side"=>"1",
          "user_id"=>"4ebf533b34017004dc000009",
          "set1"=>"6",
          "set2"=>"2",
          "set3"=>"3"}
      },
      "competition_id" => test_competition.id
    }
  end

  describe 'validation' do
    context 'the competition' do
      it 'is required' do
        match  = Match.new
        match.should have_errors_on(:competition)

        c = Competition.new
        match = Match.new( :competition => c)
        match.should_not have_errors_on(:competition)
      end
    end
  end

  describe 'initialization' do
    context 'with no contenders' do
      it 'creates 2 contenders' do
        match = Match.new
        match.contenders.size.should == 2
        match.contenders[0].side.should == 0
        match.contenders[1].side.should == 1
      end
    end

    context 'with contenders' do
      before(:each) do
        @match_ref = Match.new(:date => Date.today, :competition => test_competition)
        @match_ref.stub!(:update_ladder)
        user = User.create!(:email => 'john@doe.com', :password => 'tototo')
        @match_ref.contenders.each do |contender|
          contender.update_attributes(:user_id => user.id,
                                      :set1 => 0,
                                      :set2 => 0,
                                      :set3 => 0)
        end
        @match_ref.save!
      end

      it 'doesnt create new contenders' do
        match = Match.find(@match_ref.id)
        match.contenders.size.should == 2
        match.contenders.each do |contender|
          contender.persisted?.should be_true
        end
      end
    end

    context 'with a multiparameter date' do
      it 'assigns the correct date' do
        date = Date.current
        multi_params = valid_attributes.merge("date(1i)"=>date.year.to_s,
                                              "date(2i)"=>date.month.to_s,
                                              "date(3i)"=>date.day.to_s)
        match = Match.new multi_params
        match.date.should == date
      end
    end
  end

  describe 'contenders' do
    context 'for a new match' do
      it 'saves the contenders with the match' do
        m = Match.new valid_attributes
        m.stub!(:update_ladder)
        m.save
        m.contenders.each do |contender|
          contender.persisted?.should be_true
        end
      end
    end

    context 'when destroying a match' do
      it 'destroys the associated contenders' do
        Match.any_instance.stub(:update_ladder)
        m = Match.create! valid_attributes
        lambda do
          m.destroy
        end.should change(Contender, :count).by( -2 )
      end
    end
  end

  describe '#update_ladder' do
    before(:each) do
      @competition = Competition.create(:name => 'ladder')
      @winner = User.create!(:email     => 'john@doe.com',
                            :password  => 'passw0rd',
                            :password_confirmation => 'passw0rd')
      @loser = User.create!( :email     => 'jane@doe.com',
                            :password  => 'passw0rd',
                            :password_confirmation => 'passw0rd')
      @match = Match.new( valid_attributes )
      @match.competition = @competition
      @match.contenders[0].user = @winner
      @match.contenders[1].user = @loser
    end

    context 'with the loser ranked' do
      before(:each) do
        @competition[:ladder] = [@loser]
      end
      context 'and the winner ranked' do
        context 'when the winner has a better rank than the loser' do
          before(:each) do
            @competition[:ladder].insert( 0, @winner )
          end

          it 'doesnt change any position' do
            @match.save
            @competition[:ladder].should == [@winner, @loser]
          end
        end

        context 'when the winner has a lower rank than the loser' do
          before(:each) do
            @competition[:ladder] << @winner
          end

          it 'moves the winner before the loser' do
            @match.save
            @competition[:ladder].should == [@winner, @loser]
          end
        end
      end

      context 'and the winner isnt ranked' do
        it 'inserts the winner before the loser' do
          @match.save
          @competition[:ladder].should == [@winner, @loser]
        end
      end
    end

    context 'with the loser not ranked' do
      before(:each) do
        @competition[:ladder] = []
      end

      it 'moves the loser in the ladder' do
        @match.save
        @competition[:ladder].last.should == @loser
      end

      context 'with the winner ranked' do
        before(:each) do
          @competition[:ladder] = [@winner]
        end

        it 'doesnt change the winner position' do
          winner_pos = @competition[:ladder].index( @winner )
          @match.save
          @competition[:ladder].index( @winner ).should == winner_pos
        end
      end

      context 'and the winner isnt ranked' do
        it 'inserts the winner where he belongs' do
          @match.save
          @competition[:ladder].should == [@winner, @loser]
        end
      end
    end
  end
end
