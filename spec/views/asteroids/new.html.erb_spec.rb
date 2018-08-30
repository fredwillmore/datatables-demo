require 'rails_helper'

RSpec.describe "asteroids/new", type: :view do
  before(:each) do
    assign(:asteroid, Asteroid.new())
  end

  it "renders new asteroid form" do
    render

    assert_select "form[action=?][method=?]", asteroids_path, "post" do
    end
  end
end
