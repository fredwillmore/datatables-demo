require 'rails_helper'

describe CometsController do
  let(:valid_attributes) {
    { 
      full_name: "Test", 
      e: 0.7568277e-1, 
      q: 0.255839994e1, 
      i: 0.1059240163e2, 
      om: 0.8030985818e2, 
      w: 0.7290778936e2, 
      ad: 0.297736171e1, 
      tp_cal: 0.297736171e1, 
      per_y: 0.460499627e1, 
      comet_class: 'A', 
      data_arc: 67279, 
      condition_code: 0, 
      n_obs_used: 6461, 
      two_body: true, 
      a1: 0,
      a2: 0,
      a3: 0,
      dt: 0,
      m1: 0,
      k1: 0,
      m2: 0,
      k2: 0,
      pc: 0,
      diameter: 0.9394e3, 
      extent: "964.4 x 964.2 x 891.8", 
      albedo: 0.9e-1, 
      rot_per: 0.907417e1
    }
  }

  let(:invalid_attributes) {
    {
      xyz: 123,
      i: 'not a number'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AsteroidsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all comets as @comets" do
      comet = Comet.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:comets)).to eq([comet])
    end

    it 'gets JSON index' do
      FactoryBot.create :comet, full_name: 'Thing 1', diameter: 101, rot_per: 1, albedo: 1
      FactoryBot.create :comet, full_name: 'Thing 2', diameter: 1,   rot_per: 1, albedo: 1
      
      get :index, params: {
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
              column: 4,
              dir: 'asc'
            }
          },
          start: 0,
          length: 20
        }, session: valid_session, format: :json
      expect(response).to be_successful
      # TODO: how to test if 'order' is called in model
    end
  end
  
end
