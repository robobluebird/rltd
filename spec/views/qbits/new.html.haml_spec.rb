require 'spec_helper'

describe "qbits/new.html.haml" do
  before(:each) do
    assign(:qbit, stub_model(Qbit,
      :quotee => "MyString",
      :quote => "MyText"
    ).as_new_record)
  end

  it "renders new qbit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => qbits_path, :method => "post" do
      assert_select "input#qbit_quotee", :name => "qbit[quotee]"
      assert_select "textarea#qbit_quote", :name => "qbit[quote]"
    end
  end
end
