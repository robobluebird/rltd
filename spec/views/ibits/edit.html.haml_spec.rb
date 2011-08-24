require 'spec_helper'

describe "ibits/edit.html.haml" do
  before(:each) do
    @ibit = assign(:ibit, stub_model(Ibit,
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit ibit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ibits_path(@ibit), :method => "post" do
      assert_select "input#ibit_title", :name => "ibit[title]"
      assert_select "input#ibit_description", :name => "ibit[description]"
    end
  end
end
