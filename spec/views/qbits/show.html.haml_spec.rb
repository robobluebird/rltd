require 'spec_helper'

describe "qbits/show.html.haml" do
  before(:each) do
    @qbit = assign(:qbit, stub_model(Qbit,
      :quotee => "Quotee",
      :quote => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Quotee/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
