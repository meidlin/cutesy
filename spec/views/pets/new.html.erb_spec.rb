require 'rails_helper'

RSpec.describe "pets/new", :type => :view do
  before(:each) do
    assign(:pet, Pet.new(
      :age => 1,
      :name => "MyString",
      :sex => 1,
      :description => "MyString"
    ))
  end

  it "renders new pet form" do
    render

    assert_select "form[action=?][method=?]", pets_path, "post" do

      assert_select "input#pet_age[name=?]", "pet[age]"

      assert_select "input#pet_name[name=?]", "pet[name]"

      assert_select "input#pet_sex[name=?]", "pet[sex]"

      assert_select "input#pet_description[name=?]", "pet[description]"
    end
  end
end
