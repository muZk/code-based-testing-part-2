require 'rails_helper'

RSpec.describe "code_names/new", :type => :view do
  before(:each) do
    assign(:code_name, CodeName.new(
      :name => "MyString",
      :info_reference => "MyString"
    ))
  end

  it "renders new code_name form" do
    render

    assert_select "form[action=?][method=?]", code_names_path, "post" do

      assert_select "input#code_name_name[name=?]", "code_name[name]"

      assert_select "input#code_name_info_reference[name=?]", "code_name[info_reference]"
    end
  end
end
