require 'spec_helper'

describe "matches/index.html.erb" do
  before(:each) do
    user = User.create :email => "email"

    1.upto(2) do |index|
      m = Match.create
      m.contenders.each do |contender|
        contender.update_attributes(  :set1 => 1,
                                      :set2 => 2,
                                      :set3 => 3 )
      end
    end
    assign(:matches, Match.all)
  end

  it "renders a list of matches" do
    render
  end
end
