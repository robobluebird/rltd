require 'spec_helper'

describe "ibits/new.html.haml" do
  before(:each) do
    assign(:ibit, stub_model(Ibit,
      :title => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new ibit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ibits_path, :method => "post" do
      assert_select "input#ibit_title", :name => "ibit[title]"
      assert_select "input#ibit_description", :name => "ibit[description]"
    end
  end
end
