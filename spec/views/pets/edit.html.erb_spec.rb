require 'rails_helper'

RSpec.describe "pets/edit", :type => :view do
  before(:each) do
    @pet = assign(:pet, Pet.create!(
      :age => 1,
      :name => "MyString",
      :sex => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit pet form" do
    render

    assert_select "form[action=?][method=?]", pet_path(@pet), "post" do

      assert_select "input#pet_age[name=?]", "pet[age]"

      assert_select "input#pet_name[name=?]", "pet[name]"

      assert_select "input#pet_sex[name=?]", "pet[sex]"

      assert_select "input#pet_description[name=?]", "pet[description]"
    end
  end
end
