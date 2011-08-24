require 'spec_helper'

describe "tbits/index.html.haml" do
  before(:each) do
    assign(:tbits, [
      stub_model(Tbit,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Tbit,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of tbits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
