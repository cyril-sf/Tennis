require 'spec_helper'

describe "matches/index.html.erb" do
  before(:each) do
    assign(:matches, [
      stub_model(Match),
      stub_model(Match)
    ])
  end

  it "renders a list of matches" do
    render
  end
end
