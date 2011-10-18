require 'spec_helper'

describe "leaderboards/new.html.haml" do
  before(:each) do
    assign(:leaderboard, stub_model(Leaderboard).as_new_record)
  end

  it "renders new leaderboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leaderboards_path, :method => "post" do
    end
  end
end
