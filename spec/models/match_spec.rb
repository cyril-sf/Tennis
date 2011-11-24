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
      }}
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
        @match_ref = Match.new(:date => Date.today)
        user = User.create(:email => 'john@doe.com', :password => 'tototo')
        @match_ref.contenders.each do |contender|
          contender.update_attributes(:user_id => user.id,
                                      :set1 => 0,
                                      :set2 => 0,
                                      :set3 => 0)
        end
        @match_ref.save
      end

      it 'doesnt create new contenders' do
        match = Match.find(@match_ref.id)
        match.contenders.size.should == 2
        match.contenders.each do |contender|
          contender.persisted?.should be_true
        end
      end
    end
  end

  describe 'contenders' do
    context 'for a new match' do
      it 'saves the contenders with the match' do
        m = Match.new valid_attributes
        m.save
        m.contenders.each do |contender|
          contender.persisted?.should be_true
        end
      end
    end

    context 'when destroying a match' do
      it 'destroys the associated contenders' do
        m = Match.create! valid_attributes
        lambda do
          m.destroy
        end.should change(Contender, :count).by( -2 )
      end
    end
  end
end
