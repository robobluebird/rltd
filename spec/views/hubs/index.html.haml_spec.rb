require 'spec_helper'

describe "hubs/index.html.haml" do
  before(:each) do
    assign(:hubs, [
      stub_model(Hub,
        :label => "Label",
        :weight => 1
      ),
      stub_model(Hub,
        :label => "Label",
        :weight => 1
      )
    ])
  end

  it "renders a list of hubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
