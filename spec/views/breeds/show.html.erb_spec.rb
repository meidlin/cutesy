require 'rails_helper'

RSpec.describe "breeds/show", :type => :view do
  before(:each) do
    @breed = assign(:breed, Breed.create!(
      :name => "Name",
      :pet_kind => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
