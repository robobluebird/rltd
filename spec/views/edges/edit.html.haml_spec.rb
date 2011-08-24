require 'spec_helper'

describe "edges/edit.html.haml" do
  before(:each) do
    @edge = assign(:edge, stub_model(Edge,
      :label => "MyString",
      :weight => 1
    ))
  end

  it "renders the edit edge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edges_path(@edge), :method => "post" do
      assert_select "input#edge_label", :name => "edge[label]"
      assert_select "input#edge_weight", :name => "edge[weight]"
    end
  end
end
