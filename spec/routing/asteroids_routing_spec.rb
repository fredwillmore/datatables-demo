require "rails_helper"

RSpec.describe AsteroidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/asteroids").to route_to("asteroids#index")
    end
  end
end
