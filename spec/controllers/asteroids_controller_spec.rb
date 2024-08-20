require 'rails_helper'

describe AsteroidsController do
  describe "GET #index" do
    let(:params) do
      params = {
        draw: 1,
        columns: {
          '0' => {
            data: 0,
            name: 'id',
            searchable: true,
            orderable: true,
            search: {
              value: '',
              regex: false
            }
          }, 
          '1' => {
            data: 1,
            name: 'name',
            searchable: true,
            orderable: true,
            search: {
              value: '',
              regex: false
            }
          }, 
          '2' => {
            data: 2,
            name: 'rotations',
            searchable: true,
            orderable: true,
            search: {
              value: '',
              regex: false
            }
          }, 
          '3' => {
            data: 3,
            name: 'albedo',
            searchable: true,
            orderable: true,
            search: {
              value: '',
              regex: false
            }
          }, 
          '4' => {
            data: 4,
            name: 'diameter',
            searchable: true,
            orderable: true,
            search: {
              value: '',
              regex: false
            }
          }
        },
        order: {
          '0' => {
            column: order_column,
            dir: order_direction
          }
        },
        start: 0,
        length: 1
      }
    end

    let(:order_column) { 1 }
    let(:order_direction) { 'asc' }
    let(:json) { JSON.parse(response.body) }

    before do
      create :asteroid, full_name: 'Thing 1', diameter: 101, rot_per: 1, albedo: 0.55
      create :asteroid, full_name: 'Thing 2', diameter: 1,   rot_per: 1, albedo: 0.66

      get :index, params: params, format: :json
    end

    it 'responds with JSON' do
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      expect(json['draw']).to eq(1)
      expect(json['iTotalRecords']).to eq(2)
      expect(json['iTotalDisplayRecords']).to eq(1) # page length is 1
    end

    describe "results order" do
      context "when ordering by diameter" do
        let(:order_column) { 4 }
        
        context "with order direction asc" do
          let(:order_direction) { 'asc' }
          
          it "has the lower diameter record first" do
            expect(json['aaData'][0]['full_name']).to eq('Thing 2')
          end
        end
        
        context "with order direction desc" do
          let(:order_direction) { 'desc' }
          
          it "has the higher diameter record first" do
            expect(json['aaData'][0]['full_name']).to eq('Thing 1')
          end
        end
      end

      context "when ordering by albedo" do
        let(:order_column) { 3 }
        
        context "with order direction asc" do
          let(:order_direction) { 'asc' }
          
          it "has the lower albedo record first" do
            expect(json['aaData'][0]['full_name']).to eq('Thing 1')
          end
        end
        
        context "with order direction desc" do
          let(:order_direction) { 'desc' }
          
          it "has the higher albedo record first" do
            expect(json['aaData'][0]['full_name']).to eq('Thing 2')
          end
        end
      end
    end
  end
end
