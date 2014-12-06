require 'rails_helper'

RSpec.describe "pets/show", :type => :view do
  before(:each) do
    @pet = assign(:pet, Pet.create!(
      :age => 1,
      :name => "Name",
      :sex => 2,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
  end
end
