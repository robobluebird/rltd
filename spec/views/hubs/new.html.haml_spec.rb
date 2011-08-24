require 'spec_helper'

describe "hubs/new.html.haml" do
  before(:each) do
    assign(:hub, stub_model(Hub,
      :label => "MyString",
      :weight => 1
    ).as_new_record)
  end

  it "renders new hub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hubs_path, :method => "post" do
      assert_select "input#hub_label", :name => "hub[label]"
      assert_select "input#hub_weight", :name => "hub[weight]"
    end
  end
end
