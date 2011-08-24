require 'spec_helper'

describe "lbits/new.html.haml" do
  before(:each) do
    assign(:lbit, stub_model(Lbit,
      :title => "MyString",
      :description => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new lbit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lbits_path, :method => "post" do
      assert_select "input#lbit_title", :name => "lbit[title]"
      assert_select "input#lbit_description", :name => "lbit[description]"
      assert_select "input#lbit_url", :name => "lbit[url]"
    end
  end
end
