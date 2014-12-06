require 'rails_helper'

RSpec.describe "breeds/index", :type => :view do
  before(:each) do
    assign(:breeds, [
      Breed.create!(
        :name => "Name",
        :pet_kind => nil
      ),
      Breed.create!(
        :name => "Name",
        :pet_kind => nil
      )
    ])
  end

  it "renders a list of breeds" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
