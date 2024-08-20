class AsteroidsController < ApplicationController
  # before_action :set_asteroid, only: [:show, :edit, :update, :destroy]

  # GET /asteroids
  # GET /asteroids.json
  def index
    respond_to do |format|
      @asteroids = Asteroid.search(
        params.dig(:search, :value),
        { page: page,
          page_length: page_length,
          sort_order: sort_order,
          sort_direction: sort_direction } )
      format.html
      format.json
    end
  end
end
