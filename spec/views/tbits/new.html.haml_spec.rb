require 'spec_helper'

describe "tbits/new.html.haml" do
  before(:each) do
    assign(:tbit, stub_model(Tbit,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new tbit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tbits_path, :method => "post" do
      assert_select "input#tbit_title", :name => "tbit[title]"
      assert_select "textarea#tbit_body", :name => "tbit[body]"
    end
  end
end
