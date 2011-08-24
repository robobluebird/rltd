require 'spec_helper'

describe "hubs/edit.html.haml" do
  before(:each) do
    @hub = assign(:hub, stub_model(Hub,
      :label => "MyString",
      :weight => 1
    ))
  end

  it "renders the edit hub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hubs_path(@hub), :method => "post" do
      assert_select "input#hub_label", :name => "hub[label]"
      assert_select "input#hub_weight", :name => "hub[weight]"
    end
  end
end
