require 'spec_helper'

describe "ibits/show.html.haml" do
  before(:each) do
    @ibit = assign(:ibit, stub_model(Ibit,
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
