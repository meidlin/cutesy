require 'rails_helper'

RSpec.describe "pets/index", :type => :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
        :age => 1,
        :name => "Name",
        :sex => 2,
        :description => "Description"
      ),
      Pet.create!(
        :age => 1,
        :name => "Name",
        :sex => 2,
        :description => "Description"
      )
    ])
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
