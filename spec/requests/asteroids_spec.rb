require 'rails_helper'

RSpec.describe "Asteroids", type: :request do
  describe "GET /asteroids" do
    it "works! (now write some real specs)" do
      get asteroids_path
      expect(response).to have_http_status(200)
    end
  end
end
