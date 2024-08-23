require 'rails_helper'

describe "asteroids/index", type: :view do
  before do
    allow(Asteroid).to receive(:datatable_columns).and_return(
      {
        id: { header_text: "ID Foo", orderable: 'false', searchable: 'false' },
        full_name: { header_text: "Full Name Config Value", searchable: 'true', orderable: 'true' },
      }
    )
  end

  it "renders the table headers with text provided by datatable_columns" do
    render
    expect(rendered).to have_text("ID Foo")
      .and have_text("Full Name Config Value")
  end
end
