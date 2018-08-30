require 'rails_helper'

RSpec.describe "asteroids/edit", type: :view do
  before(:each) do
    @asteroid = assign(:asteroid, FactoryBot.create(:asteroid))
  end

  it "renders the edit asteroid form" do
    render

    assert_select "form[action=?][method=?]", asteroid_path(@asteroid), "post" do
    end
  end
end
