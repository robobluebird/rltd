require 'spec_helper'

describe "acks/new.html.haml" do
  before(:each) do
    assign(:ack, stub_model(Ack,
      :sent_by => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new ack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => acks_path, :method => "post" do
      assert_select "input#ack_sent_by", :name => "ack[sent_by]"
      assert_select "textarea#ack_body", :name => "ack[body]"
    end
  end
end
