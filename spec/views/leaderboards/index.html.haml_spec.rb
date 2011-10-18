require 'spec_helper'

describe "leaderboards/index.html.haml" do
  before(:each) do
    assign(:leaderboards, [
      stub_model(Leaderboard),
      stub_model(Leaderboard)
    ])
  end

  it "renders a list of leaderboards" do
    render
  end
end
