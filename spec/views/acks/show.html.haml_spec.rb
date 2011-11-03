require 'spec_helper'

describe "acks/show.html.haml" do
  before(:each) do
    @ack = assign(:ack, stub_model(Ack,
      :sent_by => "Sent By",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sent By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
