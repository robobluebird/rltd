require 'spec_helper'

describe "lbits/show.html.haml" do
  before(:each) do
    @lbit = assign(:lbit, stub_model(Lbit,
      :title => "Title",
      :description => "Description",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
