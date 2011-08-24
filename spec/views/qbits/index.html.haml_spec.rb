require 'spec_helper'

describe "qbits/index.html.haml" do
  before(:each) do
    assign(:qbits, [
      stub_model(Qbit,
        :quotee => "Quotee",
        :quote => "MyText"
      ),
      stub_model(Qbit,
        :quotee => "Quotee",
        :quote => "MyText"
      )
    ])
  end

  it "renders a list of qbits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Quotee".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
