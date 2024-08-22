require 'rails_helper'

describe "comets/index", type: :view do
  it "renders the table headers with text" do
    render
    expect(rendered).to have_text("ID")
      .and have_text("Full Name")
      .and have_text("Diameter (km)")
      .and have_text("Albedo")
  end
end
