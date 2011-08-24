require 'spec_helper'

describe "votes/show.html.haml" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :value => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
