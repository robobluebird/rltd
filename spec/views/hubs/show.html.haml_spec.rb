require 'spec_helper'

describe "hubs/show.html.haml" do
  before(:each) do
    @hub = assign(:hub, stub_model(Hub,
      :label => "Label",
      :weight => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
