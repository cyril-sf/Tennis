require 'spec_helper'

describe "competitions/new.html.erb" do
  before(:each) do
    assign(:competition, stub_model(Competition,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new competition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => competitions_path, :method => "post" do
      assert_select "input#competition_name", :name => "competition[name]"
    end
  end
end
