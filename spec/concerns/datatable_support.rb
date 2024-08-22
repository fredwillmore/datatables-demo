require 'rails_helper'

shared_examples_for "datatable_support" do
  it "implements sort_by" do
    expect(described_class).to respond_to :sort_by
  end

  it "implements order_clause" do
    expect(described_class).to respond_to :order_clause
    # expect(described_class.order_clause sort_order: 'name', sort_direction: 'ASC').to eq 'full_name ASC'
  end
end