require 'spec_helper'

describe "leaderboards/show.html.haml" do
  before(:each) do
    @leaderboard = assign(:leaderboard, stub_model(Leaderboard))
  end

  it "renders attributes in <p>" do
    render
  end
end
