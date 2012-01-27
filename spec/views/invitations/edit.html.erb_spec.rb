require 'spec_helper'

describe "invitations/edit.html.erb" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :user => nil,
      :invitee => nil
    ))
  end

  it "renders the edit invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invitations_path(@invitation), :method => "post" do
      assert_select "input#invitation_user", :name => "invitation[user]"
      assert_select "input#invitation_invitee", :name => "invitation[invitee]"
    end
  end
end
