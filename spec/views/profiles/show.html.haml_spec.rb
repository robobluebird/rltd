require 'spec_helper'

describe "profiles/show.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile))
  end

  it "renders attributes in <p>" do
    render
  end
end
