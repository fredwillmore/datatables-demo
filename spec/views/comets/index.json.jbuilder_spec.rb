require 'rails_helper'

describe "comets/index.json.jbuilder", type: :view do
  before do
    create(:comet, id: 101, full_name: "Freddy 101")
    create(:comet, id: 202, full_name: "Somebody Else")
    # this is a de facto test of search as well
    assign(:comets, Comet.search("Freddy"))
    render template: 'comets/index', formats: [:json]
  end

  it "renders a list of comets" do
    rendered_values = JSON.parse(rendered)
    expect(rendered_values['recordsTotal']).to eq 2
    expect(rendered_values['recordsFiltered']).to eq 1
    expect(rendered_values['data'][0]['id']).to eq 101
    expect(rendered_values['data'][0]['full_name']).to eq "Freddy 101"
  end
end
