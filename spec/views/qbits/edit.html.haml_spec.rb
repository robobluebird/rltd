require 'spec_helper'

describe "qbits/edit.html.haml" do
  before(:each) do
    @qbit = assign(:qbit, stub_model(Qbit,
      :quotee => "MyString",
      :quote => "MyText"
    ))
  end

  it "renders the edit qbit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => qbits_path(@qbit), :method => "post" do
      assert_select "input#qbit_quotee", :name => "qbit[quotee]"
      assert_select "textarea#qbit_quote", :name => "qbit[quote]"
    end
  end
end
