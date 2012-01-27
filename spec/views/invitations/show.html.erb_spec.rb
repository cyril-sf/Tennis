require 'spec_helper'

describe "invitations/show.html.erb" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :user => nil,
      :invitee => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
