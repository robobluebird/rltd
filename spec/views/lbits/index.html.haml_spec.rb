require 'spec_helper'

describe "lbits/index.html.haml" do
  before(:each) do
    assign(:lbits, [
      stub_model(Lbit,
        :title => "Title",
        :description => "Description",
        :url => "Url"
      ),
      stub_model(Lbit,
        :title => "Title",
        :description => "Description",
        :url => "Url"
      )
    ])
  end

  it "renders a list of lbits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
