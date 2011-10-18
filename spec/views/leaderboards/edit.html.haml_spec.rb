require 'spec_helper'

describe "leaderboards/edit.html.haml" do
  before(:each) do
    @leaderboard = assign(:leaderboard, stub_model(Leaderboard))
  end

  it "renders the edit leaderboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leaderboards_path(@leaderboard), :method => "post" do
    end
  end
end
