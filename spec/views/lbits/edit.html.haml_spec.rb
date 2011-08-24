require 'spec_helper'

describe "lbits/edit.html.haml" do
  before(:each) do
    @lbit = assign(:lbit, stub_model(Lbit,
      :title => "MyString",
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit lbit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lbits_path(@lbit), :method => "post" do
      assert_select "input#lbit_title", :name => "lbit[title]"
      assert_select "input#lbit_description", :name => "lbit[description]"
      assert_select "input#lbit_url", :name => "lbit[url]"
    end
  end
end
