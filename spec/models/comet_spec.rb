require 'rails_helper'
require Rails.root.join "spec/concerns/datatable_support.rb"

describe Comet do
  it { is_expected.to validate_presence_of :full_name }
  [ 
    :e,
    :q,
    :i,
    :om,
    :w,
    :ad,
    :tp_cal,
    :per_y,
    :a1,
    :a2,
    :a3,
    :dt,
    :m1,
    :k1,
    :m2,
    :k2,
    :pc,
    :diameter,
    :albedo,
    :rot_per,

    :data_arc,
    :condition_code,
    :n_obs_used
  ].each do |field|
    it { is_expected.to validate_numericality_of field }
  end

  it_behaves_like "datatable_support"
  
  describe '.search' do
    before do
      @acme = FactoryBot.create :comet, full_name: "Acme", albedo: 0.9
      @zenith = FactoryBot.create :comet, full_name: "Zenith", albedo: 0.1
    end

    describe 'by name' do
      let(:results) { Comet.search('acmE') }

      it 'returns matching comets' do
        expect(results).to include(@acme)
      end
    end

    describe 'sort by albedo' do
      let(:results) { Comet.search('', {sort_order: 'albedo', sort_direction: :asc}) }

      it 'returns comets ordered by albedo' do
        expect(results.to_a).to eq [@zenith, @acme]
      end
    end
  end
  
end
