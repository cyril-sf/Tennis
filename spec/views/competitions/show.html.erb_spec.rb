require 'spec_helper'

describe "competitions/show.html.erb" do
  before(:each) do
    @competition = assign(:competition, stub_model(Competition,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
