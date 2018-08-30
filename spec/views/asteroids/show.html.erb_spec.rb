require 'rails_helper'

RSpec.describe "asteroids/show", type: :view do
  before(:each) do
    @asteroid = assign(:asteroid, FactoryBot.create(:asteroid))
  end

  it "renders attributes in <p>" do
    render
  end
end
