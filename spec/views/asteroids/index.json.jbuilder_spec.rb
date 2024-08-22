require 'rails_helper'

describe "asteroids/index.json.jbuilder", type: :view do
  before do
    create(:asteroid, id: 101, full_name: "Freddy 101")
    create(:asteroid, id: 202, full_name: "Somebody Else")
    # this is a de facto test of search as well
    assign(:asteroids, Asteroid.search("Freddy"))
    render template: 'asteroids/index', formats: [:json]
  end

  it "renders a list of asteroids" do
    rendered_values = JSON.parse(rendered)
    expect(rendered_values['recordsTotal']).to eq 2
    expect(rendered_values['recordsFiltered']).to eq 1
    expect(rendered_values['data'][0]['id']).to eq 101
    expect(rendered_values['data'][0]['full_name']).to eq "Freddy 101"
  end
end
