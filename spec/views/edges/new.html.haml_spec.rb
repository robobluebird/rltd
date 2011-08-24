require 'spec_helper'

describe "edges/new.html.haml" do
  before(:each) do
    assign(:edge, stub_model(Edge,
      :label => "MyString",
      :weight => 1
    ).as_new_record)
  end

  it "renders new edge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edges_path, :method => "post" do
      assert_select "input#edge_label", :name => "edge[label]"
      assert_select "input#edge_weight", :name => "edge[weight]"
    end
  end
end
