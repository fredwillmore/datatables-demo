require 'rails_helper'
require Rails.root.join "spec/concerns/datatable_support.rb"

describe Asteroid do
  it { is_expected.to validate_presence_of :full_name }
  [ 
    :a, :e, :i, :om, :w, :q, :ad, :per_y, :data_arc, :condition_code, :n_obs_used, 
    :n_del_obs_used, :n_dop_obs_used, :h, :diameter, :albedo, :rot_per, :gm, :bv, :ub 
  ].each do |field|
    it { is_expected.to validate_numericality_of field }
  end

  it_behaves_like "datatable_support"
  
  describe '.search' do
    before do
      @acme = FactoryBot.create :asteroid, full_name: "Acme", rot_per: 10
      @zenith = FactoryBot.create :asteroid, full_name: "Zenith", rot_per: 1
    end

    describe 'by name' do
      let(:results) { Asteroid.search('acmE') }

      it 'returns matching asteroids' do
        expect(results).to include(@acme)
      end
    end

    describe 'sort by rotations' do
      let(:results) { Asteroid.search('', {sort_order: 'rot_per', sort_direction: :asc}) }

      it 'returns asteroids ordered by rot_per' do
        expect(results.to_a).to eq [@zenith, @acme]
      end
    end
  end
  
end
