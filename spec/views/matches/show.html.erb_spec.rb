require 'spec_helper'

describe "matches/show.html.erb" do

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
    "competition_id" => test_competition.id}
  end

  before(:each) do
    user = User.new(:email                  => 'john@doe.com',
                    :password               => 'passw0rd',
                    :password_confirmation  => 'passw0rd')
    @match = Match.new(valid_attributes)
    @match.contenders.each do |contender|
      contender.user = user
    end
    @match.save

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  it "renders attributes in <p>" do
    render
  end
end
