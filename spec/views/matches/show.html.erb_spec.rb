require 'spec_helper'

describe "matches/show.html.erb" do
  before(:each) do
    @match = assign(:match, stub_model(Match))
  end

  it "renders attributes in <p>" do
    render
  end
end
