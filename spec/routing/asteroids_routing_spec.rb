require "rails_helper"

RSpec.describe AsteroidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/asteroids").to route_to("asteroids#index")
    end

    it "routes to #new" do
      expect(:get => "/asteroids/new").to route_to("asteroids#new")
    end

    it "routes to #show" do
      expect(:get => "/asteroids/1").to route_to("asteroids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/asteroids/1/edit").to route_to("asteroids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/asteroids").to route_to("asteroids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/asteroids/1").to route_to("asteroids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/asteroids/1").to route_to("asteroids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/asteroids/1").to route_to("asteroids#destroy", :id => "1")
    end

  end
end
