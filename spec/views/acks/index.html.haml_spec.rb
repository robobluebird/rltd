require 'spec_helper'

describe "acks/index.html.haml" do
  before(:each) do
    assign(:acks, [
      stub_model(Ack,
        :sent_by => "Sent By",
        :body => "MyText"
      ),
      stub_model(Ack,
        :sent_by => "Sent By",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of acks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sent By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
