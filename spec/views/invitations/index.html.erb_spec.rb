require 'spec_helper'

describe "invitations/index.html.erb" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :user => nil,
        :invitee => nil
      ),
      stub_model(Invitation,
        :user => nil,
        :invitee => nil
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
