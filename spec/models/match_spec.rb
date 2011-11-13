require 'spec_helper'

describe Match do
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
end
