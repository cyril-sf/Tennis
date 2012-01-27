require 'spec_helper'

describe "invitations/new.html.erb" do
  before(:each) do
    assign(:invitation, stub_model(Invitation,
      :user => nil,
      :invitee => nil
    ).as_new_record)
  end

  it "renders new invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invitations_path, :method => "post" do
      assert_select "input#invitation_user", :name => "invitation[user]"
      assert_select "input#invitation_invitee", :name => "invitation[invitee]"
    end
  end
end
