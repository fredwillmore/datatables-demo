require 'rails_helper'

RSpec.describe "asteroids/index", type: :view do
  before(:each) do
    assign(:asteroids, [
      FactoryBot.create(:asteroid),
      FactoryBot.create(:asteroid)
    ])
  end

  it "renders a list of asteroids" do
    render
  end
end
