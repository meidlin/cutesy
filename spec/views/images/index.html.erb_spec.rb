require 'rails_helper'

RSpec.describe "images/index", :type => :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :caption => "Caption"
      ),
      Image.create!(
        :caption => "Caption"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
  end
end
