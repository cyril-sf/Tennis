require 'spec_helper'

describe "competitions/show.html.erb" do
  before(:each) do
    @competition = assign(:competition, stub_model(Competition,
      :name => "Name"
    ))
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
